unit uXMLUtils;

interface

uses
  XMLDoc, XmlIntf;

type
  TXMLUtils = class
  private
    FXML: IXMLDocument;
    FRootNode: IXMLNode;
  public
    property XML: IXMLDocument read FXML write FXML;
    constructor Create(rootName: string);

    function AddElement(ElemName: string; ElemValue: string = ''): IXMLNode; overload;
    function AddElement(ParentNode: IXMLNode; ElemName, ElemValue: string): IXMLNode; overload;
    function AddNode(NodeName: string): IXMLNode;
    function AddAttribute(Node: IXMLNode; AttrName: string; AttrValue: string = ''): IXMLNode;
    function XMLText(Formatted: Boolean = False): string;
  end;

const
  cFormattedXML = True;

implementation


{ TXMLUtils }

constructor TXMLUtils.Create(rootName: string);
var
  node: IXMLNode;
begin
  FXML := NewXMLDocument;
  FRootNode := FXML.AddChild(rootName);
end;

function TXMLUtils.XMLText(Formatted: Boolean = False) : string;
begin
  Result := FXML.XML.Text;
  if Formatted then
    Result := FormatXMLData(Result);
end;

function TXMLUtils.AddElement(ElemName: string; ElemValue: string = ''): IXMLNode;
var
  node: IXMLNode;
begin
  Result := FRootNode.AddChild(ElemName);

  if ElemValue <> '' then
    Result.NodeValue := ElemValue;
end;

function TXMLUtils.AddElement(ParentNode: IXMLNode; ElemName, ElemValue: string): IXMLNode;
begin
  Result := ParentNode.AddChild(ElemName);
  Result.NodeValue := ElemValue;
end;

function TXMLUtils.AddNode(NodeName: string): IXMLNode;
begin
  Result := FXML.CreateElement(NodeName, '');
end;

function TXMLUtils.AddAttribute(Node: IXMLNode; AttrName: string; AttrValue: string = ''): IXMLNode;
begin
  Node.Attributes[AttrName] := AttrValue;
  Result := Node;
end;

end.
