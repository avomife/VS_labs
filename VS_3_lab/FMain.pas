unit FMain;
{Ефимова Анастасия Андреевна
Задана квадратная матрица порядка n.
Составить вектор a, где a(i) -
среднее арифметическое элементов i-ой строки матрицы}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Menus, Spin;

const
  MaxN = 100;

type
  TVector = array[0..MaxN - 1] of Integer;

  TForm1 = class(TForm)
    strngrid: TStringGrid;
    mm: TMainMenu;
    NFile: TMenuItem;                                                                                     
    NNew: TMenuItem;
    NOpen: TMenuItem;
    NLine1: TMenuItem;
    NSave: TMenuItem;
    NSave_As: TMenuItem;
    NLine2: TMenuItem;
    NExit: TMenuItem;
    NProgram: TMenuItem;
    NProcess: TMenuItem;
    NChange_Size: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure NNewClick(Sender: TObject);
    procedure NOpenClick(Sender: TObject);
    procedure NSave_AsClick(Sender: TObject);
    procedure NSaveClick(Sender: TObject);
    procedure NExitClick(Sender: TObject);
    procedure NChange_SizeClick(Sender: TObject);
    procedure strngridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);  
    procedure strngridKeyPress(Sender: TObject; var Key: Char);
    procedure NProcessClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FileName: string;

implementation

uses FChan;
{$R *.dfm}

function IsFull(StringGrid: TStringGrid):Boolean;
var
  OK:boolean;
  i, j:integer;

begin
  i:=0;
  j:=0;
  OK:=true;
  While OK and (i<=StringGrid.ColCount-1) do
    while OK and (i<=StringGrid.ColCount-1) do
      begin
        while OK and (j<=StringGrid.RowCount-1) do
          begin
            if StringGrid.Cells[i,j]='' then
              OK:=False;
            j:=j+1;
          end;
        i:=i+1;
      end;
  result:=OK;
end;


function IsEmpty(StringGrid: TStringGrid):Boolean;
var
  OK:boolean;
  i, j:integer;

begin
  i:=0;
  j:=0;
  OK:=true;
  While OK and (i<=StringGrid.ColCount-1) do
    begin
      while OK and (i<=StringGrid.ColCount-1) do
        begin
          while OK and (j<=StringGrid.RowCount-1) do
            begin
              if StringGrid.Cells[i,j]<>'' then
                OK:=False;
              j:=j+1;
            end;
          i:=i+1;
        end;
    end;
  result:=OK;
end;

procedure SaveMatr(StringGrid: TStringGrid; FileName: string);
var
   f: TextFile;
   i, j: Integer;

begin
  AssignFile(f, FileName);
  Rewrite(f);
  with StringGrid do
    begin
      Writeln(f, rowcount);            //запись размера матрицы
      Writeln(f);
      for i := 0 to ColCount - 1 do              //запись элементов
        for j := 0 to RowCount - 1 do
          Writeln(F, Cells[i, j], ' ');
    end;
  CloseFile(F);
end;


procedure LoadMatr(StringGrid: TStringGrid; FileName: string);
var
  f: TextFile;
  i, j: Integer;
  order: integer;
  Elem: string;

begin
  AssignFile(f, FileName);
  Reset(f);
  with StringGrid do
    begin
      Readln(f, order);                       //считывание размера
      readln(f);
      ColCount:=order;
      RowCount:=order;
      for i := 0 to ColCount - 1 do               //считывание элементов
        for j := 0 to RowCount - 1 do
        begin
          Readln(f, Elem);
          Cells[i, j]:= Elem;
        end;
    end;
  CloseFile(f);
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  OpenDialog.InitialDir:=ExtractFilePath(Application.ExeName);
  SaveDialog.InitialDir:=ExtractFilePath(Application.ExeName);
  strngrid.Visible:=False;
end;


procedure TForm1.NNewClick(Sender: TObject);
var buttonselected, i: integer;

begin
  Form2.button:='Сохранить существующие данные?';
  Form2.ShowModal;
  buttonselected:=Form2.buttonselected2;
  if buttonSelected = mrYes
  then
    begin
      if SaveDialog.Execute
      then
        SaveMatr(strngrid, SaveDialog.FileName);
    end;
  for i:=0 to strngrid.colcount do
    strngrid.cols[i].Clear;
  strngrid.RowCount:=form2.rowcount;
  strngrid.ColCount:=form2.colcount;
end;


procedure TForm1.NOpenClick(Sender: TObject);
var
 i, buttonselected: Integer;

begin
  strngrid.Visible:=true;
  if not IsEmpty(strngrid) then
    begin
      buttonSelected:=MessageDlg('Сохранить существующие данные?', mtCustom, mbYesNoCancel, 0);
        if buttonSelected = mrYes then
          begin
            if SaveDialog.Execute then
              SaveMatr(strngrid, SaveDialog.FileName);
          end
        else
          if buttonSelected = mrNo then
            begin
              for i:=0 to strngrid.colcount do
                strngrid.cols[i].Clear;
            end
    end
  else
    strngrid.Enabled:=True;

  if OpenDialog.Execute then
    begin
      for i:=0 to strngrid.colcount do
        strngrid.cols[i].Clear;
      FileName:=OpenDialog.FileName;
      LoadMatr(strngrid, OpenDialog.FileName);
    end;
end;


procedure TForm1.NSave_AsClick(Sender: TObject);
begin
  SaveDialog.FileName:=FileName;
  if SaveDialog.Execute then
    begin
      FileName:=SaveDialog.FileName;
      SaveMatr(strngrid, SaveDialog.FileName)
    end;
end;


procedure TForm1.NSaveClick(Sender: TObject);
begin
  if FileName='' then
    NSave_As.Click
  else
    SaveMatr(strngrid, FileName);
end;

procedure TForm1.NExitClick(Sender: TObject);
begin
  close
end;

procedure TForm1.NChange_SizeClick(Sender: TObject);
begin
  form2.button:='Данные могут быть удалены. Продолжить?';
  form2.ShowModal;
  if form2.buttonSelected2=mrYes
  then
    begin
      strngrid.ColCount:=form2.matrix_order.Value;
      strngrid.RowCount:=form2.matrix_order.Value;
    end;
end;

procedure TForm1.strngridMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if not IsEmpty(strngrid) then
    begin
      NSave.Enabled:=True;
      NSave_As.Enabled:=True;
      NProgram.Enabled:=True;
      NProcess.Enabled:=True;
    end
  else
    begin
      NSave.Enabled:=False;
      NSave_As.Enabled:=False;
      NProgram.Enabled:=False;
      NProcess.Enabled:=False;
    end;
end;

procedure TForm1.strngridKeyPress(Sender: TObject; var Key: Char);
begin
  if not IsEmpty(strngrid) then
    begin
      NSave.Enabled:=True;
      NSave_As.Enabled:=True;
      NProgram.Enabled:=True;
      NProcess.Enabled:=True;
    end
  else
    begin
      NSave.Enabled:=False;
      NSave_As.Enabled:=False;
      NProgram.Enabled:=False;
      NProcess.Enabled:=False;
    end;
end;


procedure MainTask(var matr: TStringGrid; var V: TVector);
var
  i, j: Integer;
  buff: Integer;
begin
  with matr do
    begin
      for i:= 0 to RowCount - 1 do
        V[i]:= 0;
      for i:= 0 to ColCount - 1 do
      begin
        for j:= 0 to RowCount - 1 do
        begin
          if not TryStrToInt(Trim(Cells[j,i]), buff) then ShowMessage('Не удалось считать данные') else
            V[i]:= V[i] + buff;
        end;  
        V[i]:= Round(V[i] / ColCount);
      end;
    end;

end;

function VectorToStr (var V: TVector; len: Integer): string;
var
  i: Integer;
begin
  for i:= 0 to len - 1 do
    if (i <> len - 1) then
      Result:= Result + IntToStr(V[i]) + ', '
    else
      Result := Result + IntToStr(V[i]) + '. '
end;


procedure TForm1.NProcessClick(Sender: TObject);
var Res: TVector;
begin
  If not IsFull(strngrid) then
    ShowMessage('Не все ячейки заполнены')
  else
    begin
      MainTask(strngrid, Res);
      ShowMessage('Среднее арифметическое для каждого ряда: ' + VectorToStr(Res, strngrid.ColCount));
    end;
end;

end.
