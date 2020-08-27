object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 647
  ClientWidth = 1110
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1110
    Height = 243
    Align = alTop
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 1
      Top = 4
      Width = 99
      Height = 16
      Caption = 'alte Protokolle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 0
      Top = 156
      Width = 106
      Height = 16
      Caption = 'neue Protokolle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 1
      Top = 100
      Width = 133
      Height = 16
      Caption = 'Vorschau laden von:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 511
      Top = 0
      Width = 598
      Height = 235
      Caption = 'Suche und Ersetzen'
      Color = clMoneyGreen
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 15
        Width = 67
        Height = 13
        Caption = 'Suche nach:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 296
        Top = 15
        Width = 80
        Height = 13
        Caption = 'Ersetze durch:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MemoSuche: TMemo
        Left = 3
        Top = 34
        Width = 287
        Height = 157
        TabOrder = 0
        OnChange = MemoSucheChange
      end
      object MemoErsetze: TMemo
        Left = 296
        Top = 34
        Width = 286
        Height = 158
        TabOrder = 1
        OnChange = MemoErsetzeChange
      end
      object SucheErsetzeBtn: TButton
        Left = 296
        Top = 198
        Width = 286
        Height = 34
        Caption = 'Suche und Ersetze durch'
        TabOrder = 2
        OnClick = SucheErsetzeBtnClick
      end
      object SucheBtn: TButton
        Left = 3
        Top = 197
        Width = 287
        Height = 35
        Caption = 'Suche nach'
        TabOrder = 3
        OnClick = SucheBtnClick
      end
    end
    object OldProtPath: TEdit
      Left = 1
      Top = 26
      Width = 480
      Height = 21
      Hint = 'OldProtPath'
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      OnChange = OldProtPathChange
    end
    object NewProtPath: TEdit
      Left = 1
      Top = 178
      Width = 481
      Height = 21
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      OnChange = NewProtPathChange
    end
    object LoadBtn: TButton
      Left = 0
      Top = 47
      Width = 508
      Height = 39
      Caption = 'Lade Protokolle'
      TabOrder = 3
      OnClick = LoadBtnClick
    end
    object ComboBox1: TComboBox
      Left = 1
      Top = 122
      Width = 507
      Height = 21
      TabOrder = 4
      Text = '- Bitte Protokol w'#228'hlen -'
      OnSelect = ComboBox1Select
      Items.Strings = (
        '- Bitte Protokol w'#228'hlen -')
    end
    object SaveBtn: TButton
      Left = 1
      Top = 197
      Width = 507
      Height = 38
      Caption = 'Speichere Protokolle'
      TabOrder = 5
      OnClick = SaveBtnClick
    end
    object OldPathButton: TButton
      Left = 480
      Top = 24
      Width = 28
      Height = 25
      Caption = '...'
      TabOrder = 6
      OnClick = OldPathButtonClick
    end
    object NewPathBtn: TButton
      Left = 480
      Top = 174
      Width = 28
      Height = 25
      Caption = '...'
      TabOrder = 7
      OnClick = NewPathBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 243
    Width = 1110
    Height = 404
    Align = alClient
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 521
      Top = 1
      Width = 4
      Height = 402
      Color = clGray
      ParentColor = False
      ExplicitLeft = 511
      ExplicitHeight = 420
    end
    object OldRichEdit1: TRichEdit
      Left = 1
      Top = 1
      Width = 520
      Height = 402
      Align = alLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HideSelection = False
      Lines.Strings = (
        'OldRichEdit1')
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ScrollBars = ssBoth
      ShowHint = True
      TabOrder = 0
      Zoom = 100
    end
    object NewRichEdit2: TRichEdit
      Left = 525
      Top = 1
      Width = 584
      Height = 402
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HideSelection = False
      Lines.Strings = (
        'NewRichEdit2')
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = False
      TabOrder = 1
      Zoom = 100
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 367
    Top = 88
    object AufStandartzurcksetzen1: TMenuItem
      Caption = 'Auf Standart zur'#252'cksetzen'
      OnClick = AufStandartzurcksetzen1Click
    end
  end
end
