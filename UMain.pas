unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, {���������} UCreate, {���������} UTesting , Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TFMain = class(TForm)
    BLoadTest: TBitBtn;
    BChangeTest: TBitBtn;
    LCopy: TLabel;
    MLog: TMemo;
    ISimpleTest: TImage;
    PSee: TPanel;
    BLogShow: TButton;
    procedure BChangeTestClick(Sender: TObject);
    procedure BLoadTestClick(Sender: TObject);
    procedure BLogShowClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain     : TFMain;
  password  : String = 'szipdj13main';
  fileLog   : string = 'C:\log.txt';
  logEnabled: Boolean;
implementation

{$R *.dfm}

procedure TFMain.BChangeTestClick(Sender: TObject);
var
  control : Boolean;
  pass : String;
begin
  // ������ �� ����������� ��� ��������� �����
  control := True;
  if control = True then pass := InputBox('�����������' , '������� ������' , '')
  else pass := password;

  if pass = password then
    begin
        FCreate.Show;
    end
  else ShowMessage('�������� ������');

end;

procedure TFMain.BLoadTestClick(Sender: TObject);
begin
  FTesting.Show;
end;

procedure TFMain.BLogShowClick(Sender: TObject);
var
  control : Boolean;
  pass : String;
begin
  // ������ �� ����������� ��� ��������� �����
  control := True;
  // ��������� ������ �� ��� ��� ���
  if MLog.Visible = False then
    begin
      if control = True then pass := InputBox('�����������' , '������� ������' , '')
      else pass := password;

      if pass = password then
      begin
        MLog.Visible := True;
        MLog.Lines.LoadFromFile(fileLog);
      end
      else ShowMessage('�������� ������');
    end
  else
  MLog.Visible := False;

end;

procedure TFMain.N2Click(Sender: TObject);
begin
  Close;
end;

end.
