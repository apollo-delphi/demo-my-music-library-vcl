unit fLibraryBrowser;

interface

uses
  Apollo_MVC_Core,
  Apollo_Types,
  eArtist,
  eCommon,
  fArtist,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows;

type
  TfrmLibraryBrowser = class(TFrame)
    tvLibraryTree: TTreeView;
    pnlButtons: TPanel;
    btnEdit: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    pnlDetails: TPanel;
    btnNewArtist: TButton;
    btnDelete: TButton;
    procedure tvLibraryTreeChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNewArtistClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    FArtistFrame: TfrmArtist;
    FCancelMethod: TSimpleMethod;
    FCurrentFrame: TFrame;
    FDeleteMethod: TSimpleMethod;
    FIsEditMode: Boolean;
    FSaveMethod: TSimpleMethod;
    FViewBase: IViewBase;
    function GetArtistFrame: TfrmArtist;
    procedure SetEditMode;
    procedure SetReadOnlyMode;
  public
    procedure AfterConstruction; override;
    procedure RemoveNodeBySource(aSource: TEntity);
    procedure RenderArtist(aArtist: TArtist; const aSelect: Boolean = False);
    procedure RenderArtistList(aArtistList: TArtistList);
  end;

implementation

{$R *.dfm}

uses
  Apollo_BindingVCL,
  Apollo_HelpersVCL,
  Apollo_MVC_VCL;

{ TfrmLibraryBrowser }

procedure TfrmLibraryBrowser.AfterConstruction;
begin
  inherited;

  RegisterFrame(FViewBase);
end;

procedure TfrmLibraryBrowser.btnCancelClick(Sender: TObject);
begin
  SetReadOnlyMode;

  if Assigned(FCancelMethod) then
    FCancelMethod;
end;

procedure TfrmLibraryBrowser.btnDeleteClick(Sender: TObject);
begin
  if Assigned(FDeleteMethod) then
    FDeleteMethod;

  SetReadOnlyMode;
end;

procedure TfrmLibraryBrowser.btnEditClick(Sender: TObject);
begin
  SetEditMode;
end;

procedure TfrmLibraryBrowser.btnNewArtistClick(Sender: TObject);
begin
  FireEvent(FViewBase, 'NewArtist');
  SetEditMode;
end;

procedure TfrmLibraryBrowser.btnSaveClick(Sender: TObject);
begin
  SetReadOnlyMode;

  if Assigned(FSaveMethod) then
    FSaveMethod;
end;

function TfrmLibraryBrowser.GetArtistFrame: TfrmArtist;
begin
  if not Assigned(FArtistFrame) then
    FArtistFrame := TfrmArtist.Create(Owner);

  Result := FArtistFrame;
end;

procedure TfrmLibraryBrowser.RemoveNodeBySource(aSource: TEntity);
var
  Node: TTreeNode;
begin
  Node := TBind.GetControlItemOrNode<TTreeNode>(tvLibraryTree, aSource);
  tvLibraryTree.Items.Delete(Node);
end;

procedure TfrmLibraryBrowser.RenderArtist(aArtist: TArtist; const aSelect: Boolean);
var
  Node: TTreeNode;
begin
  Node := TBind.BindToControlNode<TTreeNode>(aArtist, tvLibraryTree, nil{aParentNode},
    procedure(aSource: TObject)
    begin
      tvLibraryTree.Selected.Text := (aSource as TArtist).Name;
    end
  );
  Node.Text := aArtist.Name;

  if aSelect then
    tvLibraryTree.Select(Node);
end;

procedure TfrmLibraryBrowser.RenderArtistList(aArtistList: TArtistList);
var
  Artist: TArtist;
begin
  for Artist in aArtistList do
    RenderArtist(Artist);
end;

procedure TfrmLibraryBrowser.SetEditMode;
begin
  btnEdit.Enabled := False;
  btnDelete.Enabled := False;
  btnSave.Enabled := True;
  btnCancel.Enabled := True;

  TrySetReadOnly([FCurrentFrame], False{aReadOnly}, True{aRecursively});
  FIsEditMode := True;
end;

procedure TfrmLibraryBrowser.SetReadOnlyMode;
begin
  if tvLibraryTree.Items.Count > 0 then
  begin
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
    pnlDetails.Visible := True;
  end
  else
  begin
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    pnlDetails.Visible := False;
  end;

  btnSave.Enabled := False;
  btnCancel.Enabled := False;

  TrySetReadOnly([FCurrentFrame], True{aReadOnly}, True{aRecursively});
  FIsEditMode := False;
end;

procedure TfrmLibraryBrowser.tvLibraryTreeChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
var
  Artist: TArtist;
begin
  if FIsEditMode then
    btnCancel.OnClick(nil);

  FCurrentFrame := nil;
  FSaveMethod := nil;
  FCancelMethod := nil;
  FDeleteMethod := nil;

  if Node.Level = 0 then
  begin
    Artist := TArtist(Node.Data);

    GetArtistFrame.RenderArtist(Artist);
    FCurrentFrame := GetArtistFrame;
    FSaveMethod := GetArtistFrame.SaveEvent;
    FCancelMethod := GetArtistFrame.RevertEvent;
    FDeleteMethod := GetArtistFrame.DeleteEvent;
  end;

  SetReadOnlyMode;
  TVCLTools.ShowFrame(pnlDetails, FCurrentFrame);
  tvLibraryTree.SetFocus;
end;

end.
