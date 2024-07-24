unit uUtilitarios;

interface

uses
  System.SysUtils,
  System.Classes,
  System.NetEncoding,
  System.Hash,
  Vcl.Imaging.pngimage,
  Vcl.Graphics,
  Vcl.Forms,
  dxMessageDialog,
  Vcl.Dialogs,
  Windows;

type
  TUtilitarios = class
    class function ColorToHex(color: TColor): String;
    class function HexToColor(hexStr: String) : TColor;
    class function EhDataValida(const Dt: TDateTime): Boolean;

    class procedure MensagemErroRapido(const Texto: String);
    class procedure MensagemAlertaRapido(const Texto: String);
    class procedure MensagemInformativaRapida(const Texto: String);
  end;

implementation

class function TUtilitarios.EhDataValida(const Dt: TDateTime): Boolean;
begin
  Result := (Dt <= MaxDateTime) and (Dt >= MinDateTime);
end;

class function TUtilitarios.HexToColor(hexStr: string): TColor;
var
  R, G, B: Byte;
begin
  if hexStr[1] = '#' then
  begin
    Delete(hexStr, 1, 1);
  end;
  R := StrToInt('$' + Copy(hexStr, 1, 2));
  G := StrToInt('$' + Copy(hexStr, 3, 2));
  B := StrToInt('$' + Copy(hexStr, 5, 2));
  Result := RGB(R, G, B);
end;

class function TUtilitarios.ColorToHex(color: TColor): String;
var
  RGBValue: Longint;
  Red, Green, Blue: Byte;
begin
  RGBValue := ColorToRGB(color);
  Red := GetRValue(RGBValue);
  Green := GetGValue(RGBValue);
  Blue := GetBValue(RGBValue);
  Result := Format('#%.2x%.2x%.2x', [Red, Green, Blue]);
end;

class procedure TUtilitarios.MensagemAlertaRapido(const Texto: String);
begin
  dxMessageDlg(Texto, TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
end;

class procedure TUtilitarios.MensagemErroRapido(const Texto: String);
begin
  dxMessageDlg(Texto, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
end;

class procedure TUtilitarios.MensagemInformativaRapida(const Texto: String);
begin
  dxMessageDlg(Texto, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
end;

end.
