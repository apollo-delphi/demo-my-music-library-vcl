unit fLibraryBrowser;

interface

uses
  eArtist,
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
  Winapi.Messages,
  Winapi.Windows;

type
  TfrmLibraryBrowser = class(TFrame)
    pnlDetailContainer: TPanel;
    tvLibraryTree: TTreeView;
    procedure tvLibraryTreeChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
  private
    FArtistFrame: TfrmArtist;
    function GetArtistFrame: TfrmArtist;
  public
    procedure RenderArtistList(aArtistList: TArtistList);
  end;

implementation

{$R *.dfm}

uses
  Apollo_BindingVCL,
  Apollo_HelpersVCL;

{ TfrmLibraryBrowser }

function TfrmLibraryBrowser.GetArtistFrame: TfrmArtist;
begin
  if not Assigned(FArtistFrame) then
    FArtistFrame := TfrmArtist.Create(Self);

  Result := FArtistFrame;
end;

procedure TfrmLibraryBrowser.RenderArtistList(aArtistList: TArtistList);
var
  Artist: TArtist;
  Node: TTreeNode;
begin
  for Artist in aArtistList do
  begin
    Node := TBind.BindToControlNode<TTreeNode>(Artist, tvLibraryTree, nil{aParentNode});
    Node.Text := Artist.Name;
  end;
end;

procedure TfrmLibraryBrowser.tvLibraryTreeChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
var
  Artist: TArtist;
begin
  if Node.Level = 0 then
  begin
    Artist := TArtist(Node.Data);

    GetArtistFrame.RenderArtist(Artist);
    TVCLTools.ShowFrame(pnlDetailContainer, GetArtistFrame);
  end;
end;

end.
