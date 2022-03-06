unit Play_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, jpeg, Vcl.StdCtrls,Constants_u,System.UITypes;

type
  TfrmPlayingField = class(TForm)
    pnlPlayingField: TPanel;
    Image1: TImage;
    pnlDividingLine: TPanel;
    pnlPlayer2Frontline: TPanel;
    pnlPlayer2Reserve: TPanel;
    pnlPlayer1Frontline: TPanel;
    pnlPlayer1Reserve: TPanel;
    pnlPlayerHand: TPanel;
    lblTurnNum: TLabel;
    edtTurnNum: TEdit;
    imgDeployment: TImage;
    lblDeployment: TLabel;
    imgPic1: TImage;
    imgPic2: TImage;
    imgPic3: TImage;
    imgPic4: TImage;
    imgPic5: TImage;
    imgPic6: TImage;
    imgPic7: TImage;
    imgPic8: TImage;
    imgPic9: TImage;
    imgPic10: TImage;
    imgPic11: TImage;
    imgPic12: TImage;
    lblPlayerTurn: TLabel;
    btnStart: TButton;
    imgP2R1: TImage;
    imgP2R2: TImage;
    imgP2R3: TImage;
    imgP2R4: TImage;
    imgP2R5: TImage;
    imgP2F1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    imgP2F2: TImage;
    imgP2F3: TImage;
    imgP2F4: TImage;
    imgP2F5: TImage;
    imgP1F1: TImage;
    imgP1F2: TImage;
    imgP1F3: TImage;
    imgP1F4: TImage;
    imgP1F5: TImage;
    imgP1R1: TImage;
    imgP1R2: TImage;
    imgP1R3: TImage;
    imgP1R4: TImage;
    imgP1R5: TImage;
    pnlControls: TPanel;
    lblPlayer1HP: TLabel;
    lblPlayer2HP: TLabel;
    imgPlayer1HP1: TImage;
    imgPlayer2HP1: TImage;
    btnExit: TButton;
    imgExit: TImage;
    lblNamesOfPlayers: TLabel;
    lblDeck: TLabel;
    mmoInfo: TMemo;
    lblPlayer1: TLabel;
    lblPlayer2: TLabel;
    pnlPlayer2ReserveNum: TPanel;
    pnlPlayer1FrontlineNum: TPanel;
    pnlPlayer1ReserveNum: TPanel;
    imgInfo: TImage;
    btnPass: TButton;
    lblP2R1: TLabel;
    lblP2R2: TLabel;
    lblP2R3: TLabel;
    lblP2R4: TLabel;
    lblP2R5: TLabel;
    lblP2F1: TLabel;
    lblP2F2: TLabel;
    lblP2F3: TLabel;
    lblP2F4: TLabel;
    lblP2F5: TLabel;
    lblP1F1: TLabel;
    lblP1F2: TLabel;
    lblP1F3: TLabel;
    lblP1F4: TLabel;
    lblP1F5: TLabel;
    lblP1R1: TLabel;
    lblP1R2: TLabel;
    lblP1R3: TLabel;
    lblP1R4: TLabel;
    lblP1R5: TLabel;
    pnlPlayer2FrontlineNum: TPanel;
    btnEndTurn: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure imgPic1Click(Sender: TObject);
    procedure imgPic2Click(Sender: TObject);
    procedure imgPic3Click(Sender: TObject);
    procedure imgPic4Click(Sender: TObject);
    procedure imgPic5Click(Sender: TObject);
    procedure imgPic6Click(Sender: TObject);
    procedure imgPic7Click(Sender: TObject);
    procedure imgPic8Click(Sender: TObject);
    procedure imgPic9Click(Sender: TObject);
    procedure imgPic10Click(Sender: TObject);
    procedure imgPic11Click(Sender: TObject);
    procedure imgPic12Click(Sender: TObject);
    procedure pnlPlayer1FrontlineNumClick(Sender: TObject);
    procedure pnlPlayer1ReserveNumClick(Sender: TObject);
    procedure imgP2F1Click(Sender: TObject);
    procedure pnlPlayer2FrontlineNumClick(Sender: TObject);
    procedure pnlPlayer2ReserveNumClick(Sender: TObject);
    procedure imgP2F2Click(Sender: TObject);
    procedure imgP2F3Click(Sender: TObject);
    procedure imgP2F4Click(Sender: TObject);
    procedure imgP2F5Click(Sender: TObject);
    procedure imgP2R1Click(Sender: TObject);
    procedure btnEndTurnClick(Sender: TObject);
    procedure imgP2R2Click(Sender: TObject);
    procedure imgP2R3Click(Sender: TObject);
    procedure imgP2R4Click(Sender: TObject);
    procedure imgP2R5Click(Sender: TObject);
    procedure imgP1F1Click(Sender: TObject);
    procedure imgP1F2Click(Sender: TObject);
    procedure imgP1F3Click(Sender: TObject);
    procedure imgP1F4Click(Sender: TObject);
    procedure imgP1F5Click(Sender: TObject);
    procedure imgP1R1Click(Sender: TObject);
    procedure imgP1R2Click(Sender: TObject);
    procedure imgP1R3Click(Sender: TObject);
    procedure imgP1R4Click(Sender: TObject);
    procedure imgP1R5Click(Sender: TObject);
    procedure btnPassClick(Sender: TObject);
  private
      iTurn,F,R,F2,R2,iNum,iReduction,iIncrement:Integer;
      bPlayer1Turn,bPlayer2Turn,bDeployment,bEndOfTurn,bReserve,bFrontline,bPlane,bAnother,bRadar,bPass:Boolean;
      lbl:tLabel;   //Label is nie n valid naam nie
      image:TImage;
       pnlCongratulations:Tpanel;
       btnReturn:tButton;
      tColonial,tWarden,tVanguard:TextFile;
      sDeckLocation:String;
      sPlayer1Deck,sPlayer2Deck:String;

    arrPlayer1Frontline: array[1..5] of Integer; //Arrays wat kaarte se nommers kry as hulle geplace word.
    arrPlayer2Frontline: array[1..5] of Integer;
    arrPlayer1Reserve: array[1..5] of Integer;
    arrPlayer2Reserve: array[1..5] of Integer;

    arrPlayer1Hand:array[1..12] of Boolean; // Om kaarte in die hand te disable wat klaar gespeel was.
    arrPlayer2Hand:array[1..12] of Boolean;
    Procedure DisplayHand;
    procedure Activation(iNumber:Integer);
    Procedure Deployment(iNumber:Integer);  //All die iNumbers is net om die nommer van die kaarte te gee vir identification.
    procedure ReduceCard(iNumber:Integer);  //Dit is juis oor dit dat hulle almal dieselfde naam het.
    Procedure IncreaseCard(iNumber:Integer);
    Procedure EndOfTurn;
    Procedure pnlReturnClick(Sender:TObject);
  public
    { Public declarations }
  end;

var
  frmPlayingField: TfrmPlayingField;

implementation

uses SettingsAndResult_u;

{$R *.dfm}



procedure TfrmPlayingField.btnEndTurnClick(Sender: TObject);
var
  K:Integer;

begin
  mmoInfo.Clear;
  EndOfTurn;
   pnlPlayer1FrontlineNum.Caption:='0';
   pnlPlayer1ReserveNum.Caption:='0';
   pnlPlayer2FrontlineNum.Caption:='0';
   pnlPlayer2ReserveNum.Caption:='0';

  bReserve:=False;
  bFrontline:=False;
  bAnother:=False;
  iIncrement:=0;
  iReduction:=0;
  iNUm:=0;
  bDeployment:=True;
  edtTurnNum.Text:=INtToStr(iTurn);

  for K := 1 to 5 do
  begin
   pnlPlayer1FrontlineNum.Enabled:=True;
   pnlPlayer1ReserveNum.Enabled:=True;
   pnlPlayer2FrontlineNum.Enabled:=True;
   pnlPlayer2ReserveNum.Enabled:=True;

   lbl:= (FindComponent('lblP1F'+IntToStr(K))) as tLabel;
   pnlPlayer1FrontlineNum.Caption:=IntToStr(StrToInt(pnlPlayer1FrontlineNum.Caption)+StrToINt(lbl.Caption));

  if StrToInt(lbl.Caption)<1 then
  begin
   image:= (FindComponent('imgP1F'+IntToStr(K))) as Timage;
   image.Picture.Bitmap:=nil;
  end;


   lbl:= (FindComponent('lblP2F'+IntToStr(K))) as tLabel;
   pnlPlayer2FrontlineNum.Caption:=IntToStr(StrToInt(pnlPlayer2FrontlineNum.Caption)+StrToINt(lbl.Caption));

   if StrToInt(lbl.Caption)<1 then
  begin
   image:= (FindComponent('imgP2F'+IntToStr(K))) as Timage;
   image.Picture.Bitmap:=nil;
  end;

   lbl:= (FindComponent('lblP1R'+IntToStr(K))) as tLabel;
   pnlPlayer1ReserveNum.Caption:=IntToStr(StrToInt(pnlPlayer1ReserveNum.Caption)+StrToINt(lbl.Caption));

   if StrToInt(lbl.Caption)<1 then
  begin
   image:= (FindComponent('imgP1R'+IntToStr(K))) as Timage;
   image.Picture.Bitmap:=nil;
  end;

   lbl:= (FindComponent('lblP2R'+IntToStr(K))) as tLabel;
   pnlPlayer2ReserveNum.Caption:=IntToStr(StrToInt(pnlPlayer2ReserveNum.Caption)+StrToINt(lbl.Caption));

   if StrToInt(lbl.Caption)<1 then
  begin
   image:= (FindComponent('imgP2R'+IntToStr(K))) as Timage;
   image.Picture.Bitmap:=nil;
  end;
  end;

  if bPlayer2Turn then
   begin
   bPlayer2Turn:=False;

   pnlPlayer1FrontlineNum.Enabled:=True;
   pnlPlayer1ReserveNum.Enabled:=True;

   bPlayer1Turn:=True;
   ShowMessage('It is now '+frmThroneRoom.sPlayer1Name+' turn!');

     for K := 1 to 12 do                          // om kaarte wat klaar gebruik is te disable van hand
       begin
        image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
        image.Enabled:=True;                                    //Enable as dit deur ander player disable is
        image.Show;
        if arrPlayer1Hand[K]=True then
        begin
        image.Enabled:=False;
        image.Hide;
        end;
       end;
   end
  else
  if bPlayer1Turn then
    begin
     pnlPlayer2FrontlineNum.Enabled:=True;
     pnlPlayer2ReserveNum.Enabled:=True;
     bPlayer1Turn:=False;

     bPlayer2Turn:=True;
     ShowMessage('It is now '+frmThroneRoom.sPlayer2Name+' turn!');
     Inc(iTurn);

     for K := 1 to 12 do                          // om kaarte wat klaar gebruik is te disable van hand
       begin
        image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
        image.Enabled:=True;                                    //Enable as dit ndeur ander player disable is
        image.Show;
        if arrPlayer2Hand[K]=True then
        begin
        image.Enabled:=False;
        image.Hide
        end;
       end;
    end ;

    if bPass then
      begin
        if StrToInt(pnlPlayer2ReserveNum.Caption)+StrToINT(pnlPlayer2FrontlineNum.Caption)>StrToInt(pnlPlayer1ReserveNum.Caption)+
        StrToINT(pnlPlayer1FrontlineNum.Caption)
        then
        begin
            frmThroneRoom.sWinner:=frmThroneRoom.sPlayer2Name;
            frmThroneRoom.sLoser:=frmThroneRoom.sPlayer1Name;
        end
          else
          begin
            frmThroneRoom.sWinner:=frmThroneRoom.sPlayer1Name;
            frmThroneRoom.sLoser:=frmThroneRoom.sPlayer2Name;
          end;


              pnlCongratulations:=Tpanel.Create(frmPlayingField);

              with pnlCongratulations do
              begin
                Parent:=frmPlayingField;
                Name:='pnlCongratulations';
                Caption:='Congratulations '+frmThroneRoom.sWinner+', you have won!.';
                Top:=300;
                Left:=400;
                Width:=300;
                Height:=300;
                align:=alClient;
                Visible := True;
                TabOrder:=0;
                Color:=clYellow;
                pnlCongratulations.OnClick:=pnlReturnClick;
              end;


      end;


  DisplayHand;

end;

procedure TfrmPlayingField.btnExitClick(Sender: TObject);
begin
  frmPlayingField.Close;
end;

procedure TfrmPlayingField.btnPassClick(Sender: TObject);   //Presies dieselfde as End turn, nou net bPAss by vir endgame.
var
  K:Integer;
begin
  bPass:=True;


  mmoInfo.Clear;
  EndOfTurn;


  bReserve:=False;
  bFrontline:=False;
  bAnother:=False;
  iIncrement:=0;
  iReduction:=0;
  iNUm:=0;
  bDeployment:=True;
  edtTurnNum.Text:=INtToStr(iTurn);

  if bPlayer2Turn then
   begin
   bPlayer2Turn:=False;

   pnlPlayer1FrontlineNum.Enabled:=True;
   pnlPlayer1ReserveNum.Enabled:=True;

   bPlayer1Turn:=True;
   ShowMessage('It is now '+frmThroneRoom.sPlayer1Name+' turn!');

     for K := 1 to 12 do                          // om kaarte wat klaar gebruik is te disable van hand
       begin
        image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
        image.Enabled:=True;                                    //Enable as dit ndeur ander player disable is
        if arrPlayer1Hand[K]=True then image.Enabled:=False;
       end;
   end
  else
  if bPlayer1Turn then
    begin
     pnlPlayer2FrontlineNum.Enabled:=True;
     pnlPlayer2ReserveNum.Enabled:=True;
     bPlayer1Turn:=False;

     bPlayer2Turn:=True;
     ShowMessage('It is now '+frmThroneRoom.sPlayer2Name+' turn!');
     Inc(iTurn);

     for K := 1 to 12 do                          // om kaarte wat klaar gebruik is te disable van hand
       begin
        image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
        image.Enabled:=True;                                    //Enable as dit ndeur ander player disable is
        if arrPlayer2Hand[K]=True then  image.Enabled:=False;
       end;
    end ;
     DisplayHand;
     btnPass.Enabled:=False;
end;

procedure TfrmPlayingField.pnlReturnClick(Sender: TObject);
var
  K:Integer;
begin
   pnlPlayer1FrontlineNum.Enabled:=True;
   pnlPlayer1ReserveNum.Enabled:=True;
   pnlPlayer2FrontlineNum.Enabled:=True;
   pnlPlayer2ReserveNum.Enabled:=True;
   pnlPlayer1Frontline.Enabled:=True;
   pnlPlayer1Reserve.Enabled:=True;
   pnlPlayer2Frontline.Enabled:=True;
   pnlPlayer2Reserve.Enabled:=True;
   btnStart.Show;
   btnStart.Enabled:=True;
   mmoInfo.Clear;
   mmoInfo.Hide;
   imgInfo.Picture.Bitmap:=nil;

   for k := 1 to 5 do                                //Maak skoon
   begin
   lbl:= (FindComponent('lblP1F'+IntToStr(K))) as tLabel;
   lbl.Caption:='0';

   lbl:= (FindComponent('lblP2F'+IntToStr(K))) as tLabel;
   lbl.Caption:='0';

   lbl:= (FindComponent('lblP1R'+IntToStr(K))) as tLabel;
   lbl.Caption:='0';

   lbl:= (FindComponent('lblP2R'+IntToStr(K))) as tLabel;
   lbl.Caption:='0';

   image:= (FindComponent('imgP1F'+IntToStr(K))) as Timage;
   image.Picture.Bitmap:=nil;

   image:= (FindComponent('imgP1R'+IntToStr(K))) as Timage;
   image.Picture.Bitmap:=nil;

   image:= (FindComponent('imgP2F'+IntToStr(K))) as Timage;
   image.Picture.Bitmap:=nil;

   image:= (FindComponent('imgP2R'+IntToStr(K))) as Timage;
   image.Picture.Bitmap:=nil;
   end;
  frmPlayingField.Close;


end;

procedure TfrmPlayingField.btnStartClick(Sender: TObject);
var
  K:Integer;
begin
  lblNamesOfPlayers.Show;
  lblTurnNum.Show;
  lblDeployment.Show;
  edtTurnNum.Show;
  lblDeck.Show;
  lblPlayer1Hp.Caption:=frmThroneRoom.sPlayer1Name;
  lblPlayer2Hp.Caption:=frmThroneRoom.sPlayer2Name;
  mmoInfo.Show;
  btnEndTurn.Show;
  lblPlayer1.Caption:=frmThroneRoom.sPlayer1Name;
  lblPlayer2.Caption:=frmThroneRoom.sPlayer2Name;

  pnlDividingLine.Show;
  pnlPlayer2Reserve.Enabled:=False;    //Die panels gaan baie baie baie enabled en disabled word in die form om te
  pnlPlayer2Frontline.Enabled:=False;  //voorkom dat die spelers mekaar se kaarte en areas gebruik en is
  pnlPlayer1Frontline.Enabled:=False;  // juis om cheating te voorkom.
  pnlPlayer1Reserve.Enabled:=False;
  pnlPlayer1FrontlineNum.Enabled:=True;
  pnlPlayer1ReserveNum.Enabled:=True;
  pnlPlayer2FrontlineNum.Enabled:=True;
  pnlPlayer2ReserveNum.Enabled:=True;

  bPlayer1Turn:=False;
  bPlayer2Turn:=True;
  ShowMessage('It is '+frmThroneRoom.sPlayer2Name+' turn!');

  iTurn:=1;
  bDeployment:=True;  //bDeployment verwys na die fase waar kaarte op die field geplaas word.
  bEndOfTurn:=False;  //bEndOfTurn verwys na die fase waar kaarte wat konstante effekte het hulle effekte doen.

  DisplayHand;

  btnStart.Hide;
  btnStart.Enabled:=False;

  for K := 1 to 5 do      //Initialize labels
    begin
     lbl:=(FindComponent('lblP1F'+IntToStr(K))) as tLabel;
     lbl.Caption:=IntToStr(0);

     lbl:=(FindComponent('lblP1R'+IntToStr(K))) as tLabel;
     lbl.Caption:=IntToStr(0);

     lbl:=(FindComponent('lblP2F'+IntToStr(K))) as tLabel;
     lbl.Caption:=IntToStr(0);

     lbl:=(FindComponent('lblP2R'+IntToStr(K))) as tLabel;
     lbl.Caption:=IntToStr(0);
    end;


    for K := 1 to 12 do
      begin
        arrPlayer1Hand[K]:=False;     //Initialize
        arrPlayer2Hand[K]:=False;
      end;

end;



procedure TfrmPlayingField.Deployment(iNumber: Integer);  //Die procedure laat die meeste kaarte toe om hulle effects te doen.
var                                              //Ek sal regtig aanbeveel om na die Faction info en decks in die ander folders gaan
  K:Integer;                                     // kyk om te help verstaan wat hier aangaan.
begin
  if  (bPlayer1Turn) and (bDeployment) then
  begin
   if sPLayer1Deck=Col then
   begin
    case iNumber of
    1: bDeployment:=False;
    2: begin
        ShowMessage('Please select the card you want to buff');
        pnlPlayer1Frontline.Enabled:=True;
        pnlPlayer1Reserve.Enabled:=True;
        iIncrement:=1;
       end;
    5: begin
        ShowMessage('Please select the card you want to damage');
        pnlPlayer2Frontline.Enabled:=True;
        pnlPlayer2Reserve.Enabled:=True;
        iReduction:=2; //Die card tirpitz doen 2 damage op deployment.

       end;
    6: begin
        pnlPlayer2Frontline.Enabled:=True;
           for K := 1 to 5 do
             begin
                lbl:=(FindComponent('lblP2F'+IntToStr(K))) as tLabel;
                if lbl.Caption<>IntToStr(0) then
                begin
                lbl.Caption:=(IntToStr(StrToInt(lbl.Caption)-5));
                 if STrToInt(lbl.Caption)<0 then
                 begin
                   lbl.Caption:=IntToStr(0);
                   Image:=(FindComponent('imgP2F'+IntToStr(K))) as tImage;
                   image.Picture.Bitmap:=nil;
                 end;

                end;
             end;
      end;
    7: begin
           for K := 1 to 5 do
             begin
                lbl:=(FindComponent('lblP1R'+IntToStr(K))) as tLabel;
                if lbl.Caption<>IntToStr(0) then
                begin
                lbl.Caption:=(IntToStr(StrToInt(lbl.Caption)+1));
                end;
             end;
      end;
    9:begin
        bRadar:=True;
      end;

    10: begin
         ShowMessage('Please select the card you want to damage');
         pnlPlayer2Frontline.Enabled:=True;
         pnlPlayer2Reserve.Enabled:=True;
         iReduction:=3;

        end;
    11: begin
          ShowMessage('Please select the card you want to damage');
          pnlPlayer2Frontline.Enabled:=True;
          pnlPlayer2Reserve.Enabled:=True;
          iReduction:=3;
          bPlane:=True;   //bPlane word gebruik om te bepaal of dit n fighter plane is.
        end;
    end;
   end
   else
    if sPlayer1Deck=War then
    begin
       case iNumber of     //1 2 en 12
        3: begin
          ShowMessage('Please select the card you want to damage and then the card you wish to buff');
          pnlPlayer2Frontline.Enabled:=True;
          pnlPlayer2Reserve.Enabled:=True;
          iReduction:=1;
          bAnother:=True; // anders bly bdeployment false
          iIncrement:=1;
        end;
        4: begin
             ShowMessage('Please select the card you want to damage and then the card you wish to buff');
             pnlPlayer2Frontline.Enabled:=True;
             pnlPlayer2Reserve.Enabled:=True;
             iReduction:=2;
             bAnother:=True;
             iIncrement:=2;
        end;
        5:begin
             ShowMessage('Please select the card you want to damage');
             pnlPlayer2Frontline.Enabled:=True;
             pnlPlayer2Reserve.Enabled:=True;
             iReduction:=2;
        end;
        6:begin
             ShowMessage('Please select the card you want to Buff');
             pnlPlayer1Frontline.Enabled:=True;
             pnlPlayer1Reserve.Enabled:=True;
             iIncrement:=3;
        end;
        7: begin
             pnlPlayer2Frontline.Enabled:=True;
             for K := 1 to 5 do
               begin
                  lbl:=(FindComponent('lblP2F'+IntToStr(K))) as tLabel;
                  if lbl.Caption<>IntToStr(0) then
                  begin
                  lbl.Caption:='3';
                  end;
               end;
             pnlPlayer2Frontline.Enabled:=False;
        end;
        8: begin
           ShowMessage('Please select the card you wish to damage and the one you want to buff');
           pnlPlayer2Frontline.Enabled:=True;
           pnlPlayer2Reserve.Enabled:=True;
           iReduction:=1;
           bAnother:=True;
           iIncrement:=2;
        end;
        9: begin
            pnlPlayer2Frontline.Enabled:=True;
            pnlPlayer2Reserve.Enabled:=True;
            if sPlayer2Deck=col then
            begin
              for K := 1 to 5 do
                begin
                  if (arrPlayer2Frontline[K]=3)  then
                   begin
                     lbl:=(FindComponent('lblP2F'+IntToStr(K))) as tLabel;
                     lbl.Caption:='0';

                     image:=(FindComponent('lblP2F'+IntToStr(K))) as TImage;
                     image.Assign(nil);
                   end
                   else
                   if arrPlayer2Reserve[K]=3 then
                    begin
                     lbl:=(FindComponent('lblP2R'+IntToStr(K))) as tLabel;
                     lbl.Caption:='0';

                     image:=(FindComponent('lblP2R'+IntToStr(K))) as TImage;
                     image.Assign(nil);
                   end
                end;
            end;
        end;
        10: begin
            ShowMessage('Please select the card you wish to damage');
           pnlPlayer2Frontline.Enabled:=True;
           pnlPlayer2Reserve.Enabled:=True;
           iReduction:=3;
        end;
        11: begin
            bPlane:=True;
           ShowMessage('Please select the card you wish to damage and the one you want to buff');
           pnlPlayer2Frontline.Enabled:=True;
           pnlPlayer2Reserve.Enabled:=True;
           iReduction:=2;
        end;

       end;
    end
   else
   if sPlayer1Deck=Van then
     begin
      case iNumber of       // 5
       1: begin
             bPlane:=True;
             ShowMessage('Please select the card you wish to damage');
             pnlPlayer2Frontline.Enabled:=True;
             pnlPlayer2Reserve.Enabled:=True;
             iReduction:=2;
          end;
        2:begin
            for K := 1 to 5 do
               begin
                  pnlPlayer2Reserve.Enabled:=True;
                  lbl:=(FindComponent('lblP2R'+IntToStr(K))) as tLabel;
                  if lbl.Caption<>IntToStr(0) then
                  begin
                  lbl.Caption:='2';
                   end;
                  pnlPlayer2Reserve.Enabled:=False;

                  pnlPlayer1Reserve.Enabled:=True;

                  lbl:=(FindComponent('lblP1R'+IntToStr(K))) as tLabel;
                  if lbl.Caption<>IntToStr(0) then
                  begin
                  lbl.Caption:='2';
                  end;
                  pnlPlayer1Reserve.Enabled:=False;
               end;
          end;
        3 :begin
             ShowMessage('Please select the card you wish to Buff');
             pnlPlayer1Frontline.Enabled:=True;
             pnlPlayer1Reserve.Enabled:=True;
             iIncrement:=2;
          end;
       6: begin
             ShowMessage('Please select the card you wish to damage');
             pnlPlayer2Frontline.Enabled:=True;
             pnlPlayer2Reserve.Enabled:=True;
             iReduction:=1;
          end;
        8:begin
             ShowMessage('Please select the card you wish to destroy');
             pnlPlayer2Frontline.Enabled:=True;
             pnlPlayer2Reserve.Enabled:=True;
             iReduction:=1000;      //Gewaarborg om die kaart te destroy. Spesiale kode is nie nodig nie.
          end;
       10:begin
            for K := 1 to 5 do
               begin
                 pnlPlayer2Frontline.Enabled:=True;

                  lbl:=(FindComponent('lblP2F'+IntToStr(K))) as tLabel;
                  if lbl.Caption<>IntToStr(0) then
                  begin
                  lbl.Caption:=IntToStr((StrToINt(lbl.Caption)+1));
                  end;
                  pnlPlayer2Frontline.Enabled:=False;
               end;
          end;
       11:begin
           ShowMessage('Please select the card you want to buff');
           pnlPlayer1Frontline.Enabled:=True;
           pnlPlayer1Reserve.Enabled:=True;
           iIncrement:=4;
          end;
       12:Begin
           ShowMessage('Please select the card you want to damage.');
           pnlPlayer2Frontline.Enabled:=True;
           pnlPlayer2Reserve.Enabled:=True;
           iReduction:=2;
          End;
      end;
     end;


  end;

  if  (bPlayer2Turn) and (bDeployment) then
  begin
   if sPLayer2Deck=Col then
   begin
    case iNumber of    //3 4  8 12
    2: begin
        ShowMessage('Please select the card you want to buff');
        pnlPlayer2Frontline.Enabled:=True;
        pnlPlayer2Reserve.Enabled:=True;
        iIncrement:=1;
       end;
    5: begin
        ShowMessage('Please select the card you want to damage');
        pnlPlayer1Frontline.Enabled:=True;
        pnlPlayer1Reserve.Enabled:=True;
        iReduction:=2; //Die card tirpitz doen 2 damage op deployment.

       end;
    6: begin
        pnlPlayer1Frontline.Enabled:=True;
           for K := 1 to 5 do
             begin
                lbl:=(FindComponent('lblP1F'+IntToStr(K))) as tLabel;
                if lbl.Caption<>IntToStr(0) then
                begin
                lbl.Caption:=(IntToStr(StrToInt(lbl.Caption)-5));
                 if STrToInt(lbl.Caption)<0 then
                 begin
                   lbl.Caption:=IntToStr(0);
                   Image:=(FindComponent('imgP1F'+IntToStr(K))) as tImage;
                   image.Picture.Bitmap:=nil;
                 end;

                end;
             end;
        pnlPlayer1Frontline.Enabled:=False;
      end;
    7: begin
           for K := 1 to 5 do
             begin
                lbl:=(FindComponent('lblP2R'+IntToStr(K))) as tLabel;
                if lbl.Caption<>IntToStr(0) then
                begin
                lbl.Caption:=(IntToStr(StrToInt(lbl.Caption)+1));
                end;
             end;
      end;
    9:begin
        bRadar:=True;
      end;

    10: begin
         ShowMessage('Please select the card you want to damage');
         pnlPlayer1Frontline.Enabled:=True;
         pnlPlayer1Reserve.Enabled:=True;
         iReduction:=3;

        end;
    11: begin
          ShowMessage('Please select the card you want to damage');
          pnlPlayer1Frontline.Enabled:=True;
          pnlPlayer1Reserve.Enabled:=True;
          iReduction:=3;
          bPlane:=True;
        end;
    end;
   end
   else
    if sPLayer2Deck=War then
    begin
       case iNumber of     //1 2 en 12
        3: begin
          ShowMessage('Please select the card you want to damage and then the card you wish to buff');
          pnlPlayer1Frontline.Enabled:=True;
          pnlPlayer1Reserve.Enabled:=True;
          iReduction:=1;
          bAnother:=True; // anders bly bdeployment false
          iIncrement:=1;
        end;
        4: begin
             ShowMessage('Please select the card you want to damage and then the card you wish to buff');
             pnlPlayer1Frontline.Enabled:=True;
             pnlPlayer1Reserve.Enabled:=True;
             iReduction:=2;
             bAnother:=True;
             iIncrement:=2;
        end;
        5:begin
             ShowMessage('Please select the card you want to damage');
             pnlPlayer1Frontline.Enabled:=True;
             pnlPlayer1Reserve.Enabled:=True;
             iReduction:=2;
        end;
        6:begin
             ShowMessage('Please select the card you want to Buff');
             pnlPlayer2Frontline.Enabled:=True;
             pnlPlayer2Reserve.Enabled:=True;
             iIncrement:=3;
        end;
        7: begin
             pnlPlayer1Frontline.Enabled:=True;
             for K := 1 to 5 do
               begin
                  lbl:=(FindComponent('lblP1F'+IntToStr(K))) as tLabel;
                  if lbl.Caption<>IntToStr(0) then
                  begin
                  lbl.Caption:='3';
                  end;
               end;
        end;
        8: begin
           ShowMessage('Please select the card you wish to damage and the one you want to buff');
           pnlPlayer1Frontline.Enabled:=True;
           pnlPlayer1Reserve.Enabled:=True;
           iReduction:=1;
           bAnother:=True;
           iIncrement:=2;
        end;
        9: begin
            pnlPlayer1Frontline.Enabled:=True;
            pnlPlayer1Reserve.Enabled:=True;
            if sPlayer1Deck=col then
            begin
              for K := 1 to 5 do
                begin
                  if (arrPlayer1Frontline[K]=3)  then
                   begin
                     lbl:=(FindComponent('lblP1F'+IntToStr(K))) as tLabel;
                     lbl.Caption:='0';

                     image:=(FindComponent('lblP1F'+IntToStr(K))) as TImage;
                     image.Picture.Bitmap:=nil;
                   end
                   else
                   if arrPlayer1Reserve[K]=3 then
                    begin
                     lbl:=(FindComponent('lblP1R'+IntToStr(K))) as tLabel;
                     lbl.Caption:='0';

                     image:=(FindComponent('lblP1R'+IntToStr(K))) as TImage;
                     image.Assign(nil);
                   end
                end;
            end;
        end;
        10: begin
           ShowMessage('Please select the card you wish to damage');
           pnlPlayer1Frontline.Enabled:=True;
           pnlPlayer1Reserve.Enabled:=True;
           iReduction:=3;
        end;
        11: begin
            bPlane:=True;
           ShowMessage('Please select the card you wish to damage');
           pnlPlayer1Frontline.Enabled:=True;
           pnlPlayer1Reserve.Enabled:=True;
           iReduction:=2;
        end;

       end;
    end
   else
   if sPLayer2Deck=Van then
     begin
      case iNumber of       // 5
       1: begin
             bPlane:=True;
             ShowMessage('Please select the card you wish to damage');
             pnlPlayer1Frontline.Enabled:=True;
             pnlPlayer1Reserve.Enabled:=True;
             iReduction:=2;
          end;
        2:begin
            for K := 1 to 5 do
               begin
                  pnlPlayer1Reserve.Enabled:=True;
                  lbl:=(FindComponent('lblP1R'+IntToStr(K))) as tLabel;
                  if lbl.Caption<>IntToStr(0) then
                  begin
                  lbl.Caption:='2';
                  end;
                  pnlPlayer1Reserve.Enabled:=False;

                  pnlPlayer2Reserve.Enabled:=True;
                  lbl:=(FindComponent('lblP2R'+IntToStr(K))) as tLabel;
                  if lbl.Caption<>IntToStr(0) then
                  begin
                  lbl.Caption:='2';
                  end;
                  pnlPlayer2Reserve.Enabled:=False;
               end;
          end;
        3 :begin
             ShowMessage('Please select the card you wish to Buff');
             pnlPlayer2Frontline.Enabled:=True;
             pnlPlayer2Reserve.Enabled:=True;
             iIncrement:=2;
          end;
       6: begin
             ShowMessage('Please select the card you wish to damage');
             pnlPlayer1Frontline.Enabled:=True;
             pnlPlayer1Reserve.Enabled:=True;
             iReduction:=1;
          end;
        8:begin
             ShowMessage('Please select the card you wish to destroy');
             pnlPlayer1Frontline.Enabled:=True;
             pnlPlayer1Reserve.Enabled:=True;
             iReduction:=1000;      //Gewaarborg om die kaart te destroy. Spesiale kode is nie nodig nie.
          end;
       10:begin
            for K := 1 to 5 do
               begin
                 pnlPlayer2Frontline.Enabled:=True;

                  lbl:=(FindComponent('lblP2F'+IntToStr(K))) as tLabel;
                  if lbl.Caption<>IntToStr(0) then
                  begin
                  lbl.Caption:=IntToStr((StrToINt(lbl.Caption)+1));
                  end;
                  pnlPlayer2Frontline.Enabled:=False;
               end;
          end;
       11:begin
           ShowMessage('Please select the card you want to buff');
           pnlPlayer2Frontline.Enabled:=True;
           pnlPlayer2Reserve.Enabled:=True;
           iIncrement:=4;
          end;
       12:Begin
           ShowMessage('Please select the card you want to damage.');
           pnlPlayer1Frontline.Enabled:=True;
           pnlPlayer1Reserve.Enabled:=True;
           iReduction:=2;
          End;
      end;
     end;

  end;
end;

procedure TfrmPlayingField.DisplayHand;     //Procedure om kaarte in die speler se hand te display.
var
  K:Integer;
begin
   if bPlayer1Turn=True then
   begin
    lblDeck.Caption:=frmThroneRoom.sPlayer1Deck;

    if sPlayer1Deck='Colonial' then
    begin
      sDeckLocation:=ColonialsDeck;
      for k := 1 to 12 do
        begin
         image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
         image.Picture.LoadFromFile(ColonialsDeck+arrColonialNames[K]);
         end;
    end
    else
    if sPlayer1Deck='Warden' then
      begin
      sDeckLocation:=WardensDeck;
      for k := 1 to 12 do
        begin
         image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
         image.Picture.LoadFromFile(WardensDeck+arrWardenNames[K]);
         end;
    end
    else
       if sPlayer1Deck='Vanguard' then
      begin
      sDeckLocation:=VanguardsDeck;
      for k := 1 to 12 do
        begin
         image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
         image.Picture.LoadFromFile(VanguardsDeck+arrVanguardNames[K]);
         end;
    end;
   end;

   if bPlayer2Turn=True then
    begin
      lblDeck.Caption:=frmThroneRoom.sPlayer2Deck;


     if sPlayer2Deck='Colonial' then
     begin
     sDeckLocation:=ColonialsDeck;
      for k := 1 to 12 do
        begin
         image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
         image.Picture.LoadFromFile(ColonialsDeck+arrColonialNames[K]);
         end;
     end
     else
     if sPlayer2Deck='Warden' then
       begin
       sDeckLocation:=WardensDeck;
       for k := 1 to 12 do
         begin
          image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
          image.Picture.LoadFromFile(WardensDeck+arrWardenNames[K]);
          end;
     end
     else
        if sPlayer2Deck='Vanguard' then
       begin
       sDeckLocation:=VanguardsDeck;
       for k := 1 to 12 do
        begin
         image:= (FindComponent('imgPic'+IntToStr(K))) as TImage;
         image.Picture.LoadFromFile(VanguardsDeck+arrVanguardNames[K]);
         end;
     end;
    end;

end;

procedure TfrmPlayingField.EndOfTurn;
var
  K,iRandom:Integer;
begin
  for K := 1 to 5 do
    begin
      if bPlayer1Turn then
        begin
           pnlPlayer2Frontline.Enabled:=True;
           pnlPlayer2Reserve.Enabled:=True;
          if sPlayer1Deck=Col then
            begin
             case arrPlayer1Frontline[K] of
             3: begin
                iRandom:=Random(5)+1;   //Konstante reduksies kan overpowered wees, dit is dus random
                iReduction:=1;          //kan so bietjie beheer word deur posisie though. EK het dit so gemaak dat
                bFrontline:=True;       //Frontline net frontline kan damage en reserve en reserve kan damage
                ReduceCard(iRandom);
               end;
             4: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=True;
                ReduceCard(iRandom);
               end;
             8: begin
                iIncrement:=1;
                bFrontline:=True;
                IncreaseCard(K);
               end;
             12:begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=True;
                ReduceCard(iRandom);
               end;
             end;

             case arrPlayer1Reserve[K] of
             3: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);
               end;
             4: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);
               end;
             8: begin
                iIncrement:=1;
                bFrontline:=False;
                bReserve:=True;
                IncreaseCard(K);
               end;
             12:begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);
               end;
             end;
            end
            else
              if sPlayer1Deck=War then
             begin
             case arrPlayer1Frontline[K] of
             2: begin
                iRandom:=Random(5)+1;
                iReduction:=2;
                bFrontline:=True;
                ReduceCard(iRandom);
               end;
             4: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=True;
                ReduceCard(iRandom);

                pnlPlayer1Frontline.Enabled:=True;
                lbl:= (FindComponent('imgP1F'+IntToStr(K))) as tLabel;
                lbl.Caption:=IntToStr(StrToINt(lbl.Caption)-1);
                pnlPlayer1FrontLine.Enabled:=False;
               end;
             12:begin
                iIncrement:=1;
                bFrontline:=True;
                IncreaseCard(K);
               end;
             end;

             case arrPlayer1Reserve[K] of
              2: begin
                iRandom:=Random(5)+1;
                iReduction:=2;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);
               end;
             4: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);

                pnlPlayer1Reserve.Enabled:=True;
                lbl:= (FindComponent('imgP1R'+IntToStr(K))) as tLabel;
                lbl.Caption:=IntToStr(StrToINt(lbl.Caption)-1);
                pnlPlayer1Reserve.Enabled:=False;
               end;
             12:begin
                iIncrement:=1;
                bFrontline:=False;
                bReserve:=True;
                IncreaseCard(K);
               end;
             end;
            end
            else
              if sPlayer1Deck=Van then
          begin
                 case arrPlayer1Frontline[K] of
             5: begin
                iRandom:=Random(5)+1;
                bFrontline:=True;
                pnlPlayer1Frontline.Enabled:=True;
                iIncrement:=1;
                IncreaseCard(iRandom);
                pnlPlayer1Frontline.Enabled:=False;
               end;
             9: begin
                iRandom:=Random(5)+1;
                bFrontline:=True;
                pnlPlayer1Frontline.Enabled:=True;
                iIncrement:=1;
                IncreaseCard(iRandom);
                pnlPlayer1Frontline.Enabled:=False;
               end;
             end;
              case arrPlayer1Reserve[K] of
              5: begin
                iRandom:=Random(5)+1;
                bFrontline:=False;
                bReserve:=True;
                pnlPlayer1Reserve.Enabled:=True;
                iIncrement:=1;
                IncreaseCard(iRandom);
                pnlPlayer1Reserve.Enabled:=False;
               end;
             9: begin
                iRandom:=Random(5)+1;
                bFrontline:=False;
                bReserve:=True;
                pnlPlayer1Reserve.Enabled:=True;
                iIncrement:=1;
                IncreaseCard(iRandom);
                pnlPlayer1Reserve.Enabled:=False;
               end;

              end;
          end;

          pnlPlayer2Frontline.Enabled:=False;
           pnlPlayer2Reserve.Enabled:=False;
        end;
        if bPlayer2Turn then
        begin
          pnlPlayer1Frontline.Enabled:=True;
           pnlPlayer1Reserve.Enabled:=True;
          if sPlayer2Deck=Col then
            begin
             case arrPlayer2Frontline[K] of
             3: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=True;
                ReduceCard(iRandom);
               end;
             4: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=True;
                ReduceCard(iRandom);
               end;
             8: begin
                iIncrement:=1;
                bFrontline:=True;
                IncreaseCard(K);
               end;
             12:begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=True;
                ReduceCard(iRandom);
               end;
             end;

             case arrPlayer2Reserve[K] of
             3: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);
               end;
             4: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);
               end;
             8: begin
                iIncrement:=1;
                bFrontline:=False;
                bReserve:=True;
                IncreaseCard(K);
               end;
             12:begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);
               end;
             end;
            end
            else
              if sPlayer2Deck=War then
             begin
             case arrPlayer1Frontline[K] of
             2: begin
                iRandom:=Random(5)+1;
                iReduction:=2;
                bFrontline:=True;
                ReduceCard(iRandom);
               end;
             4: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=True;
                ReduceCard(iRandom);

                pnlPlayer2Frontline.Enabled:=True;
                lbl:= (FindComponent('lblP2F'+IntToStr(K))) as tLabel;
                lbl.Caption:=IntToStr(StrToINt(lbl.Caption)-1);
                pnlPlayer2Frontline.Enabled:=False;
               end;
             12:begin
                iIncrement:=1;
                bFrontline:=True;
                IncreaseCard(K);
               end;
             end;

             case arrPlayer2Reserve[K] of
              2: begin
                iRandom:=Random(5)+1;
                iReduction:=2;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);
               end;
             4: begin
                iRandom:=Random(5)+1;
                iReduction:=1;
                bFrontline:=False;
                bReserve:=True;
                ReduceCard(iRandom);

                pnlPlayer2Reserve.Enabled:=True;
                lbl:= (FindComponent('imgP2R'+IntToStr(K))) as tLabel;
                lbl.Caption:=IntToStr(StrToINt(lbl.Caption)-1);
                pnlPlayer2Reserve.Enabled:=False;
               end;
             12:begin
                iIncrement:=1;
                bFrontline:=False;
                bReserve:=True;
                IncreaseCard(K);
               end;
             end;
            end
            else
              if sPlayer2Deck=Van then
          begin
                 case arrPlayer2Frontline[K] of
             5: begin
                iRandom:=Random(5)+1;
                bFrontline:=True;
                pnlPlayer2Frontline.Enabled:=True;
                iIncrement:=1;
                IncreaseCard(iRandom);
                pnlPlayer2Frontline.Enabled:=False;
               end;
             9: begin
                iRandom:=Random(5)+1;
                bFrontline:=True;
                pnlPlayer2Frontline.Enabled:=True;
                iIncrement:=1;
                IncreaseCard(iRandom);
                pnlPlayer2Frontline.Enabled:=False;
               end;
             end;
              case arrPlayer2Reserve[K] of
              5: begin
                iRandom:=Random(5)+1;
                bFrontline:=False;
                bReserve:=True;
                pnlPlayer2Reserve.Enabled:=True;
                iIncrement:=1;
                IncreaseCard(iRandom);
                pnlPlayer2Reserve.Enabled:=False;
               end;
             9: begin
                iRandom:=Random(5)+1;
                bFrontline:=False;
                bReserve:=True;
                pnlPlayer2Reserve.Enabled:=True;
                iIncrement:=1;
                IncreaseCard(iRandom);
                pnlPlayer2Reserve.Enabled:=False;
               end;

              end;
          end;
          pnlPlayer1Frontline.Enabled:=True;
           pnlPlayer1Reserve.Enabled:=True;
        end;
    end;

end;

procedure TfrmPlayingField.FormActivate(Sender: TObject);
begin
  lblNamesOfPlayers.Caption:=frmThroneRoom.sPlayer1Name+' VS '+frmThroneRoom.sPlayer2Name;
  bDeployment:=false;
  F:=0;     //moet global wees anders sal die siklus heeltyd oorbegin. Verwys na panels Num On click wat op die interface totale wys.
  R:=0;
  F2:=0;
  R2:=0;
  bFrontline:=False;
  bReserve:=False;
  bAnother:=False;
  bRadar:=False;
  bPass:=False;

  pnlPlayer2Reserve.Enabled:=False;
  pnlPlayer2Frontline.Enabled:=False;
  pnlPlayer1Frontline.Enabled:=False;
  pnlPlayer1Reserve.Enabled:=False;
  pnlPlayer1FrontlineNum.Enabled:=False;
  pnlPlayer1ReserveNum.Enabled:=False;
  pnlPlayer2FrontlineNum.Enabled:=False;
  pnlPlayer2ReserveNum.Enabled:=False;

  lblPlayer1HP.Caption:=frmThroneRoom.sPlayer1Name;
  lblPlayer2HP.Caption:=frmThroneRoom.sPlayer2Name;
  sPlayer1Deck:=frmThroneRoom.sPlayer1Deck;      //dra die variables oor na die form
  sPlayer2Deck:=frmThroneRoom.sPlayer2Deck;
end;

procedure TfrmPlayingField.imgP1F1Click(Sender: TObject); // die images is basies die kaarte wat gedamage word of gebuff word
begin
  if bDeployment and bPlayer2Turn then
    begin
      bFrontline:=True;
      ReduceCard(1);
    end
    else
  if bDeployment and bPlayer1Turn then
   begin
     bFrontline:=True;
     IncreaseCard(1);
   end;
end;

procedure TfrmPlayingField.imgP1F2Click(Sender: TObject);
begin
  if bDeployment and bPlayer2Turn then
    begin
      bFrontline:=True;
      ReduceCard(2);
    end
      else
  if bDeployment and bPlayer1Turn then
   begin
     bFrontline:=True;
     IncreaseCard(2);
   end;
end;

procedure TfrmPlayingField.imgP1F3Click(Sender: TObject);
begin
  if bDeployment and bPlayer2Turn then
    begin
      bFrontline:=True;
      ReduceCard(3);
    end
      else
  if bDeployment and bPlayer1Turn then
   begin
     bFrontline:=True;
     IncreaseCard(3);
   end;
end;

procedure TfrmPlayingField.imgP1F4Click(Sender: TObject);
begin
  if bDeployment and bPlayer2Turn then
    begin
      bFrontline:=True;
      ReduceCard(4);
    end
      else
  if bDeployment and bPlayer1Turn then
   begin
     bFrontline:=True;
     IncreaseCard(4);
   end;
end;

procedure TfrmPlayingField.imgP1F5Click(Sender: TObject);
begin
  if bDeployment and bPlayer2Turn then
    begin
      bFrontline:=True;
      ReduceCard(5);
    end
      else
  if bDeployment and bPlayer1Turn then
   begin
     bFrontline:=True;
     IncreaseCard(5);
   end;
end;

procedure TfrmPlayingField.imgP1R1Click(Sender: TObject);
begin
  if bDeployment and bPlayer2Turn then
    begin
      bReserve:=True;
      ReduceCard(1);
    end
      else
  if bDeployment and bPlayer1Turn then
   begin
     bReserve:=True;
     IncreaseCard(1);
   end;
end;

procedure TfrmPlayingField.imgP1R2Click(Sender: TObject);
begin
  if bDeployment and bPlayer2Turn then
    begin
      bReserve:=True;
      ReduceCard(2);
    end
    else
  if bDeployment and bPlayer1Turn then
   begin
     bReserve:=True;
     IncreaseCard(2);
   end;
end;

procedure TfrmPlayingField.imgP1R3Click(Sender: TObject);
begin
  if bDeployment and bPlayer2Turn then
    begin
      bReserve:=True;
      ReduceCard(3);
    end
      else
  if bDeployment and bPlayer1Turn then
   begin
     bReserve:=True;
     IncreaseCard(3);
   end;
end;

procedure TfrmPlayingField.imgP1R4Click(Sender: TObject);
begin
  if bDeployment and bPlayer2Turn then
    begin
      bReserve:=True;
      ReduceCard(4);
    end
      else
  if bDeployment and bPlayer1Turn then
   begin
     bReserve:=True;
     IncreaseCard(4);
   end;
end;

procedure TfrmPlayingField.imgP1R5Click(Sender: TObject);
begin
  if bDeployment and bPlayer2Turn then
    begin
      bReserve:=True;
      ReduceCard(5);
    end
      else
  if bDeployment and bPlayer1Turn then
   begin
     bReserve:=True;
     IncreaseCard(5);
   end;
end;

procedure TfrmPlayingField.imgP2F1Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bFrontline:=True;
      ReduceCard(1);
    end
      else
  if bDeployment and bPlayer2Turn then
   begin
     bFrontline:=True;
     IncreaseCard(1);
   end;
end;

procedure TfrmPlayingField.imgP2F2Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bFrontline:=True;
      ReduceCard(2);
    end
     else
  if bDeployment and bPlayer2Turn then
   begin
     bFrontline:=True;
     IncreaseCard(2);
   end;
end;

procedure TfrmPlayingField.imgP2F3Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bFrontline:=True;
      ReduceCard(3);
    end
    else
  if bDeployment and bPlayer2Turn then
   begin
     bFrontline:=True;
     IncreaseCard(3);
   end;
end;

procedure TfrmPlayingField.imgP2F4Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bFrontline:=True;
      ReduceCard(4);
    end
    else
  if bDeployment and bPlayer2Turn then
   begin
     bFrontline:=True;
     IncreaseCard(4);
   end;
end;

procedure TfrmPlayingField.imgP2F5Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bFrontline:=True;
      ReduceCard(5);
    end
    else
  if bDeployment and bPlayer2Turn then
   begin
     bFrontline:=True;
     IncreaseCard(5);
   end;
end;

procedure TfrmPlayingField.imgP2R1Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bReserve:=True;
      ReduceCard(1);
    end
    else
  if bDeployment and bPlayer2Turn then
   begin
     bReserve:=True;
     IncreaseCard(1);
   end;
end;

procedure TfrmPlayingField.imgP2R2Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bReserve:=True;
      ReduceCard(2);
    end
    else
   if bDeployment and bPlayer2Turn then
   begin
     bReserve:=True;
     IncreaseCard(2);
   end;
end;

procedure TfrmPlayingField.imgP2R3Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bReserve:=True;
      ReduceCard(3);
    end
    else
   if bDeployment and bPlayer2Turn then
   begin
     bReserve:=True;
     IncreaseCard(3);
   end;
end;

procedure TfrmPlayingField.imgP2R4Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bReserve:=True;
      ReduceCard(4);
    end
    else
   if bDeployment and bPlayer2Turn then
   begin
     bReserve:=True;
     IncreaseCard(4);
   end;
end;

procedure TfrmPlayingField.imgP2R5Click(Sender: TObject);
begin
  if bDeployment and bPlayer1Turn then
    begin
      bReserve:=True;
      ReduceCard(5);
    end
    else
   if bDeployment and bPlayer2Turn then
   begin
     bReserve:=True;
     IncreaseCard(5);
   end;
end;

procedure TfrmPlayingField.imgPic10Click(Sender: TObject);  //verwys na frmDeck. Die kode om die kaarte in die hand te display
begin                                                      // is amper identies aan die kode vir die decks.
  Activation(10);
end;

procedure TfrmPlayingField.imgPic11Click(Sender: TObject);
begin
  Activation(11);
end;

procedure TfrmPlayingField.imgPic12Click(Sender: TObject);
begin
  Activation(12);
end;

procedure TfrmPlayingField.imgPic1Click(Sender: TObject);
begin
  Activation(1);
end;

procedure TfrmPlayingField.imgPic2Click(Sender: TObject);
begin
   Activation(2);
end;

procedure TfrmPlayingField.imgPic3Click(Sender: TObject);
begin
   Activation(3);
end;

procedure TfrmPlayingField.imgPic4Click(Sender: TObject);
begin
   Activation(4);
end;

procedure TfrmPlayingField.imgPic5Click(Sender: TObject);
begin
   Activation(5);
end;

procedure TfrmPlayingField.imgPic6Click(Sender: TObject);
begin
   Activation(6);
end;

procedure TfrmPlayingField.imgPic7Click(Sender: TObject);
begin
   Activation(7);
end;

procedure TfrmPlayingField.imgPic8Click(Sender: TObject);
begin
   Activation(8);
end;

procedure TfrmPlayingField.imgPic9Click(Sender: TObject);
begin
   Activation(9);
end;

procedure TfrmPlayingField.IncreaseCard(iNumber: Integer);
begin
  if (bPlayer1Turn) and (bDeployment)   then
  begin

  if bReserve then  //Word gebruik om te bepaal waar die kaart is wat geclick is.
     begin

          lbl:=(FindComponent('lblP1R'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)+iIncrement);

          bDeployment:=False;
      end
      else
  if bFrontline then
     begin
          lbl:=(FindComponent('lblP1F'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)+iIncrement);

          bDeployment:=False;
     end
  end
  else
    if (bPlayer2Turn) and (bDeployment) then
   begin

  if bReserve then  //Word gebruik om te bepaal waar die kaart is wat geclick is.
     begin

          lbl:=(FindComponent('lblP2R'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)+iIncrement);

          bDeployment:=False;
      end
      else
  if bFrontline then
     begin
          lbl:=(FindComponent('lblP2F'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)+iIncrement);

          bDeployment:=False;
     end
  end

end;

procedure TfrmPlayingField.Activation(iNumber: Integer);    //Die kode kom meestal van frmDecks af.
var                                                        // m.a.w copy en paste.
  iCode:Integer;
  bVlag:Boolean;
  sLine:String;
begin
  bVlag:=True;
  mmoInfo.Clear;

  AssignFile(tColonial,TextFileLocation+'Colonials.txt');
  AssignFile(tWarden,TextFileLocation+'Wardens.txt');
  AssignFile(tVanguard,TextFileLocation+'vanguards.txt');

  Try
    Begin
      reset(tColonial);
      reset(tWarden);
      reset(tVanguard);
    End;
  Except
     ShowMessage('One of these text files: Colonials.txt,wardens.txt,Vanguard.txt does not exist.');
     Close;
  End;

if bPlayer1Turn then
 begin
  if frmThroneRoom.sPlayer1Deck ='Colonial' then
  begin
    imgInfo.Picture.LoadFromFile(ColonialsDeck+arrColonialNames[iNumber]);

  repeat
  { Die paragrawe is basies gebruik om Inligting oor sekere kaarte te display op die memo.
  Omdat die gebruiker self die kaarte kies om na te kyk moet mens presies ''locate'' watse
  inligting om uit die text files te haal}
   begin
       readLn(tColonial,sLine);
       Val(Copy(sLine,1,2),iNum,iCode);
     if (iCode=2) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
       repeat
          begin
          readLn(tColonial,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          mmoInfo.Lines.Add(sLine);

         end;

       until bVlag=False
      end
       else

       if (iCode=0) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
        repeat
          begin
          readLn(tColonial,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          if EOF(tColonial) then  bVlag:=False
          else
          mmoInfo.Lines.Add(sLine);

        end;

       until bVlag=False

     end
      end
  until EOF(tColonial);
   CloseFile(tColonial)
  end

  else


  if frmThroneRoom.sPlayer1Deck ='Warden'  then
  begin
    imgInfo.Picture.LoadFromFile(WardensDeck+arrWardenNames[iNumber]);
  repeat
   begin
       readLn(tWarden,sLine);
       Val(Copy(sLine,1,2),iNum,iCode);
     if (iCode=2) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
       repeat
          begin
          readLn(tWarden,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          mmoInfo.Lines.Add(sLine);

         end;

       until bVlag=False
      end
       else

       if (iCode=0) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
        repeat
          begin
          readLn(tWarden,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          if EOF(tWarden) then  bVlag:=False
          else
          mmoInfo.Lines.Add(sLine);

        end;

       until bVlag=False

     end
   end;
  until EOF(tWarden);
   CloseFile(tWarden)
  end
  else



  if frmThroneRoom.sPlayer1Deck ='Vanguard' then
  begin
    imgInfo.Picture.LoadFromFile(VanguardsDeck+arrVanguardNames[iNumber]);

  repeat
   begin
       readLn(tVanguard,sLine);
       Val(Copy(sLine,1,2),iNum,iCode);
     if (iCode=2) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
       repeat
          begin
          readLn(tVanguard,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          mmoInfo.Lines.Add(sLine);

         end;

       until bVlag=False
      end
       else

       if (iCode=0) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
        repeat
          begin
          readLn(tVanguard,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          if EOF(tVanguard) then  bVlag:=False
          else
          mmoInfo.Lines.Add(sLine);

        end;

       until bVlag=False

     end
      end
  until EOF(tVanguard);
   CloseFile(tVanguard)
  end;
 end
 else
 if bPlayer2Turn then
  begin
  if frmThroneRoom.sPlayer2Deck ='Colonial' then
  begin
    imgInfo.Picture.LoadFromFile(ColonialsDeck+arrColonialNames[iNumber]);

  repeat
  { Die paragrawe is basies gebruik om Inligting oor sekere kaarte te display op die memo.
  Omdat die gebruiker self die kaarte kies om na te kyk moet mens presies ''locate'' watse
  inligting om uit die text files te haal}
   begin
       readLn(tColonial,sLine);
       Val(Copy(sLine,1,2),iNum,iCode);
     if (iCode=2) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
       repeat
          begin
          readLn(tColonial,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          mmoInfo.Lines.Add(sLine);

         end;

       until bVlag=False
      end
       else

       if (iCode=0) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
        repeat
          begin
          readLn(tColonial,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          if EOF(tColonial) then  bVlag:=False
          else
          mmoInfo.Lines.Add(sLine);

        end;

       until bVlag=False

     end
      end
  until EOF(tColonial);
   CloseFile(tColonial)
  end

  else


  if frmThroneRoom.sPlayer2Deck ='Warden'  then
   begin
     imgInfo.Picture.LoadFromFile(WardensDeck+arrWardenNames[iNumber]);
   repeat
    begin
       readLn(tWarden,sLine);
       Val(Copy(sLine,1,2),iNum,iCode);
     if (iCode=2) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
       repeat
          begin
          readLn(tWarden,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          mmoInfo.Lines.Add(sLine);

         end;

       until bVlag=False
      end
       else

       if (iCode=0) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
        repeat
          begin
          readLn(tWarden,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          if EOF(tWarden) then  bVlag:=False
          else
          mmoInfo.Lines.Add(sLine);

        end;

       until bVlag=False

      end
     end;
    until EOF(tWarden);
   CloseFile(tWarden)
 end
  else



  if frmThroneRoom.sPlayer2Deck ='Vanguard' then
  begin
    imgInfo.Picture.LoadFromFile(VanguardsDeck+arrVanguardNames[iNumber]);

  repeat
   begin
       readLn(tVanguard,sLine);
       Val(Copy(sLine,1,2),iNum,iCode);
     if (iCode=2) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
       repeat
          begin
          readLn(tVanguard,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          mmoInfo.Lines.Add(sLine);

         end;

       until bVlag=False
      end
       else

       if (iCode=0) and (iNum=iNumber) then
        begin
          mmoInfo.Lines.Add(sLine);
        repeat
          begin
          readLn(tVanguard,sLine);
          Val(Copy(sLine,1,2),iNum,iCode);

          if (icode=2) and (iNum=iNumber+1) then
           bVlag:=False
          else
          if (icode=0) and (iNum=iNumber+1) then bVlag:=False
           else
          if EOF(tVanguard) then  bVlag:=False
          else
          mmoInfo.Lines.Add(sLine);

        end;

       until bVlag=False

     end
      end
  until EOF(tVanguard);
   CloseFile(tVanguard)
   end;
 end;
  iNum:=iNumber;
end;
                                                                        //Hierdie panels is baie belangrik
                                                                        //basies die panels wat geclick word om
                                                                        //kaarte op die field te sit.
procedure TfrmPlayingField.pnlPlayer1FrontlineNumClick(Sender: TObject);
begin
 if MessageDlg('Are you sure you want to place this card here?',mtWarning,[mbOk,mbCancel],0)=mrOk then
 begin
  pnlPlayer1Frontline.Enabled:=True;
  pnlPlayer1Reserve.Enabled:=True;
   if (bDeployment) and (sPlayer1Deck=Col) and (bPlayer1Turn) then
  begin
    inc(F);
    if F=6 then F:=1;

    image:= (FindComponent('imgP1F'+IntToStr(F))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrColonialNames[iNum]);

    lbl:=(FindComponent('lblP1F'+IntToStr(F))) as tLabel;
    lbl.Caption:=IntToStr(arrColonialValues[iNum]);

    pnlPlayer1FrontLineNum.Caption:=IntToStr(StrToINT(pnlPlayer1FrontLineNum.Caption) +arrColonialValues[iNum]);
    arrPlayer1Frontline[F]:=iNum;
    Deployment(iNum);

    arrPlayer1Hand[iNum]:=True;

    //
  end
  else
    if (bDeployment) and (sPlayer1Deck=War) and (bPlayer1Turn) then
  begin
    inc(F);
    if F=6 then F:=1;
    image:= (FindComponent('imgP1F'+IntToStr(F))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrWardenNames[iNum]);

    lbl:=(FindComponent('lblP1F'+IntToStr(F))) as tLabel;
    lbl.Caption:=IntToStr(arrWardenValues[iNum]);

    pnlPlayer1FrontLineNum.Caption:=IntToStr(StrToInt(pnlPlayer1FrontLineNum.Caption) +arrWardenValues[iNum]);
    arrPlayer1Frontline[F]:=iNum;
    Deployment(iNum);

    arrPlayer1Hand[iNum]:=True;

    //
  end
  else
   if (bDeployment) and (sPlayer1Deck=Van) and (bPlayer1Turn)  then
  begin
    inc(F);
    if F=6 then F:=1;
    image:= (FindComponent('imgP1F'+IntToStr(F))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrVanguardNames[iNum]);

    lbl:=(FindComponent('lblP1F'+IntToStr(F))) as tLabel;
    lbl.Caption:=IntToStr(arrVanguardValues[iNum]);

    arrPlayer1Frontline[F]:=iNum;
    pnlPlayer1FrontLineNum.Caption:=IntToStr(StrToINT(pnlPlayer1FrontLineNum.Caption) +arrVanguardValues[iNum]);
    Deployment(iNum);

    arrPlayer1Hand[iNum]:=True;

    //
  end;
  pnlPlayer1FrontlineNum.Enabled:=False;
  pnlPlayer1ReserveNum.Enabled:=False;

 end;


end;

procedure TfrmPlayingField.pnlPlayer1ReserveNumClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to place this card here?',mtWarning,[mbOk,mbCancel],0)=mrOk then
 begin
  pnlPlayer1Frontline.Enabled:=True;
  pnlPlayer1Reserve.Enabled:=True;
   if (bDeployment) and (sPlayer1Deck=Col) and (bPlayer1Turn) then
  begin
    inc(R);
    if R=6 then R:=1;
    image:= (FindComponent('imgP1R'+IntToStr(R))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrColonialNames[iNum]);

    lbl:=(FindComponent('lblP1R'+IntToStr(R))) as tLabel;
    lbl.Caption:=IntToStr(arrColonialValues[iNum]);

    pnlPlayer1ReserveNum.Caption:=IntToStr(StrToINT(pnlPlayer1ReserveNum.Caption) +arrcolonialValues[iNum]);
    arrPlayer1Reserve[R]:=iNum;
    Deployment(iNum);

    arrPlayer1Hand[iNum]:=True;

    //
  end
  else
    if (bDeployment) and (sPlayer1Deck=War)  and (bPlayer1Turn)  then
  begin
    inc(R);
    if R=6 then R:=1;
    image:= (FindComponent('imgP1R'+IntToStr(R))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrWardenNames[iNum]);

    lbl:=(FindComponent('lblP1R'+IntToStr(R))) as tLabel;
    lbl.Caption:=IntToStr(arrWardenValues[iNum]);


    pnlPlayer1ReserveNum.Caption:=IntToStr(StrToINT(pnlPlayer1ReserveNum.Caption) +arrWardenValues[iNum]);
    arrPlayer1Reserve[R]:=iNum;
    Deployment(iNum);

    arrPlayer1Hand[iNum]:=True;

    //
  end
  else
   if (bDeployment) and (sPlayer1Deck=Van) and (bPlayer1Turn) then
  begin
    inc(R);
    if R=6 then R:=1;
    image:= (FindComponent('imgP1R'+IntToStr(R))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrVanguardNames[iNum]);

    lbl:=(FindComponent('lblP1R'+IntToStr(R))) as tLabel;
    lbl.Caption:=IntToStr(arrVanguardValues[iNum]);


    pnlPlayer1ReserveNum.Caption:=IntToStr(StrToINT(pnlPlayer1ReserveNum.Caption) +arrVanguardValues[iNum]);
    arrPlayer1Reserve[R]:=iNum;
    Deployment(iNum);

    arrPlayer1Hand[iNum]:=True;

    //
  end;
  pnlPlayer1FrontlineNum.Enabled:=False;
  pnlPlayer1ReserveNum.Enabled:=False;
 end;

end;

procedure TfrmPlayingField.pnlPlayer2FrontlineNumClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to place this card here?',mtWarning,[mbOk,mbCancel],0)=mrOk then
 begin
  pnlPlayer2Frontline.Enabled:=True;
  pnlPlayer2Reserve.Enabled:=True;
 if (bDeployment) and (sPlayer2Deck=Col) and (bPlayer2Turn) then
  begin
    inc(F2);
    if F2=6 then F2:=1;
    image:= (FindComponent('imgP2F'+IntToStr(F2))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrColonialNames[iNum]);

    lbl:=(FindComponent('lblP2F'+IntToStr(F2))) as tLabel;
    lbl.Caption:=IntToStr(arrColonialValues[iNum]);


    pnlPlayer2FrontlineNum.Caption:=IntToStr(StrToInt(pnlPlayer2FrontlineNum.Caption) +arrColonialValues[iNum]);
    arrPlayer2Frontline[F2]:=iNum;
    Deployment(iNum);

    arrPlayer2Hand[iNum]:=True;

    //
  end
  else
    if (bDeployment) and (sPlayer2Deck=War) and (bPlayer2Turn) then
  begin
    inc(F2);
    if F2=6 then F2:=1;
    image:= (FindComponent('imgP2F'+IntToStr(F2))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrWardenNames[iNum]);

    lbl:=(FindComponent('lblP2F'+IntToStr(F2))) as tLabel;
    lbl.Caption:=IntToStr(arrWardenValues[iNum]);


    pnlPlayer2FrontlineNum.Caption:=IntToStr(StrToInt(pnlPlayer2FrontlineNum.Caption) +arrWardenValues[iNum]);
    arrPlayer2Frontline[F2]:=iNum;
    Deployment(iNum);

    arrPlayer2Hand[iNum]:=True;
    //
  end
  else
   if (bDeployment) and (sPlayer2Deck=Van) and (bPlayer2Turn) then
  begin
    inc(F2);
    if F2=6 then F2:=1;
    image:= (FindComponent('imgP2F'+IntToStr(F2))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrVanguardNames[iNum]);

    lbl:=(FindComponent('lblP2F'+IntToStr(F2))) as tLabel;
    lbl.Caption:=IntToStr(arrVanguardValues[iNum]);


    pnlPlayer2FrontlineNum.Caption:=IntToStr(StrToInt(pnlPlayer2FrontlineNum.Caption) +arrVanguardValues[iNum]);
    arrPlayer2Frontline[F2]:=iNum;
    Deployment(iNum);

    arrPlayer2Hand[iNum]:=True;



    //
  end;
  pnlPlayer2FrontlineNum.Enabled:=False;
  pnlPlayer2ReserveNum.Enabled:=False;
 end;

end;

procedure TfrmPlayingField.pnlPlayer2ReserveNumClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to place this card here?',mtWarning,[mbOk,mbCancel],0)=mrOk then
 begin
  pnlPlayer2Frontline.Enabled:=True;
  pnlPlayer2Reserve.Enabled:=True;
  if (bDeployment) and (sPlayer2Deck=Col) and (bPlayer2Turn) then
  begin
    inc(R2);
    if R2=6 then R2:=1;
    image:= (FindComponent('imgP2R'+IntToStr(R2))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrColonialNames[iNum]);

    lbl:=(FindComponent('lblP2R'+IntToStr(R2))) as tLabel;
    lbl.Caption:=IntToStr(arrColonialValues[iNum]);


    pnlPlayer2ReserveNum.Caption:=IntToStr(StrToInt(pnlPlayer2ReserveNum.Caption) +arrColonialValues[iNum]);
    arrPlayer2Frontline[F2]:=iNum;
    Deployment(iNum);

    arrPlayer2Hand[iNum]:=True;
    //
  end
  else
    if (bDeployment) and (sPlayer2Deck=War) and (bPlayer2Turn) then
  begin
    inc(R2);
    if R2=6 then R2:=1;
    image:= (FindComponent('imgP2R'+IntToStr(R2))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrWardenNames[iNum]);

    lbl:=(FindComponent('lblP2R'+IntToStr(R2))) as tLabel;
    lbl.Caption:=IntToStr(arrWardenValues[iNum]);


    pnlPlayer2ReserveNum.Caption:=IntToStr(StrToInt(pnlPlayer2ReserveNum.Caption) +arrWardenValues[iNum]);
    arrPlayer2Frontline[F2]:=iNum;
    Deployment(iNum);

    arrPlayer2Hand[iNum]:=True;

    //
  end
  else
   if (bDeployment) and (sPlayer2Deck=Van) and (bPlayer2Turn) then
  begin
    inc(R2);
    if R2=6 then R2:=1;
    image:= (FindComponent('imgP2R'+IntToStr(R2))) as TImage;//iNum=iNumber en iNumber is local variable by procedure activation
    image.Picture.LoadFromFile(sDeckLocation+arrVanguardNames[iNum]);

    lbl:=(FindComponent('lblP2R'+IntToStr(R2))) as tLabel;
    lbl.Caption:=IntToStr(arrVanguardValues[iNum]);


    pnlPlayer2ReserveNum.Caption:=IntToStr(StrToInt(pnlPlayer2ReserveNum.Caption) +arrVanguardValues[iNum]);
    arrPlayer2Frontline[F2]:=iNum;
    Deployment(iNum);

    arrPlayer2Hand[iNum]:=True;

    //
  end;
  pnlPlayer2FrontlineNum.Enabled:=False;
  pnlPlayer2ReserveNum.Enabled:=False;

 end;
end;

procedure TfrmPlayingField.ReduceCard(iNumber:Integer);  //Alweer verwys asb na faction info en decks in die ander folders
                                                         // van my PAT vir addisionele inligting.
begin


   if (bPlayer1Turn) and (bDeployment)   then
   begin

   if bReserve then
     begin
      pnlPlayer2Frontline.Enabled:=False;
       if (sPlayer2Deck=Col) then
        begin
          if (bPlane) and (Not arrPlayer2Reserve[iNumber] In[11..12]) then   //Interception van vliegtuie
          begin
          ShowMEssage('Please select a valid card');
          bDeployment:=True;
          end
        else
         begin
         if arrPlayer2Reserve[iNumber] in [10,12] then iReduction:=iReduction-1; //armoured units of bomber wat damage verminder.

         if bRadar then iReduction:=iReduction-1;

          begin
          lbl:=(FindComponent('lblP2R'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

          if StrToINt(lbl.Caption)<1 then
          begin
            lbl.Caption:=INtToSTr(0);

            if arrPlayer2Reserve[iNumber]=9 then bRadar:=False;

            image:=(FindComponent('imgP2R'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
          end;
          bDeployment:=False;
          end;
         end;
         end

     end

     else

      if (sPlayer2Deck=War) then
        begin
           if (Bplane) and (Not arrPlayer2Reserve[iNumber] In[2,3,10,11]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
          else
          begin
          if arrPlayer2Reserve[iNumber] in [5,10] then iReduction:=iReduction-1;

           begin
           lbl:=(FindComponent('lblP2R'+IntToStr(iNumber))) as TLabel;
           lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

            if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);
            image:=(FindComponent('imgP2R'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
          end;
           bDeployment:=False;
          end;

        end

      else

      if (sPlayer2Deck=Van) then
        begin
            if (Bplane) and (Not arrPlayer2Reserve[iNumber]=1) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
         else
         if arrPlayer2Reserve[iNumber] in [12] then iReduction:=iReduction-1;

          begin
          lbl:=(FindComponent('lblP2R'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

             if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);
            image:=(FindComponent('imgP2R'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil; //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
          end;
        end;


      if bFrontline then
     begin
      pnlPlayer2Reserve.Enabled:=False;
       if (sPlayer2Deck=Col) then
        begin
            if (Bplane) and (Not arrPlayer2Frontline[iNumber] In[10,11]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
          else
         if arrPlayer2Frontline[iNumber] in [10,12] then iReduction:=iReduction-1;

          if bRadar then iReduction:=iReduction-1;

          begin
          lbl:=(FindComponent('lblP2F'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

            if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);

            if arrPlayer2Frontline[iNumber]=9 then bRadar:=False;

            image:=(FindComponent('imgP2F'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
           end;
         end


         else

      if (sPlayer2Deck=War) then
        begin
           if (Bplane) and (Not arrPlayer2Frontline[iNumber] In[2,3,10,11]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
         else
         if arrPlayer2Frontline[iNumber] in [5,10] then iReduction:=iReduction-1;

          begin
          lbl:=(FindComponent('lblP2F'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

            if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);
            image:=(FindComponent('imgP2F'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
          end;
        end

      else

      if (sPlayer2Deck=Van) then
        begin
           if (Bplane) and (Not arrPlayer2Frontline[iNumber] In[1]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
         else
         if arrPlayer2Frontline[iNumber] in [12] then iReduction:=iReduction-1;

          begin
          lbl:=(FindComponent('lblP2F'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

            if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);
            image:=(FindComponent('imgP2F'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
         end;
        end;


     end;

    pnlPlayer2Frontline.Enabled:=False;
     pnlPlayer2Reserve.Enabled:=False;
     if bAnother then
     begin
      bDeployment:=True;
      pnlPlayer1Frontline.Enabled:=True;
      pnlPlayer1Reserve.Enabled:=True;
     end;
   end


  else
    if bPlayer2Turn then
  begin
    if bReserve then
     begin
      pnlPlayer2Frontline.Enabled:=False;
       if (sPlayer1Deck=Col) then
        begin
           if (Bplane) and (Not arrPlayer1Reserve[iNumber] In[10,11]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
         else
         if arrPlayer1Reserve[iNumber] in [10,12] then iReduction:=iReduction-1;

         if bRadar then iReduction:=iReduction-1
         else
         begin

          lbl:=(FindComponent('lblP1R'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

          if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);

            if arrPlayer1Reserve[iNumber]=9 then bRadar:=False;
            
            image:=(FindComponent('imgP1R'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
        end;
        end;
     end

     else

      if (sPlayer1Deck=War) then

       begin
           if (Bplane) and (Not arrPlayer1Reserve[iNumber] In[2,3,10,11]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
         else
          if arrPlayer1Reserve[iNumber] in [5,10] then iReduction:=iReduction-1;

         begin
          lbl:=(FindComponent('lblP1R'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

          if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);
            image:=(FindComponent('imgP1R'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
        end;
        end

      else

      if (sPlayer1Deck=Van) then
       begin
           if (Bplane) and (Not arrPlayer1Reserve[iNumber] In[1]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
         else
         if arrPlayer1Reserve[iNumber] in [12] then iReduction:=iReduction-1;

        begin
          lbl:=(FindComponent('lblP1R'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

          if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);
            image:=(FindComponent('imgP1R'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
        end;
       end;


      if bFrontline then
     begin
      pnlPlayer2Reserve.Enabled:=False;
       if (sPlayer1Deck=Col) then
        begin
            if (Bplane) and (Not arrPlayer1Frontline[iNumber] In[10,11]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
         else
         if bRadar then iReduction:=iReduction-1;

         if arrPlayer1Frontline[iNumber] in [10,12] then iReduction:=iReduction-1;

         begin

          lbl:=(FindComponent('lblP1F'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

           if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);

            if arrPlayer1Frontline[iNumber]=9 then bRadar:=False;

            image:=(FindComponent('imgP1F'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
         end;
        end

         else

      if (sPlayer1Deck=War) then
        begin
             if (Bplane) and (Not arrPlayer1Frontline[iNumber] In[2,3,10,11]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
         else
         if arrPlayer1Frontline[iNumber] in [5,10] then iReduction:=iReduction-1;

         begin
          lbl:=(FindComponent('lblP1F'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);

          if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);
            image:=(FindComponent('imgP1F'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
         end;

        end

      else

      if (sPlayer1Deck=Van) then
        begin
             if (Bplane) and (Not arrPlayer1Frontline[iNumber] In[1]) then
          begin
           ShowMEssage('Please select a valid card');
           bDeployment:=True;
           end
         else
         if arrPlayer1Frontline[iNumber] in [12] then iReduction:=iReduction-1;

          lbl:=(FindComponent('lblP1F'+IntToStr(iNumber))) as TLabel;
          lbl.Caption:=IntToStr(StrToInt(lbl.Caption)-iReduction);
         begin
          if StrToINt(lbl.Caption)<1 then
           begin
            lbl.Caption:=IntToSTr(0);
            image:=(FindComponent('imgP1F'+IntToStr(iNumber))) as Timage;
            image.Picture.Bitmap:=nil;  //het die gekry op die internet om n image in runtime te clear
            image.Refresh;
           end;
           bDeployment:=False;
         end;
        end;

     end;
     pnlPlayer1Frontline.Enabled:=False;
     pnlPlayer1Reserve.Enabled:=False;
     if bAnother then
     begin
      bDeployment:=True;
      pnlPlayer2Frontline.Enabled:=True;
      pnlPlayer2Reserve.Enabled:=True;
     end;


  end;



  bPlane:=False;
end;

 //En na 10 jaar is Die PAT uiteindelik klaar :)

end.
