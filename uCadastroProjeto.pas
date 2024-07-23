unit uCadastroProjeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, 
  cxLookAndFeels, cxLookAndFeelPainters, cxClasses, dxUIAClasses, dxSkinsCore,
  dxSkinOffice2010Silver, dxRibbonCustomizationForm, dxCore, dxStatusBar,
  dxRibbonStatusBar, dxBarApplicationMenu, System.ImageList, Vcl.ImgList,
  cxImageList, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, cxContainer,
  cxEdit, cxTextEdit, cxMemo, cxDBEdit;

type
  TFrmCadastroProjeto = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    cxImageList1: TcxImageList;
    dxBarLargeButton3: TdxBarLargeButton;
    GroupBox1: TGroupBox;
    DBLabeledEdit1: TDBLabeledEdit;
    cxDBMemo1: TcxDBMemo;
    Label1: TLabel;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroProjeto: TFrmCadastroProjeto;

implementation

{$R *.dfm}


end.
