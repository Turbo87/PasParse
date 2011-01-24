import yaml

def replace_types(type):
  type = type.replace("DelimitedItemNode<AstNode>", "DelimitedItemNode")
  type = type.replace("AstNode", "ASTNode")
  if type.startswith("ListNode"): type = "ListNode";
  return type

def generate_nodes(yaml_content):
  cs = "unit UGeneratedNodes;\n\n"
  cs += "/////////////////////////////////////////\n"
  cs += "// This file is generated! Don't edit! //\n"
  cs += "/////////////////////////////////////////\n\n"
  cs += "interface\n\n"
  cs += "uses\n"
  cs += "  UNonTerminalNode, UASTNode, UToken, UListNode;\n\n"
  cs += "type\n"
  cs += "  // Forward declarations\n"

  node_types = sorted(yaml_content.get("NodeTypes").items())
  for node_type in node_types:
    node_type_name = node_type[0]
    cs += "  T" + node_type_name + " = class;\n"
  
  cs += "\n";
  cs += "  // Real declarations\n"
  for node_type in node_types:
    node_type_name = node_type[0]
    properties = node_type[1]
    
    cs += "  T" + node_type_name + " = class(TNonTerminalNode)\n"
    cs += "  private\n"
    for property in properties:
      cs += "    F" + property.get('Name') + ": T" + replace_types(property.get('Type')) + ";\n"
    
    cs += "\n"
    cs += "  public\n"

    params = []
    for property in properties:
      params.append("A" + property.get('Name') + ": T" + replace_types(property.get('Type')));
      
    cs += "    constructor Create(" + '; '.join(params) + ");\n"
    cs += "\n"

    cs += "    function Clone: TASTNode; override;\n"
    cs += "\n"

    for property in properties:
      cs += "    property " + property.get('Name') + ": T" + replace_types(property.get('Type')) + " read F" + property.get('Name') + ";\n"

    # Special case for DirectiveNode
    if node_type_name == "DirectiveNode":
      cs += "\n"
      cs += "    // Additional method(s)\n"
      cs += "    function ForbidsBody: Boolean;\n"

    # Special case for MethodHeadingNode
    if node_type_name == "MethodHeadingNode":
      cs += "\n"
      cs += "    // Additional method(s)\n"
      cs += "    function RequiresBody: Boolean;\n"

    cs += "  end;\n"
    cs += "\n"

  cs += "implementation\n\n"
  cs += "uses\n"
  cs += "  UTokenType;\n\n"

  for node_type in node_types:
    node_type_name = node_type[0]
    properties = node_type[1]
    
    cs += "{ T" + node_type_name + " }\n\n"

    cs += "function T" + node_type_name + ".Clone: TASTNode;\n"
    cs += "begin\n"

    params = []
    for property in properties:
      params.append("F" + property.get('Name') + ".Clone as T" + replace_types(property.get('Type')));

    cs += "  Result := T" + node_type_name + ".Create(\n    " + ',\n    '.join(params) + ");\n"
    cs += "end;\n\n"

    params = []
    for property in properties:
      params.append("A" + property.get('Name') + ": T" + replace_types(property.get('Type')));
      
    cs += "constructor T" + node_type_name + ".Create(" + '; '.join(params) + ");\n"
    cs += "begin\n"
    cs += "  inherited Create;\n\n"
    
    cs += "  // Assigning private members\n"
    for property in properties:
      cs += "  F" + property.get('Name') + " := A" + property.get('Name') + ";\n"

    cs += "\n"

    cs += "  // Adding child nodes\n"
    for property in properties:
      cs += "  FChildNodes.Add(A" + property.get('Name') + ");\n"

    cs += "\n"

    cs += "  // Adding properties\n"
    for property in properties:
      cs += "  FProperties.Add(TASTNode.TProperty.Create('" + property.get('Name') + "', A" + property.get('Name') + "));\n"

    cs += "end;\n\n"

    # Special case for DirectiveNode
    if node_type_name == "DirectiveNode":
      cs += "function TDirectiveNode.ForbidsBody: Boolean;\n"
      cs += "begin\n"
      cs += "  // Forward or External directives must not have a body!\n"
      cs += "  Result := (FKeywordNode.TokenType = TTForwardSemikeyword) or\n"
      cs += "    (FKeywordNode.TokenType = TTExternalSemikeyword);\n"
      cs += "end;\n\n"

    # Special case for MethodHeadingNode
    if node_type_name == "MethodHeadingNode":
      cs += "function TMethodHeadingNode.RequiresBody: Boolean;\n"
      cs += "var\n"
      cs += "  I: Integer;\n"
      cs += "begin\n"
      cs += "  // Methods that are not Forward or External must have a body!\n"
      cs += "  Result := True;\n"
      cs += "  // Iterate through method directives to find forward/external keyword\n"
      cs += "  for I := 0 to FDirectiveListNode.ItemsCount - 1 do\n"
      cs += "    if (FDirectiveListNode.Items[I] as TDirectiveNode).ForbidsBody then\n"
      cs += "    begin\n"
      cs += "      // forward/external keyword found -> stop iterating and return False\n"
      cs += "      Result := False;\n"
      cs += "      Break;\n"
      cs += "    end;\n"
      cs += "end;\n\n"

  cs += "end.\n"
  return cs

file = open("CodeGen.yaml");
yaml_content = yaml.load(file)
file.close()

file = open("PasParse/UGeneratedNodes.pas", "w")
file.write(generate_nodes(yaml_content))
file.close()
