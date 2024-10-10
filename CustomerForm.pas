unit CustomerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmCustomer = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnCreate: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    DataSource1: TDataSource;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshGrid;
  end;

var
  frmCustomer: TfrmCustomer;

implementation

{$R *.dfm}

uses DataModule, CustomerCUForm;

procedure TfrmCustomer.btnCreateClick(Sender: TObject);
begin
  frmCustomerCU.Caption := 'Create Customer';
  frmCustomerCU.showmodal;
  RefreshGrid;
end;

procedure TfrmCustomer.btnUpdateClick(Sender: TObject);
begin
  frmCustomerCU.Caption := 'Update Customer';
  frmCustomerCU.Hint := DBGrid1.Fields[0].Text;  // Use the Hint property to store the selected ID
  frmCustomerCU.showmodal;
  RefreshGrid;
end;


procedure TfrmCustomer.btnDeleteClick(Sender: TObject);
var
  customerUID: string;
begin
  // Get the selected customer UID from the grid
  customerUID := DBGrid1.Fields[0].AsString;

  // Confirm deletion
  if MessageDlg('Are you sure you want to delete this customer?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with DM.QryDELETE do
    begin
      SQL.Clear;
      SQL.Text := 'DELETE FROM customers WHERE customer_uid = :customer_uid';
      Params.ParamByName('customer_uid').AsString := customerUID;
      ExecSQL;
    end;

    // Refresh the grid to reflect the deletion
    RefreshGrid;
  end;
end;

procedure TfrmCustomer.FormShow(Sender: TObject);
begin
  RefreshGrid;
end;

procedure TfrmCustomer.RefreshGrid;
begin
  with DM.QrySELECT do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM customers';
    Active := True;
  end;
end;

end.

