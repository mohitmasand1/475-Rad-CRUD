unit OrderForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, OrderCUForm, DataModule, FireDAC.Stan.Param, System.UITypes;

type
  TfrmOrder = class(TForm)
    DBGrid: TDBGrid;
    DataSource1: TDataSource;
    btnCreate: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    Panel1: TPanel;
    procedure btnCreateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshGrid;
  end;

var
  frmOrder: TfrmOrder;

implementation

{$R *.dfm}

// When the form is shown, populate the grid with orders
procedure TfrmOrder.FormShow(Sender: TObject);
begin
  RefreshGrid;
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
  with DM.QrySELECT do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM orders';  // Fetch all orders
    Active := True;
  end;

  DataSource1.DataSet := DM.QrySELECT;
end;

end.

