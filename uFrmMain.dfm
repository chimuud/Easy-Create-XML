object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 461
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 41
    Width = 582
    Height = 420
    Align = alClient
    Lines.Strings = (
      'Memo')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 41
    Align = alTop
    TabOrder = 1
    object btnXML: TButton
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = 'XML Test'
      TabOrder = 0
      OnClick = btnXMLClick
    end
  end
end
