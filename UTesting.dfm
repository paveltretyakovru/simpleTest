object FTesting: TFTesting
  Left = 0
  Top = 0
  Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 420
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TStatusTest: TLabel
    Left = 8
    Top = 8
    Width = 357
    Height = 13
    Caption = #1044#1083#1103' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1079#1072#1075#1088#1091#1079#1080#1090#1077' '#1090#1077#1089#1090' '#1080' '#1079#1072#1087#1086#1083#1085#1080#1090#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1077' '#1087#1086#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object PResult: TPanel
    Left = 8
    Top = 27
    Width = 790
    Height = 385
    TabOrder = 4
    Visible = False
    object LTStudentName: TLabel
      Left = 19
      Top = 37
      Width = 51
      Height = 13
      Caption = #1057#1090#1091#1076#1077#1085#1090': '
    end
    object LTTestTitle: TLabel
      Left = 19
      Top = 18
      Width = 87
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1089#1090#1072': '
    end
    object LTStudentGroup: TLabel
      Left = 19
      Top = 56
      Width = 43
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072': '
    end
    object LTStudentResult: TLabel
      Left = 19
      Top = 75
      Width = 60
      Height = 13
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090': '
    end
    object LTestTitle: TLabel
      Left = 112
      Top = 18
      Width = 56
      Height = 13
      Caption = 'LTestTitle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LStudentName: TLabel
      Left = 76
      Top = 37
      Width = 83
      Height = 13
      Caption = 'LStudentName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LStudentGroup: TLabel
      Left = 68
      Top = 56
      Width = 85
      Height = 13
      Caption = 'LStudentGroup'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LResult: TLabel
      Left = 283
      Top = 164
      Width = 110
      Height = 35
      Caption = 'LResult'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BFinishTest: TButton
      Left = 81
      Top = 326
      Width = 600
      Height = 41
      Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BFinishTestClick
    end
  end
  object GInfoStudent: TGroupBox
    Left = 8
    Top = 27
    Width = 789
    Height = 385
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1076#1083#1103' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103
    TabOrder = 0
    object GSernameStudent: TGroupBox
      Left = 46
      Top = 148
      Width = 696
      Height = 50
      Caption = #1060#1072#1084#1080#1083#1080#1103
      TabOrder = 0
      object TSernameStudent: TEdit
        Left = 3
        Top = 20
        Width = 690
        Height = 21
        TabOrder = 0
      end
    end
    object GNameStudent: TGroupBox
      Left = 46
      Top = 204
      Width = 696
      Height = 50
      Caption = #1048#1084#1103
      TabOrder = 1
      object TNameStudent: TEdit
        Left = 3
        Top = 20
        Width = 690
        Height = 21
        TabOrder = 0
      end
    end
    object GGroupStudent: TGroupBox
      Left = 46
      Top = 263
      Width = 696
      Height = 50
      Caption = #1043#1088#1091#1087#1087#1072
      TabOrder = 2
      object TGroupStudent: TEdit
        Left = 3
        Top = 20
        Width = 690
        Height = 21
        TabOrder = 0
      end
    end
    object grpGotov: TGroupBox
      Left = 43
      Top = 37
      Width = 702
      Height = 90
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1090#1077#1089#1090#1072
      TabOrder = 3
      object LTestStatus: TLabel
        Left = 11
        Top = 55
        Width = 128
        Height = 19
        Caption = #1058#1077#1089#1090' '#1085#1077' '#1079#1072#1075#1088#1091#1078#1077#1085
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object BLoadTest: TButton
        Left = 3
        Top = 24
        Width = 696
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1090#1077#1089#1090
        TabOrder = 0
        OnClick = BLoadTestClick
      end
    end
    object BBeginTest: TButton
      Left = 46
      Top = 319
      Width = 696
      Height = 37
      Caption = #1053#1072#1095#1072#1090#1100' '#1090#1077#1089#1090
      TabOrder = 4
      OnClick = BBeginTestClick
    end
  end
  object PTesting: TPanel
    Left = 6
    Top = 27
    Width = 791
    Height = 385
    TabOrder = 3
    Visible = False
    object TextQuestion: TLabel
      Left = 11
      Top = 27
      Width = 76
      Height = 13
      Caption = 'TextQuestion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LNumQuestShow: TLabel
      Left = 11
      Top = 5
      Width = 51
      Height = 13
      Caption = #1042#1086#1087#1088#1086#1089' '#8470
    end
    object LNumQuestHidden: TLabel
      Left = 114
      Top = 5
      Width = 88
      Height = 13
      Caption = 'LNumQuestHidden'
      Visible = False
    end
    object BCorrectUns: TLabel
      Left = 387
      Top = 5
      Width = 7
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LTCurrentUns: TLabel
      Left = 266
      Top = 5
      Width = 115
      Height = 13
      Caption = #1055#1088#1072#1074#1080#1083#1100#1085#1099#1093' '#1086#1090#1074#1077#1090#1086#1074': '
    end
    object PSecondType: TGroupBox
      Left = 2
      Top = 73
      Width = 789
      Height = 269
      Caption = #1053#1077#1089#1082#1086#1083#1100#1082#1086' '#1086#1090#1074#1077#1090#1086#1074' (Ctrl + '#1050#1083#1080#1082' '#1084#1099#1096#1080' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1080#1103')'
      TabOrder = 4
      Visible = False
      object LQSecondType: TListBox
        Left = 17
        Top = 23
        Width = 680
        Height = 253
        ItemHeight = 13
        Items.Strings = (
          'test'
          'hello'
          'world')
        MultiSelect = True
        TabOrder = 0
      end
    end
    object BNextQuestion: TBitBtn
      Left = 9
      Top = 348
      Width = 130
      Height = 25
      Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1074#1086#1087#1088#1086#1089
      TabOrder = 1
      OnClick = BNextQuestionClick
    end
    object BFinishedTest: TBitBtn
      Left = 155
      Top = 348
      Width = 153
      Height = 25
      Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
      TabOrder = 2
      OnClick = BFinishedTestClick
    end
    object PFirstType: TRadioGroup
      Left = 11
      Top = 56
      Width = 704
      Height = 239
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1086#1090#1074#1077#1090
      Items.Strings = (
        'test'
        'hello'
        'world')
      TabOrder = 0
      Visible = False
    end
    object PThirdType: TGroupBox
      Left = 11
      Top = 85
      Width = 704
      Height = 257
      Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1077' '#1074' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
      TabOrder = 3
      Visible = False
      object CThird1: TComboBox
        Left = 17
        Top = 23
        Width = 671
        Height = 21
        TabOrder = 0
        Items.Strings = (
          #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072'...')
      end
      object CThird2: TComboBox
        Left = 17
        Top = 56
        Width = 671
        Height = 21
        TabOrder = 1
        Items.Strings = (
          #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072'...')
      end
      object CThird3: TComboBox
        Left = 17
        Top = 92
        Width = 671
        Height = 21
        TabOrder = 2
        Items.Strings = (
          #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072'...')
      end
      object CThird4: TComboBox
        Left = 17
        Top = 127
        Width = 671
        Height = 21
        TabOrder = 3
        Items.Strings = (
          #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072'...')
      end
      object CThird5: TComboBox
        Left = 17
        Top = 166
        Width = 671
        Height = 21
        TabOrder = 4
        Items.Strings = (
          #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072'...')
      end
      object CThird6: TComboBox
        Left = 17
        Top = 204
        Width = 671
        Height = 21
        TabOrder = 5
      end
      object CThird7: TComboBox
        Left = 17
        Top = 233
        Width = 671
        Height = 21
        TabOrder = 6
        Visible = False
        Items.Strings = (
          #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1088#1080#1072#1085#1090' '#1086#1090#1074#1077#1090#1072'...')
      end
    end
  end
  object btmp: TBitBtn
    Left = 8
    Top = 387
    Width = 75
    Height = 25
    Caption = 'test'
    TabOrder = 1
    Visible = False
    OnClick = btmpClick
  end
  object btmp1: TBitBtn
    Left = 104
    Top = 387
    Width = 75
    Height = 25
    Caption = 'test 1'
    TabOrder = 2
    Visible = False
    OnClick = btmpClick
  end
  object DOpen: TOpenDialog
    Left = 371
    Top = 372
  end
  object xmldoc: TXMLDocument
    Left = 331
    Top = 372
    DOMVendorDesc = 'MSXML'
  end
end
