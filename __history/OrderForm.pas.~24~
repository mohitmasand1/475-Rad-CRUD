unit OrderForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, OrderCUForm, DataModule, ProductCUForm, FireDAC.Stan.Param, System.UITypes;

type
  TfrmOrder = class(TForm)
    DBGrid: TDBGrid;
    DataSource2: TDataSource;
    btnCreate: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource3: TDataSource;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnCreateProduct: TButton;
    btnUpdateProduct: TButton;
    btnDeleteProduct: TButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnCreateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCreateProductClick(Sender: TObject);
    procedure btnUpdateProductClick(Sender: TObject);
    procedure btnDeleteProductClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshGrid;
    procedure RefreshOrderDetails(OrderUID: int64);
  end;

var
  frmOrder: TfrmOrder;

implementation

{$R *.dfm}

// When the form is shown, populate the grid with orders
procedure TfrmOrder.FormShow(Sender: TObject);
begin
  RefreshGrid;
  RefreshOrderDetails(DBGrid.Fields[0].AsLargeInt);
end;

// Create a new order
procedure TfrmOrder.btnCreateClick(Sender: TObject);
begin
  frmOrderCU.Caption := 'Create Order';
  frmOrderCU.ShowModal;
  RefreshGrid;
end;

// Update the selected order
procedure TfrmOrder.btnUpdateClick(Sender: TObject);
begin
  if DBGrid.Fields[0].AsString <> '' then
  begin
    frmOrderCU.Caption := 'Update Order';
    frmOrderCU.Hint := DBGrid.Fields[0].AsString;  // Store the selected Order UID in the Hint
    frmOrderCU.ShowModal;
    RefreshGrid;
  end
  else
    ShowMessage('Please select an order to update.');
end;

// Delete the selected order
procedure TfrmOrder.btnDeleteClick(Sender: TObject);
var
  OrderUID: string;
begin
  OrderUID := DBGrid.Fields[0].AsString;

  if MessageDlg('Are you sure you want to delete this order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with DM.QryDELETE do
    begin
      SQL.Clear;
      SQL.Text := 'DELETE FROM orders WHERE order_uid = :order_uid';
      Params.ParamByName('order_uid').AsString := OrderUID;
      ExecSQL;
    end;
    RefreshGrid;
  end;
end;

// Refresh the grid with the latest data from the orders table
procedure TfrmOrder.RefreshGrid;
begin
  with DM.OrdrQrySELECT do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM orders';  // Fetch all orders
    Active := True;
  end;
  with DM.OrdrDtlQrySELECT do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM order_details WHERE order_uid = :order_uid';  // Fetch all order details
    Params.ParamByName('order_uid').AsLargeInt := DBGrid.Fields[0].AsLargeInt;
    Active := True;
  end;
end;

procedure TfrmOrder.RefreshOrderDetails(OrderUID: int64);
begin
  with DM.OrdrDtlQrySELECT do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM order_details WHERE order_uid = :order_uid';  // Fetch details for selected order
    Params.ParamByName('order_uid').AsLargeInt := OrderUID;
    Active := True;
  end;
end;

procedure TfrmOrder.DBGridCellClick(Column: TColumn);
begin
  // Whenever an order is selected, refresh the order details for that order
  RefreshOrderDetails(DBGrid.Fields[0].AsLargeInt);
end;

procedure TfrmOrder.btnCreateProductClick(Sender: TObject);
begin
  frmProductCU.Caption := 'Add Product';
  frmProductCU.Hint := DBGrid.Fields[0].Text;
  frmProductCU.ShowModal;
  if frmProductCU.ModalResult = mrOK then
    RefreshOrderDetails(DBGrid.Fields[0].AsLargeInt);
end;

procedure TfrmOrder.btnUpdateProductClick(Sender: TObject);
begin
  if DBGrid1.Fields[0].AsString <> '' then
  begin
    frmProductCU.Caption := 'Update Product';
    frmProductCU.Hint := DBGrid1.Fields[0].Text;  // Ensure the correct order detail UID is passed
    frmProductCU.ShowModal;

    // Refresh after modal closes and changes are saved
    RefreshGrid;
    RefreshOrderDetails(DBGrid.Fields[0].AsLargeInt);  // Refresh the details for the current order
  end
  else
    ShowMessage('Please select a detail to update.');
end;

procedure TfrmOrder.btnDeleteProductClick(Sender: TObject);
var
  OrderDetailUID: int64;
begin
  OrderDetailUID := DBGrid1.Fields[0].AsLargeInt;
  if MessageDlg('Are you sure you want to delete this detail?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Delete the order detail
    with DM.OrdrDtlQryDELETE do
    begin
      SQL.Clear;
      SQL.Text := 'DELETE FROM order_details WHERE order_detail_uid = :order_detail_uid';
      Params.ParamByName('order_detail_uid').AsLargeInt := OrderDetailUID;
      ExecSQL;
    end;
    RefreshOrderDetails(DBGrid.Fields[0].AsLargeInt);
  end;
end;

end.

