program CRUD;

uses
  Vcl.Forms,
  CustomerForm in 'CustomerForm.pas' {frmCustomer},
  MainMenu in 'MainMenu.pas' {Form1},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  CustomerCUForm in 'CustomerCUForm.pas' {frmCustomerCU},
  OrderForm in 'OrderForm.pas' {frmOrder},
  OrderCUForm in 'OrderCUForm.pas' {frmOrderCU},
  ProductCUForm in 'ProductCUForm.pas' {frmProductCU},
  OrderDetailReport in 'OrderDetailReport.pas' {frmOrderDetailReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCustomer, frmCustomer);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmCustomerCU, frmCustomerCU);
  Application.CreateForm(TfrmOrder, frmOrder);
  Application.CreateForm(TfrmOrderCU, frmOrderCU);
  Application.CreateForm(TfrmProductCU, frmProductCU);
  Application.CreateForm(TfrmOrderDetailReport, frmOrderDetailReport);
  Application.Run;
end.
