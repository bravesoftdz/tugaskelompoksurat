object pelepasan: Tpelepasan
  Left = 443
  Top = 193
  Width = 811
  Height = 494
  Caption = 'surat pelepasan'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlpelepasan: TPanel
    Left = 0
    Top = 0
    Width = 361
    Height = 457
    Color = clWhite
    TabOrder = 0
    object lbl1: TLabel
      Left = 32
      Top = 48
      Width = 34
      Height = 13
      Caption = 'Nama :'
    end
    object lbl2: TLabel
      Left = 32
      Top = 80
      Width = 55
      Height = 13
      Caption = 'Pekerjaan :'
    end
    object lbl3: TLabel
      Left = 32
      Top = 112
      Width = 40
      Height = 13
      Caption = 'Alamat :'
    end
    object lbl4: TLabel
      Left = 32
      Top = 16
      Width = 290
      Height = 14
      Caption = 'PERNYATAAN PELEPASAN UNTUK AKSES JALAN '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 24
      Top = 192
      Width = 3
      Height = 13
    end
    object edt1: TEdit
      Left = 112
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edt2: TEdit
      Left = 112
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edt3: TEdit
      Left = 112
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object btn1: TButton
      Left = 48
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Pindai'
      TabOrder = 3
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 144
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Lihat Hasil'
      TabOrder = 4
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 240
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 5
      OnClick = btn3Click
    end
  end
  object pnl2: TPanel
    Left = 360
    Top = 0
    Width = 417
    Height = 457
    Color = clWhite
    TabOrder = 1
    object img1: TImage
      Left = 0
      Top = 136
      Width = 417
      Height = 321
    end
    object dbgrd1: TDBGrid
      Left = 16
      Top = 8
      Width = 385
      Height = 120
      DataSource = DataModule1.dsrio
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dlphtwn1: TDelphiTwain
    OnTwainAcquire = dlphtwn1TwainAcquire
    TransferMode = ttmMemory
    SourceCount = 0
    Info.MajorVersion = 1
    Info.MinorVersion = 0
    Info.Language = tlUserLocale
    Info.CountryCode = 1
    Info.Groups = [tgControl, tgImage]
    Info.VersionInfo = 'Application name'
    Info.Manufacturer = 'Application manufacturer'
    Info.ProductFamily = 'App product family'
    Info.ProductName = 'App product name'
    LibraryLoaded = True
    SourceManagerLoaded = False
    Left = 288
    Top = 296
  end
end
