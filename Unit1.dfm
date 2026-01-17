object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Quote Manager'
  ClientHeight = 797
  ClientWidth = 1323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 399
    Top = 680
    Width = 103
    Height = 17
    Caption = 'Historical Prices'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 399
    Top = -3
    Width = 93
    Height = 25
    Caption = 'Current Prices'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = -3
    Width = 54
    Height = 16
    Caption = 'Vendors'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 6
    Top = 272
    Width = 89
    Height = 13
    Caption = 'Product Search:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 397
    Top = 19
    Width = 918
    Height = 658
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnCellClick = DBGrid1CellClick
    OnColEnter = DBGrid1ColEnter
    OnColExit = DBGrid1ColExit
    OnExit = DBGrid1Exit
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Vendor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Date'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Container'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product'
        Width = 200
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delivered'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MinimumOrderQty'
        Title.Caption = 'Minimum Order'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Freight Cost'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Expired'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'KeyID'
        Visible = False
      end>
  end
  object VendorList: TListBox
    Left = 8
    Top = 16
    Width = 185
    Height = 229
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = VendorListClick
  end
  object PopulateVendorListBox: TButton
    Left = 1771
    Top = 414
    Width = 145
    Height = 25
    Caption = 'Populate Vendor List Box'
    TabOrder = 2
    Visible = False
    OnClick = PopulateVendorListBoxClick
  end
  object Button1: TButton
    Left = 1771
    Top = 445
    Width = 145
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 1772
    Top = 476
    Width = 144
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
    Visible = False
    OnClick = Button2Click
  end
  object PopulateHistory: TButton
    Left = 1771
    Top = 516
    Width = 145
    Height = 25
    Caption = 'Populate History'
    TabOrder = 5
    Visible = False
    OnClick = PopulateHistoryClick
  end
  object DBGrid2: TDBGrid
    Left = 399
    Top = 693
    Width = 918
    Height = 101
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Vendor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Container'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delivered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MinimumOrderQty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Minimum Order'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Freight Cost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Expired'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = False
      end>
  end
  object NewItem: TButton
    Left = 199
    Top = 189
    Width = 185
    Height = 25
    Caption = 'New Item'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = NewItemClick
  end
  object EditItem: TButton
    Left = 199
    Top = 220
    Width = 185
    Height = 25
    Caption = 'Edit Item'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = EditItemClick
  end
  object UpdatePrice: TButton
    Left = 199
    Top = 158
    Width = 185
    Height = 25
    Caption = 'Update Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = UpdatePriceClick
  end
  object Button3: TButton
    Left = 1772
    Top = 547
    Width = 107
    Height = 25
    Caption = 'What DB did i load?'
    TabOrder = 10
    Visible = False
    OnClick = Button3Click
  end
  object DBGrid3: TDBGrid
    Left = 8
    Top = 296
    Width = 376
    Height = 205
    DataSource = DataSource3
    ReadOnly = True
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Product'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vendor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 140
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 101
    Top = 269
    Width = 211
    Height = 21
    TabOrder = 12
    OnChange = Edit1Change
  end
  object Button5: TButton
    Left = 318
    Top = 264
    Width = 66
    Height = 26
    Caption = 'Clear'
    TabOrder = 13
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 199
    Top = 19
    Width = 185
    Height = 25
    Caption = 'New Vendor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = Button6Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=PurchaseMgr.db'
      'DriverID=SQLite'
      'JournalMode=WAL'
      'Synchronous=Normal'
      'OpenMode=ReadWrite'
      'ForeignKeys=On'
      'LockingMode=Normal')
    LoginPrompt = False
    Left = 160
    Top = 624
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    VendorLib = 'sqlite3.dll'
    Left = 160
    Top = 672
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 720
  end
  object qVendor: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM Purchases ORDER BY Vendor')
    Left = 64
    Top = 624
    object qVendorVendor: TWideMemoField
      FieldName = 'Vendor'
      Origin = 'Vendor'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qVendorDate: TWideMemoField
      FieldName = 'Date'
      Origin = 'Date'
      Required = True
      OnGetText = qVendorDateGetText
      BlobType = ftWideMemo
    end
    object qVendorProduct: TWideMemoField
      FieldName = 'Product'
      Origin = 'Product'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qVendorQuantity: TFloatField
      FieldName = 'Quantity'
      Origin = 'Quantity'
    end
    object qVendorUnit: TWideMemoField
      FieldName = 'Unit'
      Origin = 'Unit'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qVendorContainer: TWideMemoField
      FieldName = 'Container'
      Origin = 'Container'
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qVendorPrice: TFloatField
      FieldName = 'Price'
      Origin = 'Price'
      Required = True
    end
    object qVendorDelivered: TWideMemoField
      FieldName = 'Delivered'
      Origin = 'Delivered'
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qVendorMinimumOrderQty: TWideMemoField
      FieldName = 'MinimumOrderQty'
      Origin = 'MinimumOrderQty'
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qVendorFreightCost: TFloatField
      FieldName = 'Freight Cost'
      Origin = '"Freight Cost"'
    end
    object qVendorExpired: TWideMemoField
      FieldName = 'Expired'
      Origin = 'Expired'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = qPurchases
    Top = 624
  end
  object qPurchases: TFDQuery
    AfterOpen = qPurchasesAfterOpen
    BeforePost = qPurchasesBeforePost
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM Purchases ORDER BY Vendor')
    Left = 64
    Top = 672
    object qPurchasesVendor: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Vendor'
      Origin = 'Vendor'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchasesDate: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Date'
      Origin = 'Date'
      Required = True
      OnGetText = qVendorDateGetText
      OnSetText = qPurchasesDateSetText
      BlobType = ftWideMemo
    end
    object qPurchasesQuantity: TFloatField
      DisplayWidth = 10
      FieldName = 'Quantity'
      Origin = 'Quantity'
      OnGetText = qVendorVendorGetText
    end
    object qPurchasesUnit: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Unit'
      Origin = 'Unit'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchasesContainer: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Container'
      Origin = 'Container'
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchasesProduct: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Product'
      Origin = 'Product'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchasesPrice: TFloatField
      DisplayWidth = 10
      FieldName = 'Price'
      Origin = 'Price'
      Required = True
    end
    object qPurchasesDelivered: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Delivered'
      Origin = 'Delivered'
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchasesMinimumOrderQty: TWideMemoField
      DisplayWidth = 18
      FieldName = 'MinimumOrderQty'
      Origin = 'MinimumOrderQty'
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchasesFreightCost: TFloatField
      DisplayWidth = 12
      FieldName = 'Freight Cost'
      Origin = '"Freight Cost"'
    end
    object qPurchasesExpired: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Expired'
      Origin = 'Expired'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchasesKeyID: TIntegerField
      FieldName = 'KeyID'
      Origin = 'KeyID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object qPurchaseHistory: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM Purchases ORDER BY Vendor')
    Left = 64
    Top = 720
    object qPurchaseHistoryVendor: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Vendor'
      Origin = 'Vendor'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchaseHistoryDate: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Date'
      Origin = 'Date'
      Required = True
      OnGetText = qVendorDateGetText
      OnSetText = qPurchaseHistoryDateSetText
      BlobType = ftWideMemo
    end
    object qPurchaseHistoryProduct: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Product'
      Origin = 'Product'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchaseHistoryQuantity: TFloatField
      DisplayWidth = 10
      FieldName = 'Quantity'
      Origin = 'Quantity'
    end
    object qPurchaseHistoryUnit: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Unit'
      Origin = 'Unit'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchaseHistoryContainer: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Container'
      Origin = 'Container'
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchaseHistoryPrice: TFloatField
      DisplayWidth = 10
      FieldName = 'Price'
      Origin = 'Price'
      Required = True
    end
    object qPurchaseHistoryDelivered: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Delivered'
      Origin = 'Delivered'
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchaseHistoryMinimumOrderQty: TWideMemoField
      DisplayWidth = 18
      FieldName = 'MinimumOrderQty'
      Origin = 'MinimumOrderQty'
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qPurchaseHistoryFreightCost: TFloatField
      DisplayWidth = 12
      FieldName = 'Freight Cost'
      Origin = '"Freight Cost"'
    end
    object qPurchaseHistoryExpired: TWideMemoField
      DisplayWidth = 10
      FieldName = 'Expired'
      Origin = 'Expired'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
  end
  object DataSource2: TDataSource
    DataSet = qPurchaseHistory
    Top = 672
  end
  object qSearch: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM Purchases ORDER BY Vendor')
    Left = 64
    Top = 768
    object qSearchVendor: TWideMemoField
      FieldName = 'Vendor'
      Origin = 'Vendor'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
    object qSearchProduct: TWideMemoField
      FieldName = 'Product'
      Origin = 'Product'
      Required = True
      OnGetText = qVendorVendorGetText
      BlobType = ftWideMemo
    end
  end
  object DataSource3: TDataSource
    DataSet = qSearch
    Top = 720
  end
end
