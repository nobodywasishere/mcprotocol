require "crygen"
require "json"

schema = ARGV[0]? || "#{__DIR__}/../schema.json"
json = JSON.parse(File.read(schema))

`mkdir -p '#{__DIR__}/mcprotocol'`

json.as_h["definitions"].as_h.each do |name, obj|
  obj = obj.as_h

  mcp = CGT::Module.new("MCProtocol")

  if obj["type"]? == "object"
    convert_obj(mcp, name, "", obj)
  else
    type = convert_format(mcp, name, "", obj)

    alias_type = CGT::Alias.new(name, [type])

    if docs = obj["description"]?.try(&.as_s)
      alias_type.add_comment(docs)
    end

    if name != type
      mcp.add_object(alias_type)
    end
  end

  File.write("#{__DIR__}/mcprotocol/#{name.underscore}.cr", mcp.generate)
end

def convert_obj(mcp, klass_name, param_name, obj)
  obj_name = "#{klass_name}#{param_name.camelcase}"

  required = obj["required"]?.try(&.as_a?).try(&.map(&.as_s?)) || %w[]
  params = CGT::Class.new(obj_name)
  if docs = obj["description"]?.try(&.as_s)
    params.add_comment(docs)
  end

  params.add_include("JSON::Serializable")

  if props = obj["properties"]?.try(&.as_h?)
    props.each do |k, v|
      type = convert_format(mcp, obj_name, k, v)
      if !k.in?(required) && type && !v["const"]?
        type += "?"
      end

      if type.nil?
        raise "Could not generate type for #{klass_name} #{param_name}"
      end

      value = v["const"]?.try(&.as_s?).try { |i| "\"#{i}\"" }
      params.add_property(
        CGE::PropVisibility::Getter,
        name: k,
        type: type,
        value: value,
        comment: v["description"]?.try(&.as_s?)
      )
    end
  end

  initialize_method(params, obj)

  mcp.add_object(params)

  obj_name
end

def convert_format(mcp : CGT::Module, klass_name, obj_name, obj)
  if ref = obj["$ref"]?.try(&.as_s?)
    return ref.lchop("#/definitions/")
  end

  case obj["format"]?.try(&.as_s?)
  when "uri", "uri-template"
    return "URI"
  end

  if enum_obj = obj["enum"]?.try(&.as_a?).try(&.map(&.as_s))
    enum_name = "#{klass_name}#{obj_name.camelcase}"
    enum_klass = CGT::Enum.new(enum_name)

    if docs = obj["description"]?.try(&.as_s)
      enum_klass.add_comment(docs)
    end

    enum_obj.each do |item|
      enum_klass.add_constant(item.camelcase)
    end

    mcp.add_object(enum_klass)

    return enum_name
  end

  case obj["type"]?.try(&.as_s?)
  when "string"
    return "String"
  when "integer"
    return "Int64"
  when "number"
    return "Float64"
  when "boolean"
    return "Bool"
  when "object"
    if obj["additionalProperties"]?
      return "JSON::Any"
    end

    return convert_obj(mcp, klass_name, obj_name, obj)
  when "array"
    if ref = obj["items"]?.try(&.as_h?).try(&.["$ref"]?).try(&.as_s?)
      return "Array(#{ref.lchop("#/definitions/")})"
    end

    return "Array(String)"
  end

  if any_of = obj["anyOf"]?.try(&.as_a?)
    types = [] of String

    any_of.each do |any|
      types << convert_format(mcp, klass_name, "anyOf", any)
    end

    return types.join(" | ")
  end

  "JSON::Any"
end

def initialize_method(klass, obj)
  method = CGT::Method.new("initialize", "self")
  required = obj["required"]?.try(&.as_a?).try(&.map(&.as_s?)) || %w[]

  klass.@properties.each do |prop|
    next if !prop[:name].in?(required) || prop[:value]?

    prop_name = "@#{prop[:name]}"
    method.add_arg(prop_name, prop[:type] || "Nil")
  end

  klass.@properties.each do |prop|
    next if prop[:name] == "method"
    next if prop[:name].in?(required) && !prop[:value]?

    prop_name = "@#{prop[:name]}"
    method.add_arg(prop_name, prop[:type] || "Nil", prop[:value]? || "Nil")
  end

  klass.add_method(method)
end
