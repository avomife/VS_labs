
unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, TaskUnit;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    mmoEdit: TMemo;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    miFile: TMenuItem;
    miNew: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    miSaveAs: TMenuItem;
    miExit: TMenuItem;
    miSaveLines: TMenuItem;

    procedure miNewClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure miSaveClick(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miFileClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure miw5lettClick(Sender: TObject);
    procedure miw4lettClick(Sender: TObject);
    procedure miw3lettClick(Sender: TObject);
    procedure miw2lettClick(Sender: TObject);
    procedure miw1lettClick(Sender: TObject);
    procedure mmoKeyPress(Sender: TObject; var Key: Char);

  private
    function isDataModified: Boolean;
    function isUserConfirmed: Boolean;
    function SaveLines(lines: TStrings): Boolean;
  public
    { Public declarations }
  end;

const
  EngLett=['A'..'Z', 'a'..'z', ' '];

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
var
  openedFileName: string = '';

function TMainForm.SaveLines(lines: TStrings): boolean;
begin
  Result := lines.count > 0;
  if result then
    begin
      if dlgSave.Execute then
        lines.SaveToFile(dlgSave.FileName + '.txt');
    end
  else
    ShowMessage('Nothing to save!');
end;

function TMainForm.isDataModified : Boolean;
var
  fileData : TStrings;
begin
  if openedFileName='' then
    result:= mmoEdit.lines.count > 0
  else
    begin
      fileData := TStringList.Create();
      fileData.LoadFromFile(openedFileName);
      Result := not mmoEdit.lines.Equals(fileData);
    end;
end;

function TMainForm.isUserConfirmed: Boolean;
var
  dlgBtnSelected: Integer;
begin
  result:= not isDataModified;
  if not result then
    begin
      dlgBtnSelected := MessageDlg('Save current data?', mtCustom, mbYesNoCancel, 0);
      if (dlgBtnSelected = mrYes) then
        begin
          if openedFileName = '' then
            begin
              if dlgSave.Execute then
                begin
                  mmoEdit.lines.SaveToFile(dlgSave.FileName + '.txt');
                  result:=true;
                end
            end
          else
            begin
              mmoEdit.lines.SaveToFile(openedFileName + '.txt');
              result:=true;
            end;
        end
      else
        if dlgBtnSelected = mrNo then
            result:=true;
    end;
end;

procedure TMainForm.miNewClick(Sender: TObject);
begin
  if isUserConfirmed then
    begin
      mmoEdit.lines.Clear;
      openedFileName := '';
      miSave.Enabled := False;
    end;
end;

procedure TMainForm.miOpenClick(Sender: TObject);
begin
  if isUserConfirmed and dlgOpen.Execute then
    begin
      openedFileName := dlgOpen.FileName;
      mmoEdit.lines.LoadFromFile(openedFileName);
      miSave.Enabled := True;
    end;
end;

procedure TMainForm.miSaveClick(Sender: TObject);
begin
  if openedFileName <> '' then
    mmoEdit.lines.SaveToFile(openedFileName);
end;

procedure TMainForm.miSaveAsClick(Sender: TObject);
begin
  if saveLines(mmoEdit.lines) then
    begin
      openedFileName := dlgSave.FileName;
      miSave.Enabled:= True;
    end;
end;

procedure TMainForm.miExitClick(Sender: TObject);
begin
  Self.Close();
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := isUserConfirmed;
end;

procedure TMainForm.miw5lettClick(Sender: TObject);
begin
   SaveLines(CountLett(mmoEdit.lines, 5));
end;

procedure TMainForm.miw4lettClick(Sender: TObject);
begin
   SaveLines(CountLett(mmoEdit.lines, 4));
end;

procedure TMainForm.miw3lettClick(Sender: TObject);
begin
   SaveLines(CountLett(mmoEdit.lines, 3));
end;

procedure TMainForm.miw2lettClick(Sender: TObject);
begin
   SaveLines(CountLett(mmoEdit.lines, 2));
end;

procedure TMainForm.miw1lettClick(Sender: TObject);
begin
   SaveLines(CountLett(mmoEdit.lines, 1));
end;

procedure TMainForm.miFileClick(Sender: TObject);
var isModified:Boolean;
begin
  isModified:=isDataModified;
  miSave.Enabled:= isModified and (openedFileName<>'');
  miSaveAs.Enabled:=isModified;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var currentDir:string;
begin
  currentDir := GetCurrentDir;
  dlgOpen.InitialDir := currentDir;
  dlgSave.InitialDir := currentDir;
end;

procedure TMainForm.mmoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in (Englett + [Chr(VK_BACK)]+ [Chr(VK_RETURN)])) then
    Key:=#0;
end;

end.
