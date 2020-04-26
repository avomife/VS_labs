object MainForm: TMainForm
  Left = 649
  Top = 227
  Width = 516
  Height = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    500
    444)
  PixelsPerInch = 96
  TextHeight = 13
  object mmoEdit: TMemo
    Left = 0
    Top = 0
    Width = 570
    Height = 504
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnKeyPress = mmoKeyPress
  end
  object MainMenu: TMainMenu
    Left = 32
    Top = 472
    object miFile: TMenuItem
      Caption = 'File'
      OnClick = miFileClick
      object miNew: TMenuItem
        Caption = 'New'
        OnClick = miNewClick
      end
      object miOpen: TMenuItem
        Caption = 'Open'
        OnClick = miOpenClick
      end
      object miSave: TMenuItem
        Caption = 'Save'
        Enabled = False
        OnClick = miSaveClick
      end
      object miSaveAs: TMenuItem
        Caption = 'Save as'
        OnClick = miSaveAsClick
      end
      object miExit: TMenuItem
        Caption = 'Exit'
        OnClick = miExitClick
      end
    end
    object miSaveLines: TMenuItem
      Caption = 'Save word'#13#10#13#10
      object miw5lett: TMenuItem
        Caption = '5 letters'
        OnClick = miw5lettClick
      end
      object miw4lett: TMenuItem
        Caption = '4 letters'
        OnClick = miw4lettClick
      end
      object miw3lett: TMenuItem
        Caption = '3 letters'
        OnClick = miw3lettClick
      end
      object miw2lett: TMenuItem
        Caption = '2 letters'
        OnClick = miw2lettClick
      end
      object miw1lett: TMenuItem
        Caption = '1 letter'
        OnClick = miw1lettClick
      end
    end
  end
  object dlgOpen: TOpenDialog
    Filter = 'Text files (*.txt)|*.txt'
    InitialDir = 'C:\'
    Left = 88
    Top = 472
  end
  object dlgSave: TSaveDialog
    Filter = 'Text files (*.txt)|*.txt'
    Left = 144
    Top = 472
  end
end
