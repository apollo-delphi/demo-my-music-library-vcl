object ViewMain: TViewMain
  Left = 0
  Top = 0
  Caption = 'My Music Libraray - Delphi Apollo Library Demo for VCL '
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLibraryBrowser: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 385
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlLibraryBrowser'
    ShowCaption = False
    TabOrder = 0
  end
  object btnTest: TButton
    Left = 528
    Top = 408
    Width = 75
    Height = 25
    Caption = 'btnTest'
    TabOrder = 1
    OnClick = btnTestClick
  end
end
