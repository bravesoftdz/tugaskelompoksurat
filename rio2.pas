unit rio2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxExportPDF, frxPreview, StdCtrls, ExtCtrls, ShellAPI;

type
  Tpelepasan2 = class(TForm)
    pnl1: TPanel;
    btn1: TButton;
    frxpdfxprt1: TfrxPDFExport;
    frxrprt1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    pnl2: TPanel;
    frxprvw1: TfrxPreview;
    procedure btn1Click(Sender: TObject);
    procedure frxrprt1BeforePrint(Sender: TfrxReportComponent);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DelFilesFrom(Directory, Filemask : string; DelSubDirs : Boolean);
function waktu: string;
  end;

var
  pelepasan2: Tpelepasan2;

implementation

uses dm, rio1;

{$R *.dfm}

procedure Tpelepasan2.btn1Click(Sender: TObject);
var namapdf:string;
var PDFku: TfrxCustomExportFilter;
lokasihapus : string;
begin
with DataModule1.z_rio do
begin
    if asalScan = 0 then
  begin
  namapdf := pelepasan.Edt1.Text+'-'+pelepasan.Edt2.Text+'-'+waktu+ ' -Surat-pelepasan.pdf';
  PDFku := TfrxCustomExportFilter(frxpdfxprt1);
  PDFku.ShowDialog := False;
  PDFku.FileName := ExtractFilePath(Application.ExeName)+'\iPDF\'+namapdf;
  frxrprt1.PrepareReport(false);
  frxrprt1.Export(PDFku);
  pelepasan.lbl5.Caption := namapdf;
  end;

  DataModule1.tabelrio.Clear;
  lokasihapus := (ExtractFilePath(Application.ExeName)+'\Gambar_scan\');
  DelFilesFrom(lokasihapus, '*.*', False);
  namapdf := 'Surat pelepasan'+pelepasan.Edt1.Text+pelepasan.Edt2.Text+'.pdf';
  DataModule1.z_rio.Active:=True;
  DataModule1.z_rio.Append;
  DataModule1.z_rio.FieldByName('nama_file').AsString := namapdf;
  DataModule1.z_rio.Post;
  pelepasan2.Close;
end;
end;
procedure Tpelepasan2.DelFilesFrom(Directory, Filemask: string;
  DelSubDirs: Boolean);
var Sourcelst : string;
  FOS : TSHFileOpStruct;
begin
  FillChar(FOS, SizeOf(FOS), 0);
  FOS.Wnd := Application.MainForm.Handle;
  FOS.wFunc := FO_DELETE;
  Sourcelst := Directory+'\'+Filemask+#0;
  FOS.pFrom := PChar(Sourcelst);
  if not DelSubDirs then
  FOS.fFlags := FOS.fFlags or FOF_FILESONLY;
  FOS.fFlags := FOS.fFlags or FOF_NOCONFIRMATION;
  SHFileOperation(FOS);
end;

function Tpelepasan2.waktu: string;
 var tgl : TDateTime;
begin
tgl :=now();
Result:= FormatDateTime('yyyy', tgl);
end;

procedure Tpelepasan2.frxrprt1BeforePrint(Sender: TfrxReportComponent);
var img : TfrxComponent;
begin
  try
    img:=frxrprt1.FindObject('Picture1');
    TfrxPictureView(img).Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+
    '\iGambar\'+DataModule1.tabelrio.FieldValues['Image']);
    except
      ShowMessage('Objek Tidak DItemukan');
    end;
end;

procedure Tpelepasan2.FormShow(Sender: TObject);
begin
  frxrprt1.LoadFromFile(ExtractFilePath(Application.ExeName)+'PreviewScanPdfrio.fr3');
  frxrprt1.FileName:=ExtractFilePath(Application.ExeName)+'PreviewScanPdfrio.fr3';
  frxrprt1.ShowReport();
  end;

end.
