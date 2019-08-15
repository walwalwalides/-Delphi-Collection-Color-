{ ============================================
  Software Name : 	SetOfColors
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  CColor = (olive, red, blue, yellow, green, white, black, orange, gray);
  Colors = set of CColor;
  PColors = ^CColor;

  TfrmMain = class(TForm)
    clLstBoxColors: TColorListBox;
    pnlHead: TPanel;
    btnAdd: TButton;
    BindingsList: TBindingsList;
    btnDisplay: TButton;
    lstBoxColor: TListBox;
    btnReset: TButton;
    pnlChoiceColor: TPanel;
    pnlBottom: TPanel;
    LinkControlToPropertyColor2: TLinkControlToProperty;
    actLstMain: TActionList;
    actClear: TAction;
    actSum: TAction;
    actOpenFile: TAction;
    actShowInExplorer: TAction;
    actOpenFolder: TAction;
    actExit: TAction;
    actFrame1: TAction;
    actOption: TAction;
    actAbout: TAction;
    actFrame2: TAction;
    MMMain: TMainMenu;
    File1: TMenuItem;
    OpenFiles1: TMenuItem;
    OpenFolders1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    View1: TMenuItem;
    Refresh1: TMenuItem;
    N2: TMenuItem;
    Frame21: TMenuItem;
    A2: TMenuItem;
    actAbout1: TMenuItem;
    procedure btnAddClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstBoxColorMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure actExitExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure DisplayColors(c: Colors);
    procedure AddToListBox(MyListBox: TListBox; YourString: String);
    function StringToCharSet(const Txt: string): Colors;
    function StringToMySet(const Str: string): Colors;
    function MySetToString(MySet: Colors): string;
  public
    { Public-Deklarationen }
  end;

var
  frmMain: TfrmMain;

implementation

uses uAbout, System.TypInfo;

{$R *.dfm}

var
  c: Colors;

procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  f: TfrmAbout;
begin

  if not Assigned(f) then
    Application.CreateForm(TfrmAbout, f);
  f.Position := poMainFormCenter;
  try
    f.ShowModal;
  finally
    FreeAndNil(f);
  end;

end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.AddToListBox(MyListBox: TListBox; YourString: String);
  function ExtractIndex(S: String): Integer;
  var
    i: Integer;
    buffer: String;
  begin
    buffer := '';
    for i := Length(S) downto 1 do
      if S[i] in ['0' .. '9'] then
        buffer := S[i] + buffer;
    Result := StrToIntDef(buffer, 1);
  end;

var
  index: Integer;
  item: String;
begin
  index := ExtractIndex(YourString);
  item := Copy(YourString, 1, Length(YourString) - Length(IntToStr(index)));
  while MyListBox.Items.IndexOf(IntToStr(index) + item) > -1 do // auto increase
    Inc(index);
  if (index > 9) or (lstBoxColor.Items.count > 9) then
    exit;

  MyListBox.Items.Add(IntToStr(index) + item)

end;

function TfrmMain.StringToCharSet(const Txt: string): Colors;
var
  CP: PColors;
begin
  Result := [];

  if Txt = '' then
    exit;
  CP := PColors(Txt);
  while CP^ = red do
  begin
    Include(Result, CP^);
    Inc(CP);
  end;
end;

function TfrmMain.StringToMySet(const Str: string): Colors;
var
  i: CColor;
begin
  Result := [];
  for i := Low(i) to High(i) do
    if Pos(LowerCase(GetEnumName(TypeInfo(CColor), Ord(i))),LowerCase(Str)) <> 0 then
      Include(Result, i);
end;

function TfrmMain.MySetToString(MySet: Colors): string;
var
  i: CColor;
begin
  Result := '';
  // one way to iterate
  for i := Low(i) to High(i) do
    if i in MySet then
      Result := Result + GetEnumName(TypeInfo(CColor), Ord(i)) + ' ';
end;

procedure TfrmMain.btnAddClick(Sender: TObject);
var
  sChoiceColor: string;
  tmpC: Colors;
begin
  sChoiceColor := ColorToString(pnlChoiceColor.Color);
  sChoiceColor := Copy(sChoiceColor, 3, Length(sChoiceColor));
  AddToListBox(lstBoxColor, '- ' + sChoiceColor + ' ');
//   ShowMessage(GetEnumName(TypeInfo(CColor),Ord(red)));
   tmpC:=StringToMySet(sChoiceColor);
   c := c + tmpC;


end;

procedure TfrmMain.btnDisplayClick(Sender: TObject);
begin
  DisplayColors(c);
end;

procedure TfrmMain.btnResetClick(Sender: TObject);
begin
  lstBoxColor.Items.Clear;
  lstBoxColor.Refresh;

end;

procedure TfrmMain.DisplayColors(c: Colors);
const
  names: array [CColor] of string[9] = ('olive', 'red', 'blue', 'yellow', 'green', 'white', 'black', 'orange', 'gray');   //Color Choices Limiting
var
  cl: CColor;
  S: string;
begin
  for cl := olive to gray do
    if cl in c then
    begin
      if (S <> '') then
        S := S + ',';
      S := S + names[cl];
    end;
  ShowMessage(S);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Self.Position := poMainFormCenter;
  Self.Color := clWhite;
end;

procedure TfrmMain.lstBoxColorMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  p.X := X;
  p.Y := Y;
  lstBoxColor.ItemIndex := lstBoxColor.ItemAtPos(p, True);
end;

end.
