object FCreate: TFCreate
  Left = 163
  Top = 119
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1090#1077#1089#1090#1072
  ClientHeight = 611
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PEditQuestion: TPanel
    Left = 3
    Top = 121
    Width = 400
    Height = 145
    TabOrder = 0
    object LTitleEdit: TLabel
      Left = 8
      Top = 8
      Width = 202
      Height = 20
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1086#1087#1088#1086#1089#1072': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LMessageQuestion: TLabel
      Left = 214
      Top = 12
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BAdd: TButton
      Left = 8
      Top = 112
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = BAddClick
    end
    object BAppend: TButton
      Left = 264
      Top = 112
      Width = 129
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Enabled = False
      TabOrder = 1
      OnClick = BAppendClick
    end
    object BCancel: TButton
      Left = 184
      Top = 112
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      Enabled = False
      TabOrder = 2
      OnClick = BCancelClick
    end
    object grpTitleQuestion: TGroupBox
      Left = 8
      Top = 27
      Width = 385
      Height = 39
      Caption = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      TabOrder = 3
      object EText: TEdit
        Left = 3
        Top = 14
        Width = 379
        Height = 21
        TabOrder = 0
      end
    end
    object grpTypeQuestion: TGroupBox
      Left = 8
      Top = 66
      Width = 385
      Height = 42
      Caption = #1058#1080#1087' '#1074#1086#1087#1088#1086#1089#1072
      TabOrder = 4
      object CType: TComboBox
        Left = 4
        Top = 17
        Width = 378
        Height = 21
        AutoComplete = False
        TabOrder = 0
        Items.Strings = (
          #1054#1076#1080#1085' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1086#1090#1074#1077#1090
          #1053#1077#1089#1082#1086#1083#1100#1082#1086' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1093' '#1086#1074#1077#1090#1086#1074
          #1056#1072#1079#1083#1086#1078#1080#1090#1100' '#1074' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077)
      end
    end
  end
  object PListQuestions: TPanel
    Left = 411
    Top = 9
    Width = 400
    Height = 592
    TabOrder = 1
    object LTitleList: TLabel
      Left = 8
      Top = 8
      Width = 137
      Height = 20
      Caption = #1057#1087#1080#1089#1086#1082' '#1074#1086#1087#1088#1086#1089#1086#1074': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LMessageListOption: TLabel
      Left = 153
      Top = 12
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BChange: TButton
      Left = 8
      Top = 38
      Width = 97
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
      OnClick = BChangeClick
    end
    object BDelete: TButton
      Left = 316
      Top = 38
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = BDeleteClick
    end
    object LQuestion: TListBox
      Left = 8
      Top = 69
      Width = 385
      Height = 513
      ItemHeight = 13
      TabOrder = 2
    end
    object BChangeOption: TButton
      Left = 114
      Top = 38
      Width = 193
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074#1072#1088#1080#1072#1085#1090#1099' '#1086#1090#1074#1077#1090#1086#1074
      TabOrder = 3
      OnClick = BChangeOptionClick
    end
  end
  object PTest: TPanel
    Left = 5
    Top = 8
    Width = 400
    Height = 105
    TabOrder = 2
    object LTitleTest: TLabel
      Left = 8
      Top = 8
      Width = 144
      Height = 20
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1090#1077#1089#1090#1072': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LMessageTest: TLabel
      Left = 161
      Top = 12
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BSave: TButton
      Left = 8
      Top = 76
      Width = 113
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1089#1090
      TabOrder = 0
      OnClick = BSaveClick
    end
    object grpTest: TGroupBox
      Left = 8
      Top = 31
      Width = 385
      Height = 42
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1089#1090#1072
      TabOrder = 1
      object ETitle: TEdit
        Left = 2
        Top = 16
        Width = 379
        Height = 21
        TabOrder = 0
      end
    end
    object BLoad: TBitBtn
      Left = 140
      Top = 75
      Width = 99
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1090#1077#1089#1090
      TabOrder = 2
      OnClick = BLoadClick
    end
  end
  object POptions: TPanel
    Left = 3
    Top = 272
    Width = 400
    Height = 329
    TabOrder = 3
    object LTitleOption: TLabel
      Left = 8
      Top = 8
      Width = 151
      Height = 20
      Caption = #1042#1072#1088#1080#1072#1085#1090#1099' '#1086#1090#1074#1077#1090#1086#1074': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LMessageOption: TLabel
      Left = 161
      Top = 12
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LPostionOption: TLabel
      Left = 248
      Top = 80
      Width = 87
      Height = 13
      Caption = #1055#1086#1079#1080#1094#1080#1103' '#1086#1090#1074#1077#1090#1072': '
      Visible = False
    end
    object LInfo: TLabel
      Left = 16
      Top = 302
      Width = 270
      Height = 13
      Caption = #1044#1086#1073#1072#1074#1083#1103#1081#1090#1077' '#1074#1072#1088#1080#1072#1085#1090#1099' '#1086#1090#1074#1077#1090#1086#1074' '#1074' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1084' '#1087#1086#1088#1103#1082#1077
    end
    object LListOption: TListBox
      Left = 8
      Top = 176
      Width = 385
      Height = 113
      ItemHeight = 13
      TabOrder = 0
      OnClick = LListOptionClick
    end
    object CCorrect: TCheckBox
      Left = 10
      Top = 78
      Width = 121
      Height = 21
      Caption = #1055#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1086#1090#1074#1077#1090
      Enabled = False
      TabOrder = 1
      OnClick = CCorrectClick
    end
    object CNumberOption: TComboBox
      Left = 342
      Top = 78
      Width = 49
      Height = 21
      Enabled = False
      TabOrder = 2
      Visible = False
      OnChange = CNumberOptionChange
    end
    object BCancelOption: TButton
      Left = 320
      Top = 296
      Width = 75
      Height = 25
      Caption = #1054#1082
      Enabled = False
      TabOrder = 3
      OnClick = BCancelClick
    end
    object GOptionText: TGroupBox
      Left = 8
      Top = 96
      Width = 385
      Height = 73
      Caption = #1058#1077#1082#1089#1090' '#1074#1072#1088#1080#1072#1085#1090#1072' '#1086#1090#1074#1077#1090#1072
      TabOrder = 4
      object EOptionText: TEdit
        Left = 8
        Top = 16
        Width = 369
        Height = 21
        TabOrder = 0
      end
      object BDeleteOption: TButton
        Left = 84
        Top = 42
        Width = 141
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072
        Enabled = False
        TabOrder = 1
        OnClick = BDeleteOptionClick
      end
      object BSaveOption: TButton
        Left = 8
        Top = 42
        Width = 67
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Enabled = False
        TabOrder = 2
        OnClick = BSaveOptionClick
      end
    end
    object GEditOption: TGroupBox
      Left = 8
      Top = 26
      Width = 385
      Height = 49
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1074#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072
      TabOrder = 5
      object EEditOption: TEdit
        Left = 4
        Top = 16
        Width = 304
        Height = 21
        TabOrder = 0
      end
      object BAddOption: TButton
        Left = 313
        Top = 16
        Width = 65
        Height = 21
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        Enabled = False
        TabOrder = 1
        OnClick = BAddOptionClick
      end
    end
  end
  object testDataButton: TButton
    Left = 383
    Top = 12
    Width = 17
    Height = 25
    Caption = 'tf'
    TabOrder = 4
    Visible = False
    OnClick = testDataButtonClick
  end
  object insertTestData: TButton
    Left = 360
    Top = 12
    Width = 17
    Height = 25
    Caption = 'tD'
    TabOrder = 5
    Visible = False
    OnClick = insertTestDataClick
  end
  object STest: TSaveDialog
    Filter = 'XML Documents|*.xml'
    Left = 776
    Top = 17
  end
  object OTest: TOpenDialog
    Left = 739
    Top = 17
  end
  object xmldcmnt1: TXMLDocument
    Left = 704
    Top = 17
    DOMVendorDesc = 'MSXML'
  end
end
