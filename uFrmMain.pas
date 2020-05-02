unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, XMLDoc, XMLIntf,
  uXMLUtils;

type
  TFrmMain = class(TForm)
    Memo: TMemo;
    Panel1: TPanel;
    btnXML: TButton;
    procedure btnXMLClick(Sender: TObject);
  private
    FXML: IXMLDocument;
    XMLUtils: TXMLUtils;
    procedure CreateXML;
    procedure AddBook(id, author, title, genre, price, publish_date,
      description: string);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.btnXMLClick(Sender: TObject);
begin
  CreateXML;
end;

procedure TFrmMain.CreateXML;
var
  book: IXMLNode;
  author: IXMLNode;
begin
  XMLUtils := TXMLUtils.Create('catalog');
  try
    AddBook('bk101', 'Gambardella, Matthew',
            'XML Developer''s Guide', 'Computer',
            '44.95', '2000-10-01',
            'An in-depth look at creating applications with XML.');

    AddBook('bk102', 'Ralls, Kim',
            'Midnight Rain', 'Fantasy',
            '5.95', '2000-12-16',
            'A former architect battles corporate zombies, '+
              'an evil sorceress, and her own childhood to become queen '+
              'of the world..');
    Memo.Lines.Text := XMLUtils.XMLText(True);
  finally
    XMLUtils.Free;
  end;
end;

procedure TFrmMain.AddBook(id, author, title, genre, price, publish_date, description: string);
var
  book: IXMLNode;
begin
  book := XMLUtils.AddElement('book');
  book := XMLUtils.AddAttribute(book, 'id', id);
  XMLUtils.AddElement(book, 'author', author);
  XMLUtils.AddElement(book, 'title', title);
  XMLUtils.AddElement(book, 'genre', genre);
  XMLUtils.AddElement(book, 'price', price);
  XMLUtils.AddElement(book, 'publish_date', publish_date);
  XMLUtils.AddElement(book, 'description', description);
end;

end.
