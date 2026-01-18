unit Unit1;

interface

uses
  Winapi.Windows, SysUtils, Winapi.Messages, System.Variants, System.Classes, System.StrUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.UITypes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, Vcl.Grids,
  Vcl.DBGrids, DateUtils, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

//type
//  TDBGridHack = class(TDBGrid); // expose protected stuff
  type
  TDBGridHack = class(TDBGrid)
  public
    property ScrollBars;
    property Row;
  end;

  const
  WM_SHOWDTP = WM_USER + 42;

const
  WM_FOCUS_DTP_MONTH = WM_APP + 101;


type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qVendor: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    qVendorVendor: TWideMemoField;
    qVendorDate: TWideMemoField;
    qVendorProduct: TWideMemoField;
    qVendorQuantity: TFloatField;
    qVendorUnit: TWideMemoField;
    qVendorContainer: TWideMemoField;
    qVendorPrice: TFloatField;
    qVendorDelivered: TWideMemoField;
    qVendorMinimumOrderQty: TWideMemoField;
    qVendorFreightCost: TFloatField;
    qVendorExpired: TWideMemoField;
    VendorList: TListBox;
    PopulateVendorListBox: TButton;
    qPurchases: TFDQuery;
    qPurchaseHistory: TFDQuery;
    Button1: TButton;
    qPurchasesVendor: TWideMemoField;
    qPurchasesDate: TWideMemoField;
    qPurchasesProduct: TWideMemoField;
    qPurchasesQuantity: TFloatField;
    qPurchasesUnit: TWideMemoField;
    qPurchasesContainer: TWideMemoField;
    qPurchasesPrice: TFloatField;
    qPurchasesDelivered: TWideMemoField;
    qPurchasesMinimumOrderQty: TWideMemoField;
    qPurchasesFreightCost: TFloatField;
    qPurchasesExpired: TWideMemoField;
    Button2: TButton;
    PopulateHistory: TButton;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    qPurchaseHistoryVendor: TWideMemoField;
    qPurchaseHistoryDate: TWideMemoField;
    qPurchaseHistoryProduct: TWideMemoField;
    qPurchaseHistoryQuantity: TFloatField;
    qPurchaseHistoryUnit: TWideMemoField;
    qPurchaseHistoryContainer: TWideMemoField;
    qPurchaseHistoryPrice: TFloatField;
    qPurchaseHistoryDelivered: TWideMemoField;
    qPurchaseHistoryMinimumOrderQty: TWideMemoField;
    qPurchaseHistoryFreightCost: TFloatField;
    qPurchaseHistoryExpired: TWideMemoField;
    NewItem: TButton;
    EditItem: TButton;
    UpdatePrice: TButton;
    Button3: TButton;
    qPurchasesKeyID: TIntegerField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qSearch: TFDQuery;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    Edit1: TEdit;
    Label4: TLabel;
    qSearchVendor: TWideMemoField;
    qSearchProduct: TWideMemoField;
    Button5: TButton;
    Button6: TButton;
    procedure qVendorVendorGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qVendorDateGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure PopulateVendorListBoxClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure VendorListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopulateHistoryClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid3Enter(Sender: TObject);
    function PromptForPrice(const ACaption, APrompt: string; out AValue: Double): Boolean;
    procedure UpdatePriceClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ShowDBProof;
    procedure RefreshQuery(Q: TFDQuery);
   // interface
    function PromptForPriceAndDate(const ACaption, APrompt: string; var APrice: Double; var ADate: TDateTime): Boolean;
    procedure NewItemClick(Sender: TObject);
    function ItemExists(const AVendor, AProduct, AUnit, AContainer: string; AExcludeID: Integer): Boolean;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditItemClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    function BuildLikePattern(const S: string): string;
    procedure UpdateSearch;
    procedure Edit1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qPurchaseHistoryDateSetText(Sender: TField; const Text: string);
    procedure qPurchasesAfterOpen(DataSet: TDataSet);
    procedure qPurchasesDateSetText(Sender: TField; const Text: string);
    function ParseISODate(const S: string; out D: TDateTime): Boolean;
    function ISOOf(const D: TDateTime): string;
    procedure qPurchasesBeforePost(DataSet: TDataSet);
    procedure DTPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FocusDTPMonth;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);


  private
    { Private declarations }

  DTP: TDateTimePicker;
  FOldDTPWndProc: TWndMethod;
  FDTPSelTimer: TTimer;
  FMonthSelRetries: Integer;

  procedure StartSelectMonth;
  procedure DTPSelectMonthTimer(Sender: TObject);

  procedure DTPChange(Sender: TObject);
  function IsDateCol: Boolean;
  procedure ShowDTPOverCell;
  procedure HideDTP;
  procedure WMShowDTP(var Msg: TMessage); message WM_SHOWDTP;
  procedure DTPWndProc(var Msg: TMessage);

  procedure WMFocusDTPMonth(var Msg: TMessage); message WM_FOCUS_DTP_MONTH;
  //procedure FocusDTPMonth; // optional wrapper if you want




  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  SEARCH_SQL =
    'SELECT DISTINCT Product, Vendor ' +
    'FROM Purchases ' +
    'WHERE (:term = '''' OR Product LIKE :term ESCAPE ''\'') ' +
    'ORDER BY Product, Vendor;';


procedure TForm1.Button1Click(Sender: TObject);
var
  selVendor: string;
begin
  // make sure something is selected
  if (VendorList.ItemIndex < 0) then Exit;

  selVendor := VendorList.Items[VendorList.ItemIndex];

  qPurchases.Close;
  qPurchases.SQL.Text :=
    'SELECT * ' +
    'FROM Purchases ' +
    'WHERE Vendor = :Vendor';

  qPurchases.ParamByName('Vendor').AsString := selVendor;
  qPurchases.Open;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  selVendor: string;
begin
  if VendorList.ItemIndex < 0 then Exit;  // no selection, no party

  selVendor := VendorList.Items[VendorList.ItemIndex];

  qPurchases.Close;
  qPurchases.SQL.Text :=
    'SELECT p.* ' +
    'FROM Purchases p ' +
    'WHERE p.Vendor = :Vendor ' +
    '  AND p."Date" = ( ' +
    '    SELECT MAX(p2."Date") ' +
    '    FROM Purchases p2 ' +
    '    WHERE p2.Vendor = p.Vendor ' +
    '      AND p2.Product = p.Product ' +
    '      AND p2.Quantity = p.Quantity ' +
    '      AND p2.Unit = p.Unit ' +
    '      AND p2.Container = p.Container ' +
    '  ) ' +
    'ORDER BY p.Product, p.Quantity, p.Unit, p.Container';

  qPurchases.ParamByName('Vendor').AsString := selVendor;
  qPurchases.Open;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShowDBProof;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
// Populate Search Grid
 qSearch.Active := False;
 qSearch.SQL.Text := 'SELECT * FROM Purchases ORDER BY Vendor'; //'SELECT * FROM Purchases WHERE 1 = 0';
 qSearch.Active := True;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Edit1.Text := '';
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  NewName, NameField: string;
begin
  NewName := '';
  if not InputQuery('New Vendor', 'Enter the new vendor name:', NewName) then
    Exit;

  NewName := Trim(NewName);
  if NewName = '' then
  begin
    ShowMessage('Vendor name cannot be empty.');
    Exit;
  end;

  // Make sure qVendor is open
  if not qVendor.Active then
    qVendor.Open;

  // Figure out the name field used by qVendor (supports either "Vendor" or "Name")
  if qVendor.FindField('Vendor') <> nil then
    NameField := 'Vendor'
  else if qVendor.FindField('Name') <> nil then
    NameField := 'Name'
  else
  begin
    ShowMessage('qVendor does not have a "Vendor" or "Name" field.');
    Exit;
  end;

  // Prevent duplicates (case-insensitive)
  if qVendor.Locate(NameField, NewName, [loCaseInsensitive]) then
  begin
    ShowMessage('Vendor already exists.');
    Exit;
  end;

  // Append the new vendor
  qVendor.Append;
  try
    qVendor.FieldByName(NameField).AsString := NewName;
    qVendor.FieldByName('Date').AsString := '2025-01-01';
    qVendor.FieldByName('Product').AsString := 'VENDOR';
    qVendor.FieldByName('Unit').AsString := 'lb';
    qVendor.FieldByName('Price').AsFloat := 0;
    qVendor.FieldByName('Expired').AsString := 'True';
    qVendor.Post;
  except
    qVendor.Cancel;
    raise;
  end;

  // Reflect in the listbox, if you�re showing vendors there
  if Assigned(VendorList) then
  begin
    if VendorList.Items.IndexOf(NewName) < 0 then
      VendorList.Items.Add(NewName);
    VendorList.ItemIndex := VendorList.Items.IndexOf(NewName);

    // trigger any selection logic
    if Assigned(VendorList.OnClick) then
      VendorList.OnClick(VendorList);

  end;

  ShowMessage('Vendor "' + NewName + '" added.');
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin

if (not DBGrid1.DataSource.DataSet.Active) or DBGrid1.DataSource.DataSet.IsEmpty then
  Exit
else
  PopulateHistoryClick(Column);//Populate the History Grid with Historical Prices
 ShowDTPOverCell; // Show Date Picker over Date Cell
end;

procedure TForm1.DBGrid3CellClick(Column: TColumn);
var
  SearchVendor, SearchProduct: string;
  VendorIndex: Integer;
begin
  // Make sure qSearch has data
  if (not qSearch.Active) or qSearch.IsEmpty then
    Exit;

  // Get the Vendor and Product from the current row in DBGrid3/qSearch
  SearchVendor := qSearch.FieldByName('Vendor').AsString;
  SearchProduct := qSearch.FieldByName('Product').AsString;

  // Find and select the vendor in VendorList
  VendorIndex := VendorList.Items.IndexOf(SearchVendor);
  if VendorIndex >= 0 then
  begin
    // Set the vendor selection
    VendorList.ItemIndex := VendorIndex;

    // Call Button2Click directly to reload purchases for this vendor
    Button2Click(VendorList);

    // Handle history grid like VendorListClick does
    if qPurchases.IsEmpty then
    begin
      qPurchaseHistory.Close;
      qPurchaseHistory.SQL.Text := 'SELECT * FROM Purchases WHERE 1 = 0;';
      qPurchaseHistory.Open;
      DBGrid2.Refresh;
    end
    else
    begin
      // Locate the product in DBGrid1/qPurchases and populate history
      if qPurchases.Active and (not qPurchases.IsEmpty) then
      begin
        qPurchases.First; // Start from beginning
        if qPurchases.Locate('Product', SearchProduct, []) then
        begin
          // Successfully located - populate history for this product
          PopulateHistoryClick(Column);
          // Don't call SetFocus - let user stay in DBGrid3 to select other items
        end;
      end;
    end;
  end
  else
  begin
    ShowMessage('Vendor "' + SearchVendor + '" not found in vendor list.');
  end;
end;

procedure TForm1.DBGrid3Enter(Sender: TObject);
begin
  // When entering DBGrid3, automatically sync the currently selected row
  // This handles the case where the first item is already selected
  if (qSearch.Active) and (not qSearch.IsEmpty) then
    DBGrid3CellClick(nil);
end;

procedure TForm1.DBGrid1ColEnter(Sender: TObject);
begin

if IsDateCol then
    PostMessage(Handle, WM_SHOWDTP, 0, 0)
  else
    HideDTP;

ShowDTPOverCell;
end;

procedure TForm1.DBGrid1ColExit(Sender: TObject);
begin
 HideDTP;
end;

procedure TForm1.DBGrid1Exit(Sender: TObject);
begin
HideDTP;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Highlight all cells in the selected row with light yellow
  if (gdSelected in State) or (gdFocused in State) then
  begin
    // Set background to light yellow
    DBGrid1.Canvas.Brush.Color := $00E0FFFF;  // Light yellow (BGR format)
    DBGrid1.Canvas.Font.Color := clBlack;

    // Remove the default selection state to prevent default blue highlighting
    State := State - [gdSelected];
  end;

  // Draw the cell text with our custom colors
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  v, p, u, c: string;
  curID: Integer;
begin
  if (Key = VK_RETURN) and (qPurchases.State in [dsInsert, dsEdit]) then
  begin
    // gather current values from the row being edited
    v := qPurchases.FieldByName('Vendor').AsString;
    p := qPurchases.FieldByName('Product').AsString;
    u := qPurchases.FieldByName('Unit').AsString;
    c := qPurchases.FieldByName('Container').AsString;

    if not qPurchases.FieldByName('KeyID').IsNull then
      curID := qPurchases.FieldByName('KeyID').AsInteger
    else
      curID := 0;

    // validate requireds (optional but nice)
    if (Trim(v) = '') or (Trim(p) = '') or (Trim(u) = '') or (Trim(c) = '') then
    begin
      ShowMessage('Vendor, Product, Unit, and Container are all required.');
      Key := 0;   // swallow Enter
      Exit;
    end;

    // uniqueness check
    if ItemExists(v, p, u, c, curID) then
    begin
      ShowMessage('Item already exists');
      Key := 0;   // swallow Enter (don�t post)
      Abort;      // stay in edit on current row
    end;

    // looks good � commit the edit
    qPurchases.Post;
    Key := 0;     // prevent the grid from also moving to next row
  end;
end;

procedure TForm1.EditItemClick(Sender: TObject);
var
  v, p, u, c: string;
  curID: Integer;
begin
  // must have a current row
  if (not qPurchases.Active) or qPurchases.IsEmpty then
  begin
    ShowMessage('No item selected.');
    Exit;
  end;

  // finalize any pending edits elsewhere
  qPurchases.CheckBrowseMode;

  // pull current values
  v := Trim(qPurchases.FieldByName('Vendor').AsString);
  p := Trim(qPurchases.FieldByName('Product').AsString);
  u := Trim(qPurchases.FieldByName('Unit').AsString);
  c := Trim(qPurchases.FieldByName('Container').AsString);

  if not qPurchases.FieldByName('KeyID').IsNull then
    curID := qPurchases.FieldByName('KeyID').AsInteger
  else
    curID := 0;

  // If ANY other row has the same (Vendor,Product,Unit,Container), don't allow editing
  if ItemExists(v, p, u, c, curID) then
  begin
    ShowMessage('Can''t edit items with historical pricing - create a New Item');
    Exit;
  end;

  // safe to edit this row
  qPurchases.Edit;

  // optional: put editor into a specific column (e.g., Product)
  if qPurchases.FindField('Product') <> nil then
    DBGrid1.SelectedField := qPurchases.FieldByName('Product');
  DBGrid1.SetFocus;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
// Hide DBGrid's Horizontal Scroll Bars
TDBGridHack(DBGrid1).ScrollBars := ssVertical; // no horizontal bar
TDBGridHack(DBGrid2).ScrollBars := ssVertical; // no horizontal bar
TDBGridHack(DBGrid3).ScrollBars := ssVertical; // no horizontal bar

//Set up FDConnection
FDConnection1.Connected := False;
FDConnection1.Params.Clear;
FDConnection1.DriverName := 'SQLite';
FDConnection1.Params.Values['Database']    := ExtractFilePath(ParamStr(0)) + 'PurchaseMgr.db'; //C:\Purchase Manager\PurchaseMgr.db
FDConnection1.Params.Values['LockingMode'] := 'Normal';   // not Exclusive
FDConnection1.Params.Values['BusyTimeout'] := '60000';    // wait up to 60s

// Create Timer thats sets Date Picker to select MM
FDTPSelTimer := TTimer.Create(Self);
FDTPSelTimer.Enabled  := False;
FDTPSelTimer.Interval := 120;          // small defer; 20�50ms works well
FDTPSelTimer.OnTimer  := DTPSelectMonthTimer;

// Choose either WAL (better concurrency) or DELETE (simpler). Try WAL first:
FDConnection1.Params.Values['JournalMode'] := 'WAL';
FDConnection1.Params.Values['Synchronous'] := 'NORMAL';

// If the DB still won�t open, temporarily force DELETE to clear things:
//FDConnection1.Params.Values['JournalMode'] := 'DELETE';

FDConnection1.LoginPrompt := False;
FDConnection1.Connected := True;
qVendor.Active := true;
qPurchases.Active := true;
qPurchaseHistory.Active := true;

PopulateVendorListBoxClick(Sender);
if VendorList.Count > 0 then
  VendorList.ItemIndex := 0;
VendorListClick(sender); //Populate Price List

//Populate the History Grid with Historical Prices
if (not DBGrid1.DataSource.DataSet.Active) or DBGrid1.DataSource.DataSet.IsEmpty then
  Exit
else
  PopulateHistoryClick(sender);//Populate the History Grid with Historical Prices

// Create up Date Picker to embed in DB Grid
  DTP := TDateTimePicker.Create(Self);
  DTP.Parent := DBGrid1;   // overlay in grid
  DTP.Visible := False;
  DTP.Kind := dtkDate;
  //DTP.DateMode := dmUpDown; // New !!!  May have to remove
  DTP.Format := 'MM/dd/yyyy';
  DTP.OnChange := DTPChange;  // <- method, not anonymous proc
  //DTP.OnKeyDown := DTPKeyDown;  //Tab to Quantity Field on Tab Press
  FOldDTPWndProc := DTP.WindowProc;        //  save old proc
  DTP.WindowProc := DTPWndProc;            //  hook it

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = Ord('N')) and (ssCtrl in Shift) then
  begin
    Key := 0;                   // eat it
    //FocusDTPMonth;  // Reset focus to Month
    if DTP.Visible then HideDTP;
    NewItem.Click;           // <-- replace with your button name, or call your NewItem handler
  end;
end;

procedure TForm1.NewItemClick(Sender: TObject);
var
  vend: string;
begin
  if VendorList.ItemIndex < 0 then
  begin
    ShowMessage('Please select a vendor first.');
    Exit;
  end;

  //FocusDTPMonth;   // << month gets selected
  //Winapi.Windows.PostMessage(Handle, WM_FOCUS_DTP_MONTH, 0, 0); // defer 1 tick so the EDIT exists
  vend := VendorList.Items[VendorList.ItemIndex];

  qPurchases.Append;
  qPurchases.FieldByName('Vendor').AsString := vend;
  qPurchases.FieldByName('Date').AsString   := FormatDateTime('yyyy-mm-dd', Date);
  qPurchases.FieldByName('Expired').AsString := 'False';

  // put the user into Product field to type
  if qPurchases.FindField('Quantity') <> nil then
    DBGrid1.SelectedField := qPurchases.FieldByName('Quantity');
  DBGrid1.SetFocus;
  DBGrid1.SelectedField := qPurchases.FieldByName('Date');

end;

procedure TForm1.PopulateHistoryClick(Sender: TObject);
var
  V, P, U, C: string;
  Q: Double;
begin
  if qPurchases.IsEmpty then
     begin
     qPurchaseHistory.Close;
     qPurchaseHistory.SQL.Text := 'SELECT * FROM Purchases WHERE 1 = 0;';
     qPurchaseHistory.Open;
     DBGrid2.Refresh;
     end;
  
  if (not qPurchases.Active) or qPurchases.IsEmpty then Exit;

  V := qPurchases.FieldByName('Vendor').AsString;
  P := qPurchases.FieldByName('Product').AsString;
  U := qPurchases.FieldByName('Unit').AsString;
  C := qPurchases.FieldByName('Container').AsString;
  Q := qPurchases.FieldByName('Quantity').AsFloat;

  qPurchaseHistory.Close;
  qPurchaseHistory.SQL.Text :=
    'SELECT p.* ' +
    'FROM Purchases p ' +
    'WHERE p.Vendor = :Vendor ' +
    '  AND p.Product = :Product ' +
    '  AND p.Quantity = :Quantity ' +
    '  AND p.Unit = :Unit ' +
    '  AND p.Container = :Container ' +
    '  AND p."Date" < ( ' +
    '        SELECT MAX(p2."Date") ' +
    '        FROM Purchases p2 ' +
    '        WHERE p2.Vendor = p.Vendor ' +
    '          AND p2.Product = p.Product ' +
    '          AND p2.Quantity = p.Quantity ' +
    '          AND p2.Unit = p.Unit ' +
    '          AND p2.Container = p.Container ' +
    '      ) ' +
    'ORDER BY p."Date" DESC';

  qPurchaseHistory.ParamByName('Vendor').AsString   := V;
  qPurchaseHistory.ParamByName('Product').AsString  := P;
  qPurchaseHistory.ParamByName('Quantity').AsFloat  := Q;
  qPurchaseHistory.ParamByName('Unit').AsString     := U;
  qPurchaseHistory.ParamByName('Container').AsString:= C;

  qPurchaseHistory.Open;

  if qPurchases.IsEmpty then
     begin
     qPurchaseHistory.Close;
     qPurchaseHistory.SQL.Text := 'SELECT * FROM Purchases WHERE 1 = 0;';
     qPurchaseHistory.Open;
     DBGrid2.Refresh;
     end;

end;

procedure TForm1.PopulateVendorListBoxClick(Sender: TObject);
begin
  VendorList.Items.BeginUpdate;
  try
    qVendor.First;
    while not qVendor.Eof do
    begin
      if VendorList.Items.IndexOf(qVendor.FieldByName('Vendor').AsString) = -1 then
        VendorList.Items.Add(qVendor.FieldByName('Vendor').AsString);

      qVendor.Next;
    end;
  finally
    VendorList.Items.EndUpdate;
  end;

end;

procedure TForm1.qPurchaseHistoryDateSetText(Sender: TField;
  const Text: string);
var
  v: TDateTime;
begin
  if not TryStrToDate(Text, v) then
    raise Exception.Create('Please enter a valid date.');
  // store as strict ISO in the DB
  Sender.AsString := FormatDateTime('yyyy-mm-dd', v);
end;

procedure TForm1.qPurchasesAfterOpen(DataSet: TDataSet);
var
  F: TField;
begin
  F := DataSet.FieldByName('Date');         // your field is TEXT
  F.OnGetText := qVendorDateGetText;
  F.OnSetText := qPurchasesDateSetText;

  // Make sure Date Picker appears
    F := DataSet.FindField('Date');
  if Assigned(F) then
  begin
    F.OnGetText := qVendorDateGetText; // keep your -1 day display hack inside
    F.OnSetText := qPurchasesDateSetText; // keep whatever you�ve got there
  end;
end;


procedure TForm1.qPurchasesBeforePost(DataSet: TDataSet);
begin
if qPurchases.FieldByName('Quantity').IsNull or (Trim(qPurchases.FieldByName('Quantity').AsString) = '') then qPurchases.FieldByName('Quantity').AsInteger := -1;

end;

procedure TForm1.qPurchasesDateSetText(Sender: TField; const Text: string);
var
  d: TDateTime;
  s: string;
begin
  s := Trim(Text);
  if s = '' then
  begin
    Sender.Clear;
    Exit;
  end;

  // If already ISO, keep exactly (no re-parse, no TZ, no locale)
  if ParseISODate(s, d) and (s[5] = '-') then
  begin
    Sender.AsString := ISOOf(d);
    Exit;
  end;

  // Accept user-typed MM/DD/YYYY (or similar), but parse manually to avoid locale shifts
  if (Pos('/', s) > 0) and (Length(s) >= 10) then
  begin
    // very simple manual parse for mm/dd/yyyy
    var mm, dd, yy: Integer;
    if TryStrToInt(Copy(s, 1, 2), mm) and
       TryStrToInt(Copy(s, 4, 2), dd) and
       TryStrToInt(Copy(s, 7, 4), yy) and
       TryEncodeDate(yy, mm, dd, d) then
    begin
      Sender.AsString := ISOOf(d);
      Exit;
    end;
  end;

  // Last chance: tolerate ISO-like with spaces, but still parse strictly
  if ParseISODate(s, d) then
  begin
    Sender.AsString := ISOOf(d);
    Exit;
  end;

  raise Exception.CreateFmt('Invalid date: %s', [s]);
end;


procedure TForm1.qVendorDateGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
var
  dt: TDateTime;
  raw: string;
begin
{//Old version - Saved
  raw := Sender.AsString;
  if DisplayText and TryISO8601ToDate(raw, dt, False) then
    Text := FormatDateTime('mm/dd/yyyy', dt)
  else
    Text := raw; }

  raw := Sender.AsString;

  if DisplayText and TryISO8601ToDate(raw, dt, False) then
  begin
    dt := IncDay(DateOf(dt), -1);                 // <� HACK: force -1 day for display
    Text := FormatDateTime('mm/dd/yyyy', dt);
  end
  else
    Text := raw;
end;



procedure TForm1.qVendorVendorGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
if (Sender.FieldName = 'Quantity') and (Sender.AsInteger = -1) then Text := ''
   else
     Text := Copy(Sender.AsString, 1, 120); // show first 120 chars
end;

procedure TForm1.UpdatePriceClick(Sender: TObject);
var
  NewPrice: Double;
  f: TField;
  i, NewID: Integer;
  names : TArray<string>;
  values: TArray<Variant>;
  bm: TBookmark;
  NewDate: TDateTime;
begin
  //if not PromptForPrice('New Price', 'Enter new price:', NewPrice) then
   // Exit;

  // Ask User for New Price and Date Quoted - Date defauts to Today
  NewPrice := 0;
  NewDate := Date;
  if not PromptForPriceAndDate('Update Price',
        'Enter new price and choose date:', NewPrice, NewDate) then
    Exit;

  // make sure pending edits are posted
  QPurchases.CheckBrowseMode;
  if QPurchases.IsEmpty then Exit;

  // remember current row so we can return to it if you like
  bm := QPurchases.GetBookmark;
  try
    // --- snapshot current row BEFORE any refresh/reopen ---
    SetLength(names, QPurchases.Fields.Count);
    SetLength(values, QPurchases.Fields.Count);
    for i := 0 to QPurchases.Fields.Count - 1 do
    begin
      names[i]  := QPurchases.Fields[i].FieldName;
      values[i] := QPurchases.Fields[i].Value;
    end;

    // --- write new row (duplicate + new price/date) ---
    FDConnection1.StartTransaction;
    try
      QPurchases.Append;
      try
        for i := 0 to High(names) do
        begin
          f := QPurchases.FieldByName(names[i]);
          if f.Calculated or f.Lookup or f.ReadOnly then Continue;
          if SameText(f.FieldName, 'KeyID') then Continue;   // autoinc
          if SameText(f.FieldName, 'Price') then Continue;   // we�ll override
          if SameText(f.FieldName, 'Date') then Continue;    // we�ll override
          f.Value := values[i];
        end;

        QPurchases.FieldByName('Price').AsFloat := NewPrice;
        QPurchases.FieldByName('Date').AsString := FormatDateTime('yyyy-mm-dd', NewDate);
        QPurchases.Post;
      except
        QPurchases.Cancel;
        raise;
      end;
      NewID := QPurchases.FieldByName('KeyID').AsInteger;

      FDConnection1.Commit;
    except
      FDConnection1.Rollback;
      raise;
    end;

    // --- now refresh the views (AFTER posting) ---
    QPurchases.DisableControls;
    qPurchaseHistory.DisableControls;
    try
      QPurchases.Close;           // or Requery
      QPurchases.Open;
      qPurchaseHistory.Close;
      qPurchaseHistory.Open;
    finally
      qPurchaseHistory.EnableControls;
      QPurchases.EnableControls;
    end;

    // go back near where you were
    if QPurchases.BookmarkValid(bm) then
      QPurchases.GotoBookmark(bm);

  finally
    QPurchases.FreeBookmark(bm);
  end;
  QPurchases.Locate('KeyID', NewID, []);
end;


procedure TForm1.VendorListClick(Sender: TObject);
begin
if (VendorList.ItemIndex < 0) then Exit;
Button2Click(Sender);

//Clear Historical Prices if qPurchases has an empty dataset
if qPurchases.IsEmpty then
     begin
     qPurchaseHistory.Close;
     qPurchaseHistory.SQL.Text := 'SELECT * FROM Purchases WHERE 1 = 0;';
     qPurchaseHistory.Open;
     DBGrid2.Refresh;
     end;

//Populate the History Grid with Historical Prices
if (not DBGrid1.DataSource.DataSet.Active) or DBGrid1.DataSource.DataSet.IsEmpty then
  Exit
else
  PopulateHistoryClick(sender);//Populate the History Grid with Historical Prices

end;

function TForm1.PromptForPrice(const ACaption, APrompt: string; out AValue: Double): Boolean;
var
  Form: TForm;
  Lbl: TLabel;
  Edt: TEdit;
  BtnOK, BtnCancel: TButton;
  Price: Double;
begin
  Result := False;
  Form := TForm.Create(nil);
  try
    Form.Caption := ACaption;
    Form.BorderStyle := bsDialog;
    Form.Position := poScreenCenter;
    Form.ClientWidth := 280;
    Form.ClientHeight := 120;

    // Prompt label
    Lbl := TLabel.Create(Form);
    Lbl.Parent := Form;
    Lbl.Left := 10;
    Lbl.Top := 12;
    Lbl.Caption := APrompt;

    // Input box
    Edt := TEdit.Create(Form);
    Edt.Parent := Form;
    Edt.Left := 10;
    Edt.Top := 32;
    Edt.Width := 260;

    // OK button
    BtnOK := TButton.Create(Form);
    BtnOK.Parent := Form;
    BtnOK.Caption := 'OK';
    BtnOK.ModalResult := mrOk;
    BtnOK.Left := 110;
    BtnOK.Top := 70;
    BtnOK.Default := True;

    // Cancel button
    BtnCancel := TButton.Create(Form);
    BtnCancel.Parent := Form;
    BtnCancel.Caption := 'Cancel';
    BtnCancel.ModalResult := mrCancel;
    BtnCancel.Left := 190;
    BtnCancel.Top := 70;
    BtnCancel.Cancel := True;

    if Form.ShowModal = mrOk then
    begin
      if TryStrToFloat(Edt.Text, Price) then
      begin
        AValue := Price;
        Result := True;
      end
      else
        MessageDlg('Please enter a valid number (decimals allowed).', mtError, [mbOK], 0);
    end;
  finally
    Form.Free;
  end;
end;


function TForm1.PromptForPriceAndDate(const ACaption, APrompt: string;
  var APrice: Double; var ADate: TDateTime): Boolean;
var
  dlg: TForm;
  lbl: TLabel;
  edt: TEdit;
  dtp: TDateTimePicker;
  btnOK, btnCancel: TButton;
  v: Double;
begin
  Result := False;

  dlg := TForm.Create(nil);
  try
    dlg.Caption := ACaption;
    dlg.Position := poScreenCenter;
    dlg.BorderStyle := bsDialog;
    dlg.ClientWidth := 450;
    dlg.ClientHeight := 250;

    lbl := TLabel.Create(dlg);
    lbl.Parent := dlg;
    lbl.Caption := APrompt;
    lbl.Left := 24;
    lbl.Top := 24;

    edt := TEdit.Create(dlg);
    edt.Parent := dlg;
    edt.Left := 24;
    edt.Top := lbl.Top + lbl.Height + 8;
    edt.Width := 200;
    edt.Text := FormatFloat('0.0000', APrice);

    dtp := TDateTimePicker.Create(dlg);
    dtp.Parent := dlg;
    dtp.Left := 24;
    dtp.Top := edt.Top + edt.Height + 16;
    dtp.Width := 200;
    dtp.Kind := dtkDate;
    dtp.Format := 'yyyy-MM-dd';
    if ADate > 0 then dtp.Date := ADate else dtp.Date := Date;

    btnOK := TButton.Create(dlg);
    btnOK.Parent := dlg;
    btnOK.Caption := 'OK';
    btnOK.ModalResult := mrOk;
    btnOK.Left := 100;
    btnOK.Top := dtp.Top + dtp.Height + 24;
    btnOK.Width := 100;

    btnCancel := TButton.Create(dlg);
    btnCancel.Parent := dlg;
    btnCancel.Caption := 'Cancel';
    btnCancel.ModalResult := mrCancel;
    btnCancel.Left := btnOK.Left + btnOK.Width + 20;
    btnCancel.Top := btnOK.Top;
    btnCancel.Width := 100;

    dlg.ActiveControl := edt;

    if dlg.ShowModal = mrOk then
    begin
      if not TryStrToFloat(edt.Text, v) then Exit;
      APrice := v;
      ADate := dtp.Date;
      Result := True;
    end;
  finally
    dlg.Free;
  end;
end;


procedure TForm1.ShowDBProof;
var
  Q: TFDQuery;
  S: string;
begin
  Q := TFDQuery.Create(Self);
  try
    Q.Connection := FDConnection1;

    // exact file bound to 'main'
    Q.SQL.Text := 'PRAGMA database_list;';
    Q.Open;
    while not Q.Eof do
    begin
      // seq | name | file
      S := Format('DB[%s] -> %s', [Q.Fields[1].AsString, Q.Fields[2].AsString]);
      ShowMessage(S); // or log to your memo
      Q.Next;
    end;
    Q.Close;

    // what objects are in THIS file?
    Q.SQL.Text := 'SELECT type, name FROM sqlite_master ' +
                  'WHERE type IN (''table'',''view'') ORDER BY type, name;';
    Q.Open;
    S := 'Objects in sqlite_master:'#13#10;
    while not Q.Eof do
    begin
      S := S + Format('  %s: %s'#13#10,
        [Q.FieldByName('type').AsString, Q.FieldByName('name').AsString]);
      Q.Next;
    end;
    ShowMessage(S);
    Q.Close;

    // is "Purchases" present?
    Q.SQL.Text := 'SELECT name FROM sqlite_master WHERE name=''Purchases'' AND type IN (''table'',''view'');';
    Q.Open;
    if Q.IsEmpty then
      ShowMessage('Purchases: NOT FOUND in this file')
    else
      ShowMessage('Purchases: FOUND here');
    Q.Close;

  finally
    Q.Free;
  end;
end;

  procedure TForm1.RefreshQuery(Q: TFDQuery);
begin
  Q.DisableControls;
  try
    FDConnection1.Commit;
    Q.Close;
    Q.Open;
  finally
    Q.EnableControls;
  end;

  // Usage:
  //RefreshQuery(qPurchases);
end;

function TForm1.ItemExists(const AVendor, AProduct, AUnit, AContainer: string; AExcludeID: Integer): Boolean;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FDConnection1;
    if AExcludeID > 0 then
      Q.SQL.Text :=
        'SELECT 1 FROM Purchases ' +
        'WHERE Vendor=:v AND Product=:p AND Unit=:u AND Container=:c AND KeyID<>:id ' +
        'LIMIT 1'
    else
      Q.SQL.Text :=
        'SELECT 1 FROM Purchases ' +
        'WHERE Vendor=:v AND Product=:p AND Unit=:u AND Container=:c ' +
        'LIMIT 1';

    Q.ParamByName('v').AsString  := Trim(AVendor);
    Q.ParamByName('p').AsString  := Trim(AProduct);
    Q.ParamByName('u').AsString  := Trim(AUnit);
    Q.ParamByName('c').AsString  := Trim(AContainer);
    if AExcludeID > 0 then
      Q.ParamByName('id').AsInteger := AExcludeID;

    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

function TForm1.BuildLikePattern(const S: string): string;
var t: string;
begin
  // escape backslash first, then % and _
  t := StringReplace(S, '\', '\\', [rfReplaceAll]);
  t := StringReplace(t, '%', '\%', [rfReplaceAll]);
  t := StringReplace(t, '_', '\_', [rfReplaceAll]);
  Result := '%' + t + '%';
end;

procedure TForm1.UpdateSearch;
var term: string;
begin
  term := Trim(Edit1.Text);

  qSearch.DisableControls;
  try
    qSearch.Close;
    qSearch.SQL.Text := SEARCH_SQL;
    if term = '' then
      qSearch.ParamByName('term').AsString := ''           // show all or choose to show none
    else
      qSearch.ParamByName('term').AsString := BuildLikePattern(term);
      if term = '' then qSearch.ParamByName('term').AsString := BuildLikePattern('#nevermatch#');

    qSearch.Open;
  finally
    qSearch.EnableControls;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  UpdateSearch;  // live update as you type
end;

function TForm1.IsDateCol: Boolean;
begin
  Result := Assigned(DBGrid1.SelectedField)
        and SameText(DBGrid1.SelectedField.FieldName, 'Date');
end;

procedure TForm1.ShowDTPOverCell;
var
  R: TRect;
  S: string;
  V: TDateTime;

  G: TDBGridHack;
begin
  G := TDBGridHack(DBGrid1);
  R := G.CellRect(G.Col, G.Row);

  if IsRectEmpty(R) or (G.Row = 0) then
  begin
    DBGrid1.Update;                // let it paint/measure
    R := G.CellRect(G.Col, G.Row); // retry once
    if IsRectEmpty(R) then
      Exit;                        // still no? bail gracefully
  end;



  if not IsDateCol then
  begin
    HideDTP;
    Exit;
  end;

  // position over current cell (you already have this)
  R := TDBGridHack(DBGrid1).CellRect(TDBGridHack(DBGrid1).Col, TDBGridHack(DBGrid1).Row);
  DTP.SetBounds(R.Left, R.Top, R.Width, R.Height);

   S := qPurchases.FieldByName('Date').AsString;
  if TryISO8601ToDate(S, V, False) then
    V := IncDay(DateOf(V), -1)                    // <� HACK: force -1 day for the picker
  else
    V := Date;

  DTP.Date := V;


  DTP.Visible := True;
  DTP.BringToFront;
  DTP.SetFocus;
  //StartSelectMonth;     // <- defer select of month
  // Delete the following paragraph if it doesn't work
 { var hEdit: HWND;
   hEdit := Winapi.Windows.FindWindowEx(DTP.Handle, 0, 'Edit', nil);
   if hEdit <> 0 then
   begin
     Winapi.Windows.SetFocus(hEdit);
     Winapi.Windows.SendMessage(hEdit, EM_SETSEL, WPARAM(0), LPARAM(2)); // select "MM"
   end;    }


  //FocusDTPMonth;   // << month gets selected
  //Winapi.Windows.PostMessage(Handle, WM_FOCUS_DTP_MONTH, 0, 0); // defer 1 tick so the EDIT exists
end;

procedure TForm1.HideDTP;
begin
  DTP.Visible := False;
end;

procedure TForm1.DTPChange(Sender: TObject);
var
  F: TField;
  SaveHandler: TFieldSetTextEvent;
  d:  TDateTime;
begin
  if not IsDateCol then Exit;
  if qPurchases.State = dsBrowse then
    qPurchases.Edit;

  F := qPurchases.FieldByName('Date');

  SaveHandler := F.OnSetText;
  F.OnSetText := nil;              // nothing �helpful� touches the value
  try
    // take the picker's date and add TWO days (quick & dirty offset)
    d := IncDay(DateOf(DTP.Date), +2);
    //F.AsString := ISOOf(DTP.Date); // exact yyyy-mm-dd, pure date
    F.AsString := ISOOf(d); // exact yyyy-mm-dd, pure date
  finally
    F.OnSetText := SaveHandler;
  end;
end;

function TForm1.ParseISODate(const S: string; out D: TDateTime): Boolean;
var
  Y, M, Day: Integer;
begin
  Result := False;
  if (Length(S) = 10) and (S[5] = '-') and (S[8] = '-') and
     TryStrToInt(Copy(S,1,4), Y) and TryStrToInt(Copy(S,6,2), M) and TryStrToInt(Copy(S,9,2), Day) and
     TryEncodeDate(Y, M, Day, D) then
  begin
    D := Trunc(D); // pure date
    Result := True;
  end;
end;

function TForm1.ISOOf(const D: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-mm-dd', Trunc(D)); // pure date, no time
end;

procedure TForm1.WMShowDTP(var Msg: TMessage); //message WM_SHOWDTP;
begin
  ShowDTPOverCell;
end;

procedure TForm1.DTPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_TAB:
      begin
        // Save the picked date (your handler already does the +2 hack if you added it)
        DTPChange(Sender);
        HideDTP;

        // Hand focus back to the grid
        DBGrid1.SetFocus;

        // Shift+Tab = go backward (e.g., to Price); Tab = go forward (Quantity)
        if ssShift in Shift then
        begin
          if Assigned(qPurchases.FindField('Price')) then
            DBGrid1.SelectedField := qPurchases.FieldByName('Price');
        end
        else
        begin
          //if Assigned(qPurchases.FindField('Quantity')) then
            DBGrid1.SelectedField := qPurchases.FieldByName('Quantity');
        end;

        // Optional: immediately enter edit mode on the target cell
        DBGrid1.Perform(WM_KEYDOWN, VK_F2, 0);

        Key := 0; // consume the key so it doesn't bubble
      end;

  end;
end;

procedure TForm1.DTPWndProc(var Msg: TMessage);
var
  shiftDown: Boolean;
begin
  case Msg.Msg of
    WM_GETDLGCODE:
      begin
        FOldDTPWndProc(Msg);
        Msg.Result := Msg.Result or DLGC_WANTTAB or DLGC_WANTALLKEYS;
        Exit;
      end;

    WM_KEYDOWN:
      begin
        shiftDown := (GetKeyState(VK_SHIFT) < 0);

        // TAB -> commit, move to Quantity (or Price with Shift+Tab)
        if TWMKeyDown(Msg).CharCode = VK_TAB then
        begin
          DTPChange(DTP);           // commit here
          HideDTP;
          DBGrid1.SetFocus;
          if shiftDown then
          begin
            if Assigned(qPurchases.FindField('Price')) then
              DBGrid1.SelectedField := qPurchases.FieldByName('Price');
          end
          else
          begin
            if Assigned(qPurchases.FindField('Quantity')) then
              DBGrid1.SelectedField := qPurchases.FieldByName('Quantity');
          end;
          DBGrid1.Perform(WM_KEYDOWN, VK_F2, 0);
          Msg.Result := 1; Exit;
        end;

        // ENTER -> commit, move to Quantity
        if TWMKeyDown(Msg).CharCode = VK_RETURN then
        begin
          DTPChange(DTP);           // commit here
          HideDTP;
          DBGrid1.SetFocus;
          if Assigned(qPurchases.FindField('Quantity')) then
            DBGrid1.SelectedField := qPurchases.FieldByName('Quantity');
          DBGrid1.Perform(WM_KEYDOWN, VK_F2, 0);
          Msg.Result := 1; Exit;
        end;

        // ESC -> cancel (no commit), stay on Date cell
      if TWMKeyDown(Msg).CharCode = VK_ESCAPE then
       begin
        // 1) Hide the picker (no save)
        HideDTP;

       // 2) Cancel the pending edit/insert right now
       if Assigned(DBGrid1.DataSource) and Assigned(DBGrid1.DataSource.DataSet) then
        with DBGrid1.DataSource.DataSet do
       if State in [dsInsert, dsEdit] then
        Cancel;  // <-- this is the missing piece

       // 3) Return focus to grid and reselect Date (if it�s still there)
       DBGrid1.SetFocus;
       if Assigned(qPurchases.FindField('Date')) then
        DBGrid1.SelectedField := qPurchases.FieldByName('Date');

       Msg.Result := 1; // swallow Esc so it doesn't bubble
       Exit;
       end;


      end;
  end;

  // **** May need to nulify this paragraph
  {if Msg.Msg = WM_SETFOCUS then
    begin
    PostMessage(DTP.Handle, WM_NULL, 0, 0); // tiny defer
    //FocusDTPMonth;
    end; }


    case Msg.Msg of
    WM_GETDLGCODE:
      begin
        FOldDTPWndProc(Msg);
        Msg.Result := Msg.Result or DLGC_WANTTAB or DLGC_WANTALLKEYS;
        Exit;
      end;

    WM_SETFOCUS:
      begin
        StartSelectMonth;        // picker got focus -> (re)select month
      end;
  end;

  FOldDTPWndProc(Msg); // default processing
end;

procedure TForm1.FocusDTPMonth;
var
  hEdit: HWND;
begin
  DTP.HandleNeeded;
  // the DTP hosts an EDIT child; select the first 2 chars = month
  hEdit := FindWindowEx(DTP.Handle, 0, 'Edit', nil);
  if hEdit <> 0 then
    PostMessage(hEdit, EM_SETSEL, 0, 2);  // select MM
end;

procedure TForm1.WMFocusDTPMonth(var Msg: TMessage);
var
  hEdit: HWND;
begin
  DTP.HandleNeeded;

  // try the inner EDIT first
  hEdit := Winapi.Windows.FindWindowEx(DTP.Handle, 0, 'Edit', nil);
  if hEdit <> 0 then
  begin
    Winapi.Windows.SetFocus(hEdit);
    Winapi.Windows.SendMessage(hEdit, EM_SETSEL, WPARAM(0), LPARAM(2)); // select "MM"
    Exit;
  end;
  {
  // fallback: send keys to select first 2 chars
  Winapi.Windows.SendMessage(DTP.Handle, WM_KEYDOWN, WPARAM(VK_HOME), 0);
  Winapi.Windows.SendMessage(DTP.Handle, WM_KEYUP,   WPARAM(VK_HOME), 0);

  Winapi.Windows.SendMessage(DTP.Handle, WM_KEYDOWN, WPARAM(VK_SHIFT), 0);
  //Winapi.Windows.SendMessage(DTP.Handle, WM_KEYDOWN, WPARAM(VK_RIGHT), 0);
  //Winapi.Windows.SendMessage(DTP.Handle, WM_KEYUP,   WPARAM(VK_RIGHT), 0);
  Winapi.Windows.SendMessage(DTP.Handle, WM_KEYDOWN, WPARAM(VK_LEFT), 0);
  Winapi.Windows.SendMessage(DTP.Handle, WM_KEYUP,   WPARAM(VK_LEFT), 0);
  Winapi.Windows.SendMessage(DTP.Handle, WM_KEYUP,   WPARAM(VK_SHIFT), 0);   }
end;

procedure TForm1.StartSelectMonth;
begin
  FMonthSelRetries := 8;          // try a few times
  FDTPSelTimer.Enabled := True;
end;

procedure TForm1.DTPSelectMonthTimer(Sender: TObject);
var
  hEdit: HWND;
begin
 { if not DTP.Visible then
  begin
    FDTPSelTimer.Enabled := False;
    Exit;
  end;   }

  // The DTP hosts an EDIT child; once it exists, select "MM"
  hEdit := Winapi.Windows.FindWindowEx(DTP.Handle, 0, 'Edit', nil);
  if hEdit <> 0 then
  begin
    Winapi.Windows.SetFocus(hEdit);
    Winapi.Windows.SendMessage(hEdit, EM_SETSEL, WPARAM(0), LPARAM(2));
    FDTPSelTimer.Enabled := False;
    Exit;
  end;

  // Not ready yet? Try again on next tick (up to N times)
  if FMonthSelRetries > 0 then
    Dec(FMonthSelRetries)
  else
    FDTPSelTimer.Enabled := False;
end;

end.
