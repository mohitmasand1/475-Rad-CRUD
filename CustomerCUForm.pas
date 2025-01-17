unit CustomerCUForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCustomerCU = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCustomerID: TEdit;
    edtFirstname: TEdit;
    edtSurname: TEdit;
    chkActive: TCheckBox;
    btnCreate: TButton;
    Button1: TButton;
    edtCustomerUID: TEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadCustomerData; // New procedure to load customer data for update
  public
    { Public declarations }
  end;

var
  frmCustomerCU: TfrmCustomerCU;

implementation

uses DataModule, CustomerForm;

{$R *.dfm}

procedure TfrmCustomerCU.FormShow(Sender: TObject);
begin
  if (self.Caption = 'Create Customer') then
  begin
    // Clear the fields for creating a new customer
    edtCustomerID.Clear;
    edtFirstname.Clear;
    edtSurname.Clear;
    chkActive.Checked := false;

    // Disable the customer UID field so users can't modify it
    edtCustomerUID.Enabled := False;
  end
  else if (self.Caption = 'Update Customer') then
  begin
    // Load the customer data for updating
    edtCustomerUID.Enabled := False;  // Disable it for updates as well
    LoadCustomerData;
  end;
end;

// Procedure to load selected customer data for update
procedure TfrmCustomerCU.LoadCustomerData;
begin
  with DM.QrySELECT do
  begin
    SQL.Clear;
    SQL.Text := 'SELECT * FROM customers WHERE customer_uid = :customer_uid';
    Params.ParamByName('customer_uid').AsString := frmCustomerCU.Hint; // Get the UID from the hint
    Open;

    // Populate the fields with the selected customer data
    if not IsEmpty then
    begin
      edtCustomerUID.Text := FieldByName('customer_uid').AsString;
      edtCustomerID.Text := FieldByName('customer_id').AsString;
      edtFirstname.Text := FieldByName('first_name').AsString;
      edtSurname.Text := FieldByName('surname').AsString;
      chkActive.Checked := FieldByName('active_flg').AsBoolean;
    end;

    Close;
  end;
end;

procedure TfrmCustomerCU.btnCreateClick(Sender: TObject);
begin
  if (self.Caption = 'Create Customer') then
  begin
    with DM.QryINSERT do
    begin
      SQL.Clear;
      SQL.Text := 'INSERT INTO customers (customer_id, first_name, surname, active_flg) ' +
                  'VALUES (:customer_id, :first_name, :surname, :active_flg)';
      Params.ParamByName('customer_id').AsString := edtCustomerID.Text;
      Params.ParamByName('first_name').AsString := edtFirstname.Text;
      Params.ParamByName('surname').AsString := edtSurname.Text;
      Params.ParamByName('active_flg').AsBoolean := chkActive.Checked;
      ExecSQL;
    end;
  end
  else if (self.Caption = 'Update Customer') then
  begin
    with DM.QryUPDATE do
    begin
      SQL.Clear;
      SQL.Text := 'UPDATE customers SET customer_id = :customer_id, ' +
                  'first_name = :first_name, surname = :surname, active_flg = :active_flg ' +
                  'WHERE customer_uid = :customer_uid';
      Params.ParamByName('customer_id').AsString := edtCustomerID.Text;
      Params.ParamByName('first_name').AsString := edtFirstname.Text;
      Params.ParamByName('surname').AsString := edtSurname.Text;
      Params.ParamByName('active_flg').AsBoolean := chkActive.Checked;
      Params.ParamByName('customer_uid').AsString := edtCustomerUID.Text;
      ExecSQL;
    end;
  end;
  frmCustomer.RefreshGrid;
  Close;
end;

end.

