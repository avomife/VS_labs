object Form1: TForm1
  Left = 422
  Top = 168
  Width = 435
  Height = 290
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object strngrid: TStringGrid
    Left = 0
    Top = 0
    Width = 419
    Height = 231
    Align = alClient
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    Visible = False
    OnKeyPress = strngridKeyPress
  end
  object mm: TMainMenu
    Left = 208
    Top = 48
    object NFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object NNew: TMenuItem
        Caption = #1053#1086#1074#1099#1081
        OnClick = NNewClick
      end
      object NOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
        OnClick = NOpenClick
      end
      object NLine1: TMenuItem
        Caption = '-'
      end
      object NSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = NSaveClick
      end
      object NSave_As: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
        OnClick = NSave_AsClick
      end
      object NLine2: TMenuItem
        Caption = '-'
      end
      object NExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = NExitClick
      end
    end
    object NProgram: TMenuItem
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
      object NProcess: TMenuItem
        Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
        OnClick = NProcessClick
      end
      object NChange_Size: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1072#1079#1084#1077#1088
        OnClick = NChange_SizeClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 152
    Top = 64
  end
  object SaveDialog: TSaveDialog
    Left = 264
    Top = 48
  end
end
