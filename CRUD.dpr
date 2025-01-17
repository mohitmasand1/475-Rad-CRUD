program CRUD;

uses
  Vcl.Forms,
  CustomerForm in 'CustomerForm.pas' {frmCustomer},
  MainMenu in 'MainMenu.pas' {Form1},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  CustomerCUForm in 'CustomerCUForm.pas' {frmCustomerCU};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCustomer, frmCustomer);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmCustomerCU, frmCustomerCU);
  Application.Run;
end.
