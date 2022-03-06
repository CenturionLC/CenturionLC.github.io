program Gwent_p;

uses
  Forms,
  Gwent_u in 'Gwent_u.pas' {frmLauncher},
  frmMain_u in 'frmMain_u.pas' {frmMainMenu},
  Play_u in 'Play_u.pas' {frmPlayingField},
  Scoreboard_u in 'Scoreboard_u.pas' {frmPlayerStats},
  dmPlayerData_u in 'dmPlayerData_u.pas' {dmPlayerData: TDataModule},
  frmDeck_u in 'frmDeck_u.pas' {frmDeck},
  Constants_u in 'Constants_u.pas',
  SettingsAndResult_u in 'SettingsAndResult_u.pas' {frmThroneRoom};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLauncher, frmLauncher);
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TfrmPlayingField, frmPlayingField);
  Application.CreateForm(TfrmPlayerStats, frmPlayerStats);
  Application.CreateForm(TdmPlayerData, dmPlayerData);
  Application.CreateForm(TfrmDeck, frmDeck);
  Application.CreateForm(TfrmThroneRoom, frmThroneRoom);
  Application.Run;
end.
