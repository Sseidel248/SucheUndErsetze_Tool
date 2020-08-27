unit Main_SUE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    MemoSuche: TMemo;
    MemoErsetze: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    SucheErsetzeBtn: TButton;
    Label3: TLabel;
    Label4: TLabel;
    OldProtPath: TEdit;
    NewProtPath: TEdit;
    LoadBtn: TButton;
    OldRichEdit1: TRichEdit;
    Splitter1: TSplitter;
    NewRichEdit2: TRichEdit;
    ComboBox1: TComboBox;
    SaveBtn: TButton;
    OldPathButton: TButton;
    NewPathBtn: TButton;
    Label5: TLabel;
    SucheBtn: TButton;
    PopupMenu1: TPopupMenu;
    AufStandartzurcksetzen1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure OldProtPathChange(Sender: TObject);
    procedure NewProtPathChange(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure OldPathButtonClick(Sender: TObject);
    procedure NewPathBtnClick(Sender: TObject);
    procedure SucheErsetzeBtnClick(Sender: TObject);
    procedure MemoSucheChange(Sender: TObject);
    procedure MemoErsetzeChange(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure SucheBtnClick(Sender: TObject);
    procedure AufStandartzurcksetzen1Click(Sender: TObject);
  private
    procedure ListFileDir(Path: string; var FileList: TStrings);
    function SelectPath : String;
    procedure SearchForStrIn( var OldRichEdit1 : TRichEdit );overload;
    function SearchForStrIn( Liste : TStrings) : integer; overload;
    procedure ReplaceStr;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.SucheBtnClick(Sender: TObject);
begin
  SearchForStrIn( OldRichEdit1 );
end;

procedure TForm1.AufStandartzurcksetzen1Click(Sender: TObject);
begin
  //suche und ersetzen Groupe
  MemoSuche.Enabled := false;
  MemoErsetze.Enabled := false;
  SucheErsetzeBtn.Enabled := false;
  SucheBtn.Enabled := false;

  //zur�cksetzen auf Standart
  ComboBox1.Clear;
  ComboBox1.Items.Add( '- Bitte Protokol w�hlen -' );
  OldRichEdit1.Clear;
  NewRichEdit2.Clear;
  MemoSuche.Clear;
  MemoErsetze.Clear;
  NewProtPath.Clear;
  OldProtPath.Clear;
end;

procedure TForm1.ComboBox1Select(Sender: TObject);
var
Liste : TStrings;
begin
  OldRichEdit1.Clear;
  NewRichEdit2.Clear;

  if ComboBox1.Text = '- Bitte Protokol w�hlen -' then
    Exit;

  Liste := TStringList.Create;
  try
    Liste.LoadFromFile( ComboBox1.Text );

    OldRichEdit1.Lines.AddStrings( Liste );
  finally
    Liste.Free;
  end;

  if SucheErsetzeBtn.Enabled then
  begin
    SearchForStrIn( OldRichEdit1 );
    ReplaceStr;
  end
  else if SucheBtn.Enabled then
  begin
    SearchForStrIn( OldRichEdit1 );
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//suche und ersetzen Groupe
  MemoSuche.Enabled := false;
  MemoErsetze.Enabled := false;
  SucheErsetzeBtn.Enabled := false;
  SucheBtn.Enabled := false;

//speichern und combobox
  SaveBtn.Enabled := false;
  ComboBox1.Enabled := false;

//ladebtn
  LoadBtn.Enabled := false;
end;

procedure TForm1.ListFileDir(Path: string; var FileList: TStrings);
var
SR: TSearchRec;
PathToFile : String;
begin
  if FindFirst(Path + '\*.*', faAnyFile, SR) = 0 then
  begin
    repeat
    if (SR.Attr <> faDirectory) then
    begin
      PathToFile := Path + '\' + SR.Name;
      FileList.Add(PathToFile);
    end;
    until FindNext(SR) <> 0;
      FindClose(SR);
  end;
end;

procedure TForm1.LoadBtnClick(Sender: TObject);
var
Liste : TStrings;
begin
  MemoSuche.Enabled := true;
  MemoErsetze.Enabled := true;

  ComboBox1.Enabled := true;

  Liste := TStringList.Create;
  try
    ListFileDir( OldProtPath.Text, Liste );
    ComboBox1.Items.AddStrings( Liste );

  finally
    Liste.Free;
  end;
end;

procedure TForm1.MemoErsetzeChange(Sender: TObject);
var
SucheText : String;
ErsetzeText : String;
begin
  SucheText := MemoSuche.Text;
  ErsetzeText := MemoErsetze.Text;

  if ( not SucheText.Equals('') ) and (not ErsetzeText.Equals('') ) then
    SucheErsetzeBtn.Enabled := true;
end;

procedure TForm1.MemoSucheChange(Sender: TObject);
var
SucheText : String;
ErsetzeText : String;
begin
  SucheText := MemoSuche.Text;
  ErsetzeText := MemoErsetze.Text;

  if ( not SucheText.Equals('') ) and (not ErsetzeText.Equals('') ) then
    SucheErsetzeBtn.Enabled := true;

  if not SucheText.Equals('') then
    SucheBtn.Enabled := true;
end;

function TForm1.SelectPath : String;
var
OpenDialog : TFileOpenDialog;
begin
  OpenDialog := TFileOpenDialog.Create(nil);
  try
    OpenDialog.Title := 'Ordner ausw�hlen';
    OpenDialog.Options :=[fdoPickFolders];
    OpenDialog.Execute;
    Result := OpenDialog.FileName;
  finally
    OpenDialog.Free;
  end;

end;

procedure TForm1.NewPathBtnClick(Sender: TObject);
begin
  NewProtPath.Text := SelectPath;
end;

procedure TForm1.NewProtPathChange(Sender: TObject);
var
path : String;
begin
  Path := NewProtPath.Text;
  if not Path.Equals('') then
    SaveBtn.Enabled := true
  else
    SaveBtn.Enabled := false;

end;

procedure TForm1.OldPathButtonClick(Sender: TObject);
begin
  OldProtPath.Text := SelectPath;
end;

procedure TForm1.OldProtPathChange(Sender: TObject);
var
path : String;
begin
  Path := OldProtPath.Text;
  if not Path.Equals('') then
    LoadBtn.Enabled := true
  else
  begin
    LoadBtn.Enabled := false;
    ComboBox1.Enabled := false;
  end;

end;

procedure TForm1.SaveBtnClick(Sender: TObject);
var
SaveFile : String;
SavePath : String;
NewProtocole : TStrings;
I, FoundAt, index: Integer;
changed, unchanged : integer;
UnchangedFiles : TStrings;
begin
  changed := 0;
  unchanged := 0;
  SavePath := NewProtPath.Text;
  NewProtocole := TStringList.Create;
  UnchangedFiles := TStringlist.Create;
  try
    for I := 1 to ComboBox1.Items.count-1 do
    begin
      SaveFile := ExtractFileName( ComboBox1.Items[I] );
      NewProtocole.LoadFromFile( ComboBox1.Items[I] );
      index := SearchForStrIn( NewProtocole );
      if index <> -1 then
      begin
        NewProtocole.Text := StringReplace( NewProtocole.Text, MemoSuche.Text, MemoErsetze.Text, [] );
        NewProtocole.SaveToFile( SavePath + '\' + SaveFile );
        inc(changed);
      end
      else
      begin
        UnchangedFiles.Add( ComboBox1.Items[I] );
        inc(unchanged);
      end;
      NewProtocole.Clear;
    end;
    ShowMessage( '�nderungen gespeichert unter: ' + SavePath + sLineBreak
                  + 'Anzahl der ge�nderten Dateien: ' + IntToStr(changed) + sLineBreak
                  + 'Anzahl der nicht ge�nderten Dateien: ' + IntToStr(unchanged) );
    if unchanged > 0 then
      ShowMessage( 'Keine �nderungen an folgenden Dateien gemacht:' + sLineBreak + UnchangedFiles.Text );

  finally
    NewProtocole.Free;
    UnchangedFiles.Free;
  end;

end;

function TForm1.SearchForStrIn( Liste : TStrings) : integer;
var
suchstr : String;
begin
  suchstr := MemoSuche.Text;
  if (Liste.Text).Contains( suchstr ) then
    Result := 0
  else
    Result := -1
end;

procedure TForm1.SearchForStrIn( var OldRichEdit1 : TRichEdit );
var
FoundAt : LongInt;
begin
  with OldRichEdit1 do
  begin
    FoundAt := FindText( MemoSuche.Text, 0, Length( OldRichEdit1.Text ), [] );
    SelStart := FoundAt;
    SelLength := Length( MemoSuche.Text );
    SelAttributes.Style := [fsBold];
    SelAttributes.Color := clRed;

    if FoundAt <> -1 then
      Hint := 'Suche Erfolgreich!'
    else
      Hint := 'Suche nicht erfolgreich!';
  end;
end;

procedure TForm1.ReplaceStr;
var
FoundAt, FoundAtNew : longInt;
Liste : TStrings;
begin
  FoundAt := OldRichEdit1.FindText( MemoSuche.Text, 0, Length( OldRichEdit1.Text ), [] );
  with NewRichEdit2 do
  begin
    if FoundAt <> -1 then
    begin
      Liste := TStringList.Create;
      try
        Liste.LoadFromFile( ComboBox1.Text );
        Lines.AddStrings( Liste );
      finally
        Liste.Free;
      end;

      Text := StringReplace( Text, MemoSuche.Text, MemoErsetze.Text, [] );

      FoundAtNew := FindText( MemoErsetze.Text, 0, Length( Text ), [] );

      if FoundAtNew <> -1 then
      begin
        SelStart := FoundAtNew;
        SelLength := Length( MemoErsetze.Text );
        SelAttributes.Style := [fsBold];
        SelAttributes.Color := clGreen;
      end;
    end
    else
      lines.Add( 'Gesuchter Text nicht vorhanden!' );
  end;
end;

procedure TForm1.SucheErsetzeBtnClick(Sender: TObject);
begin
  SearchForStrIn( OldRichEdit1 );

  ReplaceStr;
end;

end.
