unit frmMain_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons,Scoreboard_u,frmDeck_u,dmPlayerData_u,SettingsAndResult_u,Constants_u;

type
  TfrmMainMenu = class(TForm)
    btnPlay: TButton;
    btnDeck: TButton;
    pnlProfile: TPanel;
    lblName: TLabel;
    lblLevel: TLabel;
    lblEXP: TLabel;
    imgOrc: TImage;
    imgMankind: TImage;
    lblWelcome: TLabel;
    lblUsername: TLabel;
    lblUserLevel: TLabel;
    lblUserEXP: TLabel;
    imgBackground: TImage;
    imgExit: TImage;
    btnScoreboard: TButton;
    btnExit: TBitBtn;
    lblDate: TLabel;
    lblUserDate: TLabel;
    lblUserNumShow: TLabel;
    lblUserNum: TLabel;
    procedure btnScoreboardClick(Sender: TObject);
    procedure btnDeckClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

{$R *.dfm}

uses Gwent_u;

procedure TfrmMainMenu.btnDeckClick(Sender: TObject);
begin
  With frmDeck do
  begin
  imgMain.Picture.LoadFromFile(ImagesLocation+'Launcher2.jpg');
  imgBackGround.Picture.LoadFromFile(ImagesLocation+'Picture.jpg');

  pnlDisplay.Hide;
  mmoInfo.Clear;

  ShowModal;
  end;
end;

procedure TfrmMainMenu.btnPlayClick(Sender: TObject);
begin
  with frmThroneRoom do
  begin
  edtPlayer2Name.Clear;
  edtPlayer2Password.Clear;
  cbbPlayer1Deck.Text:='Colonial';
  cbbPlayer2Deck.Text:='Colonial';

  ShowModal;
  end;

end;

procedure TfrmMainMenu.btnScoreboardClick(Sender: TObject);
begin
  frmPlayerStats.ShowModal;
end;

procedure TfrmMainMenu.FormActivate(Sender: TObject);
begin
   lblWelcome.Caption:='Welcome back '+dmPlayerData.tblPlayers['Username']+'!';
   lblUsername.Caption:= dmPlayerData.tblPlayers['Username'];
   lblUserLevel.Caption:=dmPlayerData.tblPlayers['Level'];
   lblUserExp.Caption:=dmPlayerData.tblPlayers['Exp'];     //Exp verwys na experience
   lblUserNumShow.Caption:=IntToStr(dmPlayerData.tblPlayers['User num:']);
end;

procedure TfrmMainMenu.FormCreate(Sender: TObject);
begin
  lblUserDate.Caption:=DateToStr(Date);
end;

end.
