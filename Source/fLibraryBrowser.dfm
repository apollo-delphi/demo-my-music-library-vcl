object frmLibraryBrowser: TfrmLibraryBrowser
  Left = 0
  Top = 0
  Width = 631
  Height = 468
  TabOrder = 0
  object tvLibraryTree: TTreeView
    Left = 0
    Top = 41
    Width = 297
    Height = 427
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnChanging = tvLibraryTreeChanging
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlActions'
    ShowCaption = False
    TabOrder = 1
    object btnEdit: TButton
      Left = 299
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Edit'
      Enabled = False
      TabOrder = 0
      OnClick = btnEditClick
    end
    object btnSave: TButton
      Left = 475
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Save'
      Enabled = False
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnCancel: TButton
      Left = 553
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      Enabled = False
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnNewArtist: TButton
      Left = 2
      Top = 8
      Width = 75
      Height = 25
      Caption = 'New Artist'
      TabOrder = 3
      OnClick = btnNewArtistClick
    end
    object btnDelete: TButton
      Left = 377
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Delete'
      Enabled = False
      TabOrder = 4
      OnClick = btnDeleteClick
    end
  end
  object pnlDetails: TPanel
    Left = 297
    Top = 41
    Width = 334
    Height = 427
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlDetails'
    ShowCaption = False
    TabOrder = 2
  end
end
