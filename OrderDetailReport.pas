unit OrderDetailReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmOrderDetailReport = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadReportData;
  end;

var
  frmOrderDetailReport: TfrmOrderDetailReport;

implementation

{$R *.dfm}

uses DataModule;

// When the form is shown, load the report data
procedure TfrmOrderDetailReport.FormShow(Sender: TObject);
begin
  LoadReportData;
end;

// Method to load the report data into the grid
procedure TfrmOrderDetailReport.LoadReportData;
begin
  with DM.OrdrDtlRprtQrySELECT do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT o.order_uid, o.customer_uid, o.order_dt, od.line_no, od.product_no, ' +
                'od.quantity, od.price_amt ' +
                'FROM orders o ' +
                'LEFT JOIN order_details od ON o.order_uid = od.order_uid ' +
                'ORDER BY o.order_uid, od.line_no';
    Active := True;
  end;
end;

end.
