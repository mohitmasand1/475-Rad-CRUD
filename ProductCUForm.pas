unit ProductCUForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, DateUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, DataModule, FireDAC.Stan.Param, Data.DB;

type
  TfrmProductCU = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtOrderDetailUID: TEdit;
    edtLineNumber: TEdit;
    edtProductNumber: TEdit;
    edtQuantity: TEdit;
    edtPriceAmnt: TEdit;
    btnCreate: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadOrderDetailData;
  public
    { Public declarations }
  end;

var
  frmProductCU: TfrmProductCU;

implementation

uses OrderForm;
{$R *.dfm}

function GetTimeBasedID: int64;
begin
  Result := DateTimeToUnix(Now, False) * 1000 + MilliSecondOf(Now);
end;

procedure TfrmProductCU.FormShow(Sender: TObject);
begin
  frmOrder.RefreshGrid;
  if (self.Caption = 'Add Product') then
  begin
    // Clear the fields for creating a new customer
    edtOrderDetailUID.Clear;
    edtLineNumber.Clear;
    edtProductNumber.Clear;
    edtQuantity.Clear;
    edtPriceAmnt.Clear;
    // Disable the customer UID field so users can't modify it
    edtOrderDetailUID.Enabled := False;
  end
  else if (self.Caption = 'Update Product') then
  begin
    // Load the customer data for updating
    edtOrderDetailUID.Enabled := False; // Disable it for updates as well
    LoadOrderDetailData;
  end;
end;

// Procedure to load selected product data for update
procedure TfrmProductCU.LoadOrderDetailData;
begin
  with DM.OrdrDtlQrySELECT do
  begin
    SQL.Clear;
    SQL.Text := 'SELECT * FROM order_details WHERE order_detail_uid = :order_detail_uid';
    Params.ParamByName('order_detail_uid').AsString := frmProductCU.Hint;
    Open;

    // Populate the fields with the selected customer data
    if not IsEmpty then
    begin
      edtOrderDetailUID.Text := FieldByName('order_detail_uid').AsString;
      edtLineNumber.Text := FieldByName('line_no').AsString;
      edtProductNumber.Text := FieldByName('product_no').AsString;
      edtQuantity.Text := FieldByName('quantity').AsString;
      edtPriceAmnt.Text := FieldByName('price_amt').AsString;
    end;
    frmOrder.RefreshGrid;
    Close;
  end;
end;

procedure TfrmProductCU.btnCreateClick(Sender: TObject);
begin
  if (self.Caption = 'Add Product') then
  begin
    with DM.OrdrDtlQryINSERT do
    begin
      SQL.Clear;
      SQL.Text := 'INSERT INTO order_details (order_detail_uid, line_no, product_no, quantity, price_amt, order_uid) ' +
                  'VALUES (:order_detail_uid, :line_no, :product_no, :quantity, :price_amt, :order_uid)';
      Params.ParamByName('order_detail_uid').AsLargeInt := GetTimeBasedID; // Generate new UID
      Params.ParamByName('line_no').AsInteger := StrToInt(edtLineNumber.Text);
      Params.ParamByName('product_no').AsString := edtProductNumber.Text;
      Params.ParamByName('quantity').AsInteger := StrToInt(edtQuantity.Text);
      Params.ParamByName('price_amt').AsFloat := StrToFloat(edtPriceAmnt.Text);
      Params.ParamByName('order_uid').AsLargeInt := StrToInt64(frmProductCU.Hint);  // The order this detail belongs to
      ExecSQL;
    end;
  end
  else if (self.Caption = 'Update Product') then
  begin
    with DM.OrdrDtlQryUPDATE do
    begin
      SQL.Clear;
      SQL.Text := 'UPDATE order_details SET line_no = :line_no, product_no = :product_no, quantity = :quantity, ' +
                  'price_amt = :price_amt WHERE order_detail_uid = :order_detail_uid';
      Params.ParamByName('line_no').AsInteger := StrToInt(edtLineNumber.Text);
      Params.ParamByName('product_no').AsString := edtProductNumber.Text;
      Params.ParamByName('quantity').AsInteger := StrToInt(edtQuantity.Text);
      Params.ParamByName('price_amt').AsFloat := StrToFloat(edtPriceAmnt.Text);
      Params.ParamByName('order_detail_uid').AsLargeInt := StrToInt64(edtOrderDetailUID.Text);
      ExecSQL;
    end;
  end;
  frmOrder.RefreshGrid;
  frmOrder.RefreshOrderDetails(StrToInt64(frmProductCU.Hint));
  Close;
end;

end.