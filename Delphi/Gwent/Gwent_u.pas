unit Gwent_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Imaging.jpeg,frmMain_u,dmPlayerData_u,SettingsAndResult_u,
  Vcl.Buttons,DB,Constants_u,ScoreBoard_u;

type
  TfrmLauncher = class(TForm)
    lblTitle: TLabel;
    btnLogin: TButton;
    edtName: TEdit;
    edtPassword: TEdit;
    lblName: TLabel;
    lblPassword: TLabel;
    btnNewAccount: TButton;
    imgLauncher: TImage;
    BitBtnExit: TBitBtn;
    imgExit: TImage;
    procedure btnLoginClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnNewAccountClick(Sender: TObject);
    procedure ValidateData;
  private
   sAnswer:String;
   bVlag:Boolean;

  public
     sName,sPassword:String;
     bAdmin:Boolean;
  end;
   { nota: Alle constants is in n aparte unit Constants_u gestoor. Dit is net sodat die constants deur die hele program
   gebruik kan word.}
var
  frmLauncher: TfrmLauncher;
implementation

{$R *.dfm}



procedure TfrmLauncher.btnLoginClick(Sender: TObject);

begin
  ValidateData;
   if bVlag then
   begin
   frmMainMenu.Show;
   frmLauncher.Hide;
   end;
end;

procedure TfrmLauncher.btnNewAccountClick(Sender: TObject);

begin
  ValidateData;
  if bVlag then
  begin
  frmMainMenu.Show;
  frmLauncher.Hide;
  end;
end;

procedure TfrmLauncher.FormActivate(Sender: TObject);

begin
  btnLogin.Enabled:=False;
  btnNewAccount.Enabled:=False;
  while (btnLogin.Enabled=False) and (btnNewAccount.Enabled=False) do
  begin
  
  sAnswer:=InputBox('Greetings!','Hello and Welcome to gwent! Do you already have an account?(Yes/No)','Yes');

  if sAnswer='Yes' then
  btnLogin.Enabled:=True
  else if sAnswer='No' then btnNewAccount.Enabled:=True
  else ShowMessage('Please answer yes or no');
  end;
  edtName.SetFocus;
end;

procedure TfrmLauncher.ValidateData;
var
  K,iNum:Integer;
  bFound:Boolean;
begin
  bVlag:=False;
  sName:=edtName.Text;
  sPassword:=(edtPassword.Text);

    if sAnswer='No' then
  begin

    if (Length(sPassword)>15)  then
    begin
      edtPassword.Clear;
      edtPassword.SetFocus;
      ShowMessage('The Password you entered is too long');
    end;

    if sPassword=''  then
    begin
      edtPassword.Clear;
      edtPassword.SetFocus;
      ShowMessage('Please enter a Password.');
    end;


  if (Length(sName)>15)  then
    begin
      edtName.Clear;
      edtName.SetFocus;
      ShowMessage('The name you entered is too long');
    end;
  if sName=''  then
    begin
      edtName.Clear;
      edtName.SetFocus;
      ShowMessage('Please enter a name.');
    end;

  for K := 1 to Length(sName) do
    begin
    if sName[K] in['*','-','/','+','`'] then
    begin
      edtName.Clear;
      edtName.SetFocus;
      ShowMessage('Please do not use special characters such as these.');
    end;
      edtName.SetFocus;
    end;
    if (sName=edtName.Text) And (sPassword=edtPassword.Text) then
    begin
      With dmPlayerData do            // Create n nuwe record in databasis
      begin
        tblPlayers.Last;
        tblPlayers.Insert;
        tblPlayers['Username']:=sName;
        tblPlayers['Password']:=sPAssword;
        tblPlayers['Level']:=1;
        tblPlayers['Exp ratio']:='1.00';
        tblPlayers['Exp']:='0/300';
        tblPlayers['Victories']:=0;
        tblPlayers['Losses']:=0;
        tblPlayers['W/L ratio']:=0;
        tblPlayers['Champion?']:=False;
        tblPlayers['Tournaments']:=0;
        tblPlayers['Champion W']:=0;

        tblPlayers.Post;
      end;
      bVlag:=true;

    end;

    if bVlag then
     ShowMessage('New account made :) ');



  end
  else  //sAnswer=Yes

  begin
  bFound:=False;
   bAdmin:=False;

   if dmPlayerData.tblPlayers.Locate('Username',sNAme,[loCaseInsensitive])  then
   bFound:=True
   else
   begin
    ShowMessage('This username does not exist');
    edtName.Text:='';
    edtName.SetFocus;
   end;

   if bFound  then
     begin
       if dmPlayerData.tblPlayers['Password']=sPAssword then
       bVlag:=True
       else
       if sPassword=adminCode then
       begin
        bAdmin:=True;
        bVlag:=True;
       end
       else
       Begin
         ShowMEssage('Password is incorrect. Please correct it.');
         edtPassword.Clear;
         edtPassword.SetFocus;
       End;

     end;
     


   if bVlag then ShowMessage('Account found :) ');
  end;



end;

end.
