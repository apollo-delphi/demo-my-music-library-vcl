object frmLibraryBrowser: TfrmLibraryBrowser
  Left = 0
  Top = 0
  Width = 469
  Height = 358
  TabOrder = 0
  object pnlDetailContainer: TPanel
    Left = 241
    Top = 0
    Width = 228
    Height = 358
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlDetailContainer'
    ShowCaption = False
    TabOrder = 0
  end
  object tvLibraryTree: TTreeView
    Left = 0
    Top = 0
    Width = 241
    Height = 358
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 1
    OnChanging = tvLibraryTreeChanging
  end
end
