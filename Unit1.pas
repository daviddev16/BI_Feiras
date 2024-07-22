unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, DB, cxDBData, cxContainer, dxSkinsForm, cxClasses, ImgList,
  cxImage, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, dxmdaset, dxDateRanges,
  dxScrollbarAnnotations, cxImageList, System.ImageList;

type
  TMyGridDBColumn = class(TcxGridDBColumn);

  TForm1 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1CustNo: TcxGridDBColumn;
    cxGrid1DBTableView1Company: TcxGridDBColumn;
    cxGrid1DBTableView1Addr1: TcxGridDBColumn;
    cxGrid1DBTableView1Addr2: TcxGridDBColumn;
    cxGrid1DBTableView1City: TcxGridDBColumn;
    cxGrid1DBTableView1State: TcxGridDBColumn;
    cxGrid1DBTableView1Zip: TcxGridDBColumn;
    cxGrid1DBTableView1Country: TcxGridDBColumn;
    cxGrid1DBTableView1Phone: TcxGridDBColumn;
    cxGrid1DBTableView1FAX: TcxGridDBColumn;
    cxGrid1DBTableView1TaxRate: TcxGridDBColumn;
    cxGrid1DBTableView1Contact: TcxGridDBColumn;
    cxGrid1DBTableView1LastInvoiceDate: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dsCustomers: TDataSource;
    ImageList1: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    dxSkinController1: TdxSkinController;
    cxImageList1: TcxImageList;
    cxImage1: TcxImage;
    tblCustomers: TdxMemData;
    tblCustomersCustNo: TFloatField;
    tblCustomersCompany: TStringField;
    tblCustomersAddr1: TStringField;
    tblCustomersAddr2: TStringField;
    tblCustomersCity: TStringField;
    tblCustomersState: TStringField;
    tblCustomersZip: TStringField;
    tblCustomersCountry: TStringField;
    tblCustomersPhone: TStringField;
    tblCustomersFAX: TStringField;
    tblCustomersTaxRate: TFloatField;
    tblCustomersContact: TStringField;
    tblCustomersLastInvoiceDate: TDateTimeField;
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1GetCellHeight(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  cxTextEdit, dxGDIPlusClasses;

{$R *.dfm}

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);
  TcxPainterAccess = class(TcxGridTableDataCellPainter);

procedure TForm1.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin
  if (AViewInfo.Item <> cxGrid1DBTableView1Company) or
    not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
      Exit;
  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + cxImageList1.Width + 1;
//      DrawContent;
      ACanvas.FillRect(AViewInfo.Bounds, clYellow);
      DrawBorders;

// drawing images in cells      
      with AViewInfo.ClientBounds do
        ACanvas.DrawGlyph(Left + (Width div 2) - (cxImage1.Picture.Bitmap.Width div 2),
        Top + 1, cxImage1.Picture.Bitmap);

///      with AViewInfo.ClientBounds do
///        cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, AViewInfo.GridRecord.Index mod 2, dsTransparent, itMask);

    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cxGrid1DBTableView1.OptionsView.DataRowHeight := cxImageList1.Height + 3;
end;

procedure TForm1.cxGrid1DBTableView1GetCellHeight(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
  AHeight := 32;
end;

end.
