unit rio1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DelphiTwain, DB, MemDS, VirtualTable,jpeg, ShellAPI;

type
  Tpelepasan = class(TForm)
    pnlpelepasan: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    btn1: TButton;
    btn2: TButton;
    pnl2: TPanel;
    dbgrd1: TDBGrid;
    lbl4: TLabel;
    btn3: TButton;
    dlphtwn1: TDelphiTwain;
    img1: TImage;
    lbl5: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dlphtwn1TwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   function NamaGambar :   string;
  end;

var
  pelepasan: Tpelepasan;
  JPGku: TJPEGImage;
  asalScan : Integer;

implementation

uses rio2, dm;

{$R *.dfm}

procedure Tpelepasan.btn2Click(Sender: TObject);
begin
pelepasan2.showmodal;
end;

procedure Tpelepasan.btn1Click(Sender: TObject);
var
  sourceIndex : Integer;
  source : TTwainSource;
begin
  with DataModule1.VirtualTable1 do
  begin
  dlphtwn1.LibraryLoaded :=True;
  dlphtwn1.SourceManagerLoaded :=True;
  sourceIndex := dlphtwn1.SelectSource();

  if(sourceIndex <> -1) then
  begin
    source :=dlphtwn1.Source[sourceIndex];
    source.Loaded := True;
    source.Enabled := True;
  end;
  end;
  end;
procedure Tpelepasan.dlphtwn1TwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
var Lokasi, Gambar : string;
begin
  Img1.Picture.Assign(Image);
  Cancel := True;
  Gambar := NamaGambar;
  Lokasi := ExtractFilePath(Application.ExeName)+'\iGambar\';
  JPGku := TJPEGImage.Create;
  JPGku.Assign(Img1.Picture.Bitmap);
  JPGku.SaveToFile(Lokasi+Gambar);
  JPGku.Free;
  DataModule1.tabelrio.Append;
  DataModule1.tabelrio['Image'] := Gambar;
  DataModule1.tabelrio.Post;
end;
function Tpelepasan.NamaGambar: string;

var
  tgl, bln, thn, konversi, nom : string;
begin
  konversi := DateToStr(Now);
  tgl := Copy(konversi,1,2);
  bln := Copy(konversi,4,2);
  thn := Copy(konversi,7,2);
  nom := IntToStr(DataModule1.tabelrio.RecordCount);
  Result := 'IMG'+tgl+bln+thn+nom+'.jpeg';
end;

procedure Tpelepasan.btn3Click(Sender: TObject);
begin
if DataModule1.tabelrio.IsEmpty then
ShowMessage('Data Kosong') else
DataModule1.tabelrio.Delete;
end;

end.
