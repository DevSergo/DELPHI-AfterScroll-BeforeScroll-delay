{
		Это часть какого-то большого моего проекта.

	- заполняем таблицу FDQuery1 10000 строк.
	- тестируем задержку в событиях AfterScroll и BeforeScroll
	- используем OutputDebugString	
}

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    FDQuery1ID: TIntegerField;
    FDQuery1NAME: TWideStringField;
    FDQuery1PHOTO: TBlobField;
    Button2: TButton;
    Button3: TButton;
    Splitter1: TSplitter;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FDQuery1AfterScroll(DataSet: TDataSet);
    procedure FDQuery1BeforeScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var
  LastTickCount, DeltaTickCount: cardinal;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  FDQuery1.DisableControls;
  for i := 20001 to 30000 do
  begin
    if not FDQuery1.Locate('id', i, []) then
    begin
          FDQuery1.Append;
          FDQuery1.FieldByName('id').AsInteger := i;
          FDQuery1.FieldByName('name').AsString := 'Захар_' + i.ToString;
          FDQuery1.Post;
    end;
  end;
  FDQuery1.EnableControls;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  OutputDebugString(pwidechar('SB_ENDSCROLL')) ;
  Application.ProcessMessages;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Clear;
end;

procedure TForm1.FDQuery1AfterScroll(DataSet: TDataSet);
begin
  DeltaTickCount := GetTickCount - LastTickCount;
  LastTickCount := LastTickCount + DeltaTickCount;
  memo1.Lines.Append(memo1.Lines.Count.ToString + ' AfterScroll    : ' + LastTickCount.ToString + '  ' + DeltaTickCount.ToString);
end;

procedure TForm1.FDQuery1BeforeScroll(DataSet: TDataSet);
begin
  DeltaTickCount := GetTickCount - LastTickCount;
  LastTickCount := LastTickCount + DeltaTickCount;
  memo1.Lines.Append(memo1.Lines.Count.ToString + '  BeforeScroll : ' + LastTickCount.ToString + '  ' + DeltaTickCount.ToString);
end;

initialization

  LastTickCount := TThread.GetTickCount;

end.
