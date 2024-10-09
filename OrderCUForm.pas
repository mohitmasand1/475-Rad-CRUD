unit OrderCUForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  DataModule, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TfrmOrderCU = class(TForm)
    Panel1: TPanel;
    LabelCustomerUid: TLabel;
    LabelOrderDate: TLabel;
    LabelOrderUid: TLabel;
    edtCustomerID: TEdit;
    btnCreate: TButton;
    Button1: TButton;
    edtOrderUid: TEdit;
    OrderDatePicker: TDateTimePicker;
    Panel2: TPanel;
    LabelOrderDetailUid: TLabel;
    edtOrderDetailUid: TEdit;
    LabelLineNumber: TLabel;
    edtLineNumber: TEdit;
    LabelProductNumber: TLabel;
    edtProductNumber: TEdit;
    edtPriceAmount: TEdit;
    edtQuantity: TEdit;
    PriceAmount: TLabel;
    Quantity: TLabel;
    procedure btnCreateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure LoadOrderData;
  public
    { Public declarations }
  end;

var
  frmOrderCU: TfrmOrderCU;

implementation

{$R *.dfm}

uses OrderForm;

// Show form based on whether we are creating or updating
procedure TfrmOrderCU.FormShow(Sender: TObject);
begin
  if self.Caption = 'Create Order' then
  begin
    // Clear fields for new order creation
    edtCustomerID.Clear;
    edtOrderUid.Clear;
    edtLineNumber.Clear;
    edtProductNumber.Clear;
    edtQuantity.Clear;
    edtPriceAmount.Clear;
    // Disable OrderUID and OrderDetailUID fields during creation
    edtOrderUid.Enabled := False;
    edtOrderDetailUid.Enabled := False;
  end
  else if self.Caption = 'Update Order' then
  begin
    // Load order data first
    LoadOrderData;

    // Disable OrderUID and OrderDetailUID fields during update
    edtOrderUid.Enabled := False;
    edtOrderDetailUid.Enabled := False;
  end;
end;


// Load selected order data for update
procedure TfrmOrderCU.LoadOrderData;
begin
  with DM.QrySELECT do
  begin
    SQL.Clear;
    SQL.Text := 'SELECT * FROM orders WHERE order_uid = :order_uid';
    Params.ParamByName('order_uid').AsString := frmOrderCU.Hint;  // Get the Order UID from the Hint property
    Open;

    if not IsEmpty then
    begin
      edtOrderUid.Text := FieldByName('order_uid').AsString;
      edtCustomerID.Text := FieldByName('customer_uid').AsString;
      OrderDatePicker.Date := FieldByName('order_dt').AsDateTime;
    end;

    Close;
  end;

  with DM.QrySELECT do
  begin
    SQL.Clear;
    SQL.Text := 'SELECT * FROM order_details WHERE order_uid = :order_uid';
    Params.ParamByName('order_uid').AsString := edtOrderUid.Text;
    Open;

    if not IsEmpty then
    begin
      edtOrderDetailUid.Text := FieldByName('order_detail_uid').AsString;
      edtLineNumber.Text := FieldByName('line_no').AsString;
      edtProductNumber.Text := FieldByName('product_no').AsString;
      edtQuantity.Text := FieldByName('quantity').AsString;
      edtPriceAmount.Text := FieldByName('price_amt').AsString;
    end;

    Close;
  end;
end;

// Handle both create and update operations
procedure TfrmOrderCU.btnCreateClick(Sender: TObject);
var
  NewOrderUID: Integer;
begin
  if self.Caption = 'Create Order' then
  begin
    // Insert a new order
    with DM.QryINSERT do
    begin
      SQL.Clear;
      SQL.Text := 'INSERT INTO orders (customer_uid, order_dt) ' +
                  'VALUES (:customer_uid, :order_dt)';
      Params.ParamByName('customer_uid').AsString := edtCustomerID.Text;
      Params.ParamByName('order_dt').AsDateTime := OrderDatePicker.Date;
      ExecSQL;

      // Retrieve the last inserted OrderUID
      SQL.Clear;
      SQL.Text := 'SELECT last_insert_rowid() AS NewOrderUID';
      Open;
      NewOrderUID := FieldByName('NewOrderUID').AsInteger;
      Close;
    end;

    // Insert order details
    with DM.QryINSERT do
    begin
      SQL.Clear;
      SQL.Text := 'INSERT INTO order_details (order_uid, line_no, product_no, quantity, price_amt) ' +
                  'VALUES (:order_uid, :line_no, :product_no, :quantity, :price_amt)';
      Params.ParamByName('order_uid').AsInteger := NewOrderUID;
      Params.ParamByName('line_no').AsInteger := StrToInt(edtLineNumber.Text);
      Params.ParamByName('product_no').AsString := edtProductNumber.Text;
      Params.ParamByName('quantity').AsInteger := StrToInt(edtQuantity.Text);
      Params.ParamByName('price_amt').AsFloat := StrToFloat(edtPriceAmount.Text);
      ExecSQL;
    end;
  end
  else if self.Caption = 'Update Order' then
  begin
    // Update the order
    with DM.QryUPDATE do
    begin
      SQL.Clear;
      SQL.Text := 'UPDATE orders SET customer_uid = :customer_uid, order_dt = :order_dt ' +
                  'WHERE order_uid = :order_uid';
      Params.ParamByName('customer_uid').AsString := edtCustomerID.Text;
      Params.ParamByName('order_dt').AsDateTime := OrderDatePicker.Date;
      Params.ParamByName('order_uid').AsString := edtOrderUid.Text;
      ExecSQL;
    end;

    // Update order details
    with DM.QryUPDATE do
    begin
      SQL.Clear;
      SQL.Text := 'UPDATE order_details SET line_no = :line_no, product_no = :product_no, ' +
                  'quantity = :quantity, price_amt = :price_amt ' +
                  'WHERE order_detail_uid = :order_detail_uid';
      Params.ParamByName('line_no').AsInteger := StrToInt(edtLineNumber.Text);
      Params.ParamByName('product_no').AsString := edtProductNumber.Text;
      Params.ParamByName('quantity').AsInteger := StrToInt(edtQuantity.Text);
      Params.ParamByName('price_amt').AsFloat := StrToFloat(edtPriceAmount.Text);
      Params.ParamByName('order_detail_uid').AsString := edtOrderDetailUid.Text;
      ExecSQL;
    end;
  end;

  frmOrder.RefreshGrid;
  Close;
end;

end.
