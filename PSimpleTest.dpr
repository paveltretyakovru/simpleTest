program PSimpleTest;

uses
  Forms,
  UMain in 'UMain.pas' {FMain},
  UCreate in 'UCreate.pas' {FCreate},
  UTesting in 'UTesting.pas' {FTesting},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFCreate, FCreate);
  Application.CreateForm(TFTesting, FTesting);
  Application.Run;
end.
