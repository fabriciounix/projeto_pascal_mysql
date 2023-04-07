unit unit_principal;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, httpdefs, fpHTTP, fpWeb, mysql80conn, SQLDB;

type

  { TFPWebModule1 }

  TFPWebModule1 = class(TFPWebModule)
    MySQL80Connection1: TMySQL80Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private

  public

  end;

var
  FPWebModule1: TFPWebModule1;

implementation

{$R *.lfm}

{ TFPWebModule1 }

procedure TFPWebModule1.DataModuleCreate(Sender: TObject);
begin
   ShortDateFormat {%H} := 'dd/mm/yyyy';
   DateSeparator {%H} := '/';
  MySQL80Connection1.Connected := True;
end;

procedure TFPWebModule1.DataModuleDestroy(Sender: TObject);
begin
   MySQL80Connection1.Connected := False;
end;

initialization
  RegisterHTTPModule('TFPWebModule1', TFPWebModule1);
end.

