unit UTesting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFTesting = class(TForm)
    BLoadTest: TButton;
    grpGotov: TGroupBox;
    LTestStatus: TLabel;
    GInfoStudent: TGroupBox;
    GSernameStudent: TGroupBox;
    TSernameStudent: TEdit;
    GNameStudent: TGroupBox;
    TNameStudent: TEdit;
    GGroupStudent: TGroupBox;
    TGroupStudent: TEdit;
    BBeginTest: TButton;
    DOpen: TOpenDialog;
    xmldoc: TXMLDocument;
    btmp: TBitBtn;
    btmp1: TBitBtn;
    TStatusTest: TLabel;
    PTesting: TPanel;
    PFirstType: TRadioGroup;
    LQSecondType: TListBox;
    PSecondType: TGroupBox;
    BNextQuestion: TBitBtn;
    BFinishedTest: TBitBtn;
    PThirdType: TGroupBox;
    CThird1: TComboBox;
    CThird2: TComboBox;
    CThird3: TComboBox;
    CThird4: TComboBox;
    CThird5: TComboBox;
    CThird6: TComboBox;
    TextQuestion: TLabel;
    LNumQuestShow: TLabel;
    LNumQuestHidden: TLabel;
    BCorrectUns: TLabel;
    PResult: TPanel;
    LTStudentName: TLabel;
    LTTestTitle: TLabel;
    LTStudentGroup: TLabel;
    LTStudentResult: TLabel;
    LTestTitle: TLabel;
    LStudentName: TLabel;
    LStudentGroup: TLabel;
    LResult: TLabel;
    BFinishTest: TButton;
    LTCurrentUns: TLabel;
    CThird7: TComboBox;
    procedure BLoadTestClick(Sender: TObject);
    procedure btmpClick(Sender: TObject);
    procedure btmp1Click(Sender: TObject);
    procedure BBeginTestClick(Sender: TObject);
    procedure BNextQuestionClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFinishTestClick(Sender: TObject);
    procedure BFinishedTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCTestController = class
  private
    public
      // функця определяет текущий номер вопроса
      function detNumQuest() : Integer;
      // функция определяет тип вопроса по номеру
      function detTypeQuest(numQuest : Integer) : Integer;
      // процедура подготавливает поле для вопроса
      procedure prepQuestPanel(typeQuest : Byte);
      // обновить номер вопроса в метке
      procedure updateNumQuestShow(numQuset : Byte);
      // обновить счетчик вопроса
      procedure updateNumQuestHidden(numQuest : Byte);
      // обновить текст вопроса
      procedure updateTextQuest(numQuest : Byte);
      // получить номер текущего вопроса
      function geNumQuestNow() : Byte;
      // проверяем рузельтат ответа на вопрос
      function controllQuest() : Boolean;
      // поиск выбранного ответа первого типа
      function selectedFirst() : Byte;
      // выводим список вариантов ответов вопроса 1 тип
      function showUnswersFirstType(numQuest : Byte) : Boolean;
      // выводим список вариантов ответа вопросов 2 типа
      function showUnswersSecondType(numQuest : Byte) : Boolean;
      // выводим список варинтов ответов вопросов 3 типа
      function showUnswersThirdType(numQuest : Byte) : Boolean;
      procedure showTestResult;
      procedure finishTest;
  end;

  { ГЛАВНЫЕ ТИПЫ }

  TOption   = record
    id      : Integer;
    text    : String;
    correct : Boolean;
  end;

  TQuestion = record
    id      : Integer;
    text    : String;
    qtype   : Integer;
    options : array [1..100] of TOption;
  end;

  TStudent = record
    name        : String;
    sername     : String;
    group       : String;
    proc        : Byte;
    count_true  : Byte;
    count_fale  : Byte;
    proc_result : Byte;
  end;

  TTest = record
    title       : String;
    questions   : array [1..100] of TQuestion;
    count_quest : Integer;
    load_control: Boolean;
    student     : TStudent;
    begin_time  : String;
    end_time    : string;
  end;
  { ГЛАВНЫЕ ТИПЫ КОНЕЦ }

  { ОТДЕЛЬНЫЕ ПРОЦЕДУРЫ }

  { ОТДЕЛЬНЫЕ ПРОЦЕДУРЫ КОНЕЦ}

var
  FTesting      : TFTesting;
  OTestController : TCTestController;
  password      : String = 'szipdj13';
  correct_login : Boolean = False;
  ATest         : TTest;
implementation

{$R *.dfm}

procedure TFTesting.BBeginTestClick(Sender: TObject);
var
  control : Boolean;
  count_questions , count_unswers : Integer;
  i: Integer;
  n: Integer;
begin
  control := True;
  if ATest.load_control <> False then
  begin
    if (TNameStudent.Text = '') or (TSernameStudent.Text = '') or (TGroupStudent.Text = '')
    then control := False;

    if control <> false then
    begin
      count_questions := xmldoc.DocumentElement.ChildNodes['questions'].ChildNodes.Count;
      ATest.count_quest := count_questions;
      for i := 0 to count_questions - 1 do
        begin
          // количество вариантов ответов
          count_unswers := xmldoc.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['unswers'].ChildNodes.Count;

          // сохраняем вопросы
          ATest.questions[i+1].id :=StrToInt(xmldoc.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['id'].Text);
          ATest.questions[i+1].text := xmldoc.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['title'].text;
          ATest.questions[i+1].qtype := StrToInt(xmldoc.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['type'].text);


          // сохраняем варианты ответов вопросов
          for n := 0 to count_unswers - 1 do
          begin
            ATest.questions[i+1].options[n+1].id := StrToInt(xmldoc.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['unswers'].ChildNodes.Nodes[n].ChildNodes['id'].Text);
            ATest.questions[i+1].options[n+1].text := xmldoc.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['unswers'].ChildNodes.Nodes[n].ChildNodes['title'].Text;
            ATest.questions[i+1].options[n+1].correct := StrToBool(xmldoc.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['unswers'].ChildNodes.Nodes[n].ChildNodes['correct'].Text);
          end;

        end;

        // Сохраняем данные о студенте
        ATest.student.name := FTesting.TNameStudent.Text;
        ATest.student.sername := FTesting.TSernameStudent.Text;
        ATest.student.group := FTesting.TGroupStudent.Text;

        // скрываем панель
        FTesting.GInfoStudent.Visible := false;

        // Начинаем тест
        PTesting.Visible := True;
        // показываем 1 впорос из ...
        OTestController.updateNumQuestShow(1);
        // стартуем счетцик впоросов
        OTestController.updateNumQuestHidden(1);
        // выводим первый вопрос
        OTestController.updateTextQuest(1);
        // подготавливаем поле
        OTestController.prepQuestPanel(ATest.questions[1].qtype);
        // выводим варианты ответов
        OTestController.showUnswersFirstType(1);
        // Обнуляем счетчик правильных ответов студента
        ATest.student.count_true := 0;
        ATest.student.count_fale := 0;

        // меняем статус теста
        TStatusTest.Caption := 'Удачи!';
    end
    else TStatusTest.Caption :='Заполните все поля!';
  end
  else TStatusTest.Caption := 'Загрузите тест! Пароль у преподавателя';
end;

procedure TFTesting.BFinishedTestClick(Sender: TObject);
begin
  if MessageDlg('Вы уверены, что хотите завершить тестирование?',mtError, mbOKCancel, 0) = mrOk then
    begin
      OTestController.showTestResult;
    end;
end;

procedure TFTesting.BFinishTestClick(Sender: TObject);
begin
  OTestController.finishTest;
end;

procedure TFTesting.BLoadTestClick(Sender: TObject);
var
  pass : String;
  xmlt : TXMLDocument;
  control : Boolean;
begin
  // делать ли проверку пароля
  control := True;

  if control = True then pass := InputBox('Авторизация' , 'Введите пароль' , '')
  else pass := password;

  if pass = password then
  begin
    //correct_login := True;
    if DOpen.Execute then
    begin
      xmldoc.LoadFromFile(DOpen.FileName);
      xmldoc.Active := True;
      LTestStatus.Caption := xmldoc.DocumentElement.ChildNodes['title'].Text;
      ATest.title := LTestStatus.Caption;
      ATest.load_control := True;
    end
    else 
    begin
      LTestStatus.Caption := 'Загрузка прервалась';
      ATest.load_control := false;
    end;
    
  end
  else LTestStatus.Caption := 'Неверный пароль';

end;

procedure TFTesting.BNextQuestionClick(Sender: TObject);
var
  confirmNext , nowQuest : Integer;
begin
  // проверяем не закончил ли студент тест
  if OTestController.geNumQuestNow <= ATest.count_quest - 1 then
  begin
    confirmNext := MessageDlg('Перейти к следующему вопросу?' , mtConfirmation , mbOKCancel , 0);
    if confirmNext = mrOk then
    begin
      nowQuest := OTestController.geNumQuestNow;
      // Проверяем ответ студента на вопроса
      OTestController.controllQuest;
      // обновляем счетчик номера вопроса ...
      OTestController.updateNumQuestShow(nowQuest + 1);
      // стартуем счетцик впоросов
      OTestController.updateNumQuestHidden(nowQuest + 1);
      // выводим выводим следуюй вопрос
      OTestController.updateTextQuest(nowQuest + 1);
      // подготавливаем поле и выводим варинты ответов
      OTestController.prepQuestPanel(ATest.questions[nowQuest + 1].qtype);
    end
    else if confirmNext = mrCancel then
    begin
      //ShowMessage('Была нажата кнопка Cancel');
    end;
  end
  else
    begin
      nowQuest := OTestController.geNumQuestNow;
      // Проверяем ответ студента на вопроса
      OTestController.controllQuest;
      // Получаем результат
      OTestController.showTestResult;
    end;
  
end;

// тестовая кнопка
procedure TFTesting.btmp1Click(Sender: TObject);
begin
  xmldoc.Active := True;
  ShowMessage(xmldoc.DocumentElement.ChildNodes['title'].Text);
  xmldoc.Active := False;
end;

// тестовая кнопка
procedure TFTesting.btmpClick(Sender: TObject);
begin
  xmldoc.Active := True;
  ShowMessage(xmldoc.DocumentElement.ChildNodes['title'].Text);
  xmldoc.Active := False;
end;

procedure TFTesting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{ TTestController }

// Проверяем ответы на вопрос
function TCTestController.controllQuest: Boolean;
var
  nowQuest , typeQuest , i , countOptions , val : Integer;
  control : Boolean;
begin
  nowQuest := geNumQuestNow();
  typeQuest := detTypeQuest(nowQuest);
  case typeQuest of
    // 1 true unswer
    0 : begin
      if ATest.questions[nowQuest].options[selectedFirst()].correct = true then
      begin
        // Показываем количество правильных ответов
        FTesting.BCorrectUns.Caption := IntToStr(StrToInt(FTesting.BCorrectUns.Caption) + 1);
        // Пополняем счетчик правильных ответов
        ATest.student.count_true := ATest.student.count_true + 1;
        
        Result := True;        
      end
      else
        begin
          //ShowMessage('Uncurrect unswer!');
          ATest.student.count_fale := ATest.student.count_fale + 1;
          Result := False;
        end;
      
    end;
    // some true unswers
    1 : begin
      control := True;

      // Проверяем выделенные эелементы
      for i:=0 to FTesting.LQSecondType.Items.Count-1 do
      begin
        If FTesting.LQSecondType.Selected[i] then
          begin
            if ATest.questions[nowQuest].options[i+1].correct <> True then
              control := False;
          end
        else
          begin
            if ATest.questions[nowQuest].options[i+1].correct = True then
              control := False;
          end;
      end;

      if control = false then
        begin
          ATest.student.count_fale := ATest.student.count_fale + 1;
          Result := False;
        end
        else 
        begin
          // Показываем количество правильных ответов
          ATest.student.count_true := ATest.student.count_true + 1;
          // Показываем количество правильных ответов
          FTesting.BCorrectUns.Caption := IntToStr(StrToInt(FTesting.BCorrectUns.Caption) + 1);
          
          Result := True;
        end;
    end;
    // correct order
    2 : begin
      control := True;
      // Считаем количество вариантов ответов текущего вопроса
      countOptions := 0;
      for i := 1 to Length(ATest.questions[nowQuest].options) do
        if ATest.questions[nowQuest].options[i].id <> 0 then
          countOptions := countOptions + 1;

      case countOptions of
        2 : begin
          val := Integer(FTesting.CThird1.Items.Objects[FTesting.CThird1.ItemIndex]);
          if val <> 1 then control := False;
          val := Integer(FTesting.CThird2.Items.Objects[FTesting.CThird2.ItemIndex]);
          if val <> 2 then control := False;
        end;
        3 : begin
          val := Integer(FTesting.CThird1.Items.Objects[FTesting.CThird1.ItemIndex]);
          if val <> 1 then control := False;
          val := Integer(FTesting.CThird2.Items.Objects[FTesting.CThird2.ItemIndex]);
          if val <> 2 then control := False;
          val := Integer(FTesting.CThird3.Items.Objects[FTesting.CThird3.ItemIndex]);
          if val <> 3 then control := False;
        end;
        4 : begin
          val := Integer(FTesting.CThird1.Items.Objects[FTesting.CThird1.ItemIndex]);
          if val <> 1 then control := False;
          val := Integer(FTesting.CThird2.Items.Objects[FTesting.CThird2.ItemIndex]);
          if val <> 2 then control := False;
          val := Integer(FTesting.CThird3.Items.Objects[FTesting.CThird3.ItemIndex]);
          if val <> 3 then control := False;
          val := Integer(FTesting.CThird4.Items.Objects[FTesting.CThird4.ItemIndex]);
          if val <> 4 then control := False;
        end;
        5 : begin
          val := Integer(FTesting.CThird1.Items.Objects[FTesting.CThird1.ItemIndex]);
          if val <> 1 then control := False;
          val := Integer(FTesting.CThird2.Items.Objects[FTesting.CThird2.ItemIndex]);
          if val <> 2 then control := False;
          val := Integer(FTesting.CThird3.Items.Objects[FTesting.CThird3.ItemIndex]);
          if val <> 3 then control := False;
          val := Integer(FTesting.CThird4.Items.Objects[FTesting.CThird4.ItemIndex]);
          if val <> 4 then control := False;
          val := Integer(FTesting.CThird5.Items.Objects[FTesting.CThird5.ItemIndex]);
          if val <> 5 then control := False;
        end;
        6 : begin
          val := Integer(FTesting.CThird1.Items.Objects[FTesting.CThird1.ItemIndex]);
          if val <> 1 then control := False;
          val := Integer(FTesting.CThird2.Items.Objects[FTesting.CThird2.ItemIndex]);
          if val <> 2 then control := False;
          val := Integer(FTesting.CThird3.Items.Objects[FTesting.CThird3.ItemIndex]);
          if val <> 3 then control := False;
          val := Integer(FTesting.CThird4.Items.Objects[FTesting.CThird4.ItemIndex]);
          if val <> 4 then control := False;
          val := Integer(FTesting.CThird5.Items.Objects[FTesting.CThird5.ItemIndex]);
          if val <> 5 then control := False;
          val := Integer(FTesting.CThird6.Items.Objects[FTesting.CThird6.ItemIndex]);
          if val <> 6 then control := False;
        end;
      end;

      if control <> false then
        begin
          // Показываем количество правильных ответов
          ATest.student.count_true := ATest.student.count_true + 1;
          // Показываем количество правильных ответов
          FTesting.BCorrectUns.Caption := IntToStr(StrToInt(FTesting.BCorrectUns.Caption) + 1);

          Result := True;
        end
        else begin
              ATest.student.count_fale := ATest.student.count_fale + 1;
              Result := False;
        end;
    end;
  end;
end;

function TCTestController.detNumQuest: Integer;
begin
 Result := StrToInt(FTesting.LNumQuestHidden.Caption);
end;

function TCTestController.detTypeQuest(numQuest: Integer): Integer;
begin
  Result := ATest.questions[numQuest].qtype;
end;


// проседура сохраняет результаты и запускает заново тест
procedure TCTestController.finishTest;
var
  fileData , fileName : string;
  logFile : TextFile;
  i , n : Integer;
begin
  fileName := 'C:\log.txt';
  fileData := DateToStr(Now) + ' ' + TimeToStr(Now)+ ' ' +ATest.student.group+ ' ' +ATest.student.name+ ' ' +ATest.student.sername+ ' '+IntToStr(ATest.student.proc_result)+'%'+ ' ' + ATest.title;
  if FileExists(fileName) then
    begin
      AssignFile(logFile , fileName);
      Append(logFile);
      Writeln(logFile , fileData);
      CloseFile(logFile);
    end
    else
     begin
      AssignFile(logFile , fileName);
      Rewrite(logFile);
      Writeln(logFile , fileData);
      CloseFile(logFile);
     end;

  // скрываем панели вопросов
  FTesting.PFirstType.Visible := False;
  FTesting.PSecondType.Visible := False;
  FTesting.PThirdType.Visible := False;
  // и результата
  FTesting.PResult.Visible := False;

  // показываем панель заполнения данных
  FTesting.GInfoStudent.Visible := True;

  // очищаем данные предыдущего студента
  FTesting.TSernameStudent.Text := '';
  FTesting.TNameStudent.Text := '';
  FTesting.TGroupStudent.Text := '';

  for i := 1 to 100 do
    begin
      ATest.questions[i].id := 0;
      ATest.questions[i].text := '';
      ATest.questions[i].qtype := 0;
      for n := 1 to 100 do
        begin
          ATest.questions[i].options[n].id := 0;
          ATest.questions[i].options[n].text:= '';
          ATest.questions[i].options[n].correct := false;
        end;
    end;
  // счетчик правильных ответов ставим на ноль
  FTesting.BCorrectUns.Caption := '0';

  //ATest.title := '';
  //ATest.count_quest := 0;
  //ATest.begin_time  := '';
  //ATest.end_time    := '';

  ATest.student.name        := '';
  ATest.student.sername     := '';
  ATest.student.group       := '';
  ATest.student.proc        := 0;
  ATest.student.count_true  := 0;
  ATest.student.count_fale  := 0;
  ATest.student.proc_result := 0;

end;

function TCTestController.geNumQuestNow: Byte;
begin
  Result := StrToInt(FTesting.LNumQuestHidden.Caption);
end;

procedure TCTestController.prepQuestPanel(typeQuest : Byte);
begin
  case typeQuest of
    0 : begin
      FTesting.PFirstType.Visible := True;
      FTesting.PSecondType.Visible := False;
      FTesting.PThirdType.Visible := False;

      // выводим варианты ответов
      OTestController.showUnswersFirstType(geNumQuestNow);
    end;
    1 : begin
      FTesting.PFirstType.Visible := False;
      FTesting.PSecondType.Visible := True;
      FTesting.PThirdType.Visible := False;

      // выводим варианты ответов
      OTestController.showUnswersSecondType(geNumQuestNow);
    end;
    2 : begin
      FTesting.PFirstType.Visible := False;
      FTesting.PSecondType.Visible := False;
      FTesting.PThirdType.Visible := True;

      // выводим варианты ответов
      OTestController.showUnswersThirdType(geNumQuestNow);
    end;
  end;
end;

function TCTestController.selectedFirst: Byte;
begin
  Result :=  FTesting.PFirstType.ItemIndex + 1;
end;

procedure TCTestController.showTestResult;
var
  resultProc : Real;
begin
  resultProc := 100/ATest.count_quest*ATest.student.count_true;

  // сохраняем результат в процентах
  ATest.student.proc_result := Round(resultProc);

  FTesting.PTesting.Visible := False;

  FTesting.PResult.Visible := True;
  FTesting.LTestTitle.Caption := ATest.title;
  FTesting.LStudentName.Caption := ATest.student.name + ' ' + ATest.student.sername;
  FTesting.LStudentGroup.Caption := ATest.student.group;
  FTesting.LResult.Caption := IntToStr(ATest.student.count_true) + '/' + IntToStr(ATest.count_quest) + ' ' + IntToStr(Round(resultProc)) + '%';
end;

function TCTestController.showUnswersFirstType(numQuest: Byte): Boolean;
var
  countOptions , i : Byte;
begin
  countOptions := 0;
  // Удаляем предыдующие элементы
  for i := 0 to FTesting.PFirstType.Items.Count - 1 do
      FTesting.PFirstType.Items.Delete(0);
  // Считаем количество вариантов ответов
  for i := 1 to Length(ATest.questions[numQuest].options) do
    if ATest.questions[numQuest].options[i].id <> 0 then
      countOptions := countOptions + 1;
  // Выводим варианты ответов
  for i := 0 to countOptions - 1 do
    FTesting.PFirstType.Items.Add(ATest.questions[numQuest].options[i+1].text);

end;

function TCTestController.showUnswersSecondType(numQuest: Byte): Boolean;
var
  countOptions , i : Byte;
begin
  countOptions := 0;
  // Удаляем предыдущие варианты ответов
  for i := 0 to FTesting.LQSecondType.Items.Count -1 do
  FTesting.LQSecondType.Items.Delete(0);
  // Считаем количество вариантов ответов текущего вопроса
  for i := 1 to Length(ATest.questions[numQuest].options) do
    if ATest.questions[numQuest].options[i].id <> 0 then
      countOptions := countOptions + 1;
  // Выводим варианты ответов
  for i := 0 to countOptions - 1 do
    FTesting.LQSecondType.Items.Add(ATest.questions[numQuest].options[i+1].text);
    
end;

function TCTestController.showUnswersThirdType(numQuest: Byte): Boolean;
var
  countOptions , i , tmpId , rnd : Byte;
  options : TStringList;
  tmpText : string;
begin
  // Считаем количество вариантов ответов текущего вопроса
  countOptions := 0;
  rnd          := 0;
  for i := 1 to Length(ATest.questions[numQuest].options) do
    if ATest.questions[numQuest].options[i].id <> 0 then
      countOptions := countOptions + 1;

  // перемешиваем элементы опций 5 раз
  for i := 1 to 5 do
    begin
      // избегаем несуществующего элемента массива
      while rnd = 0 do rnd := Random(countOptions);

      // сохраняем промежуточные данные
      tmpId   := ATest.questions[numQuest].options[1].id;
      tmpText := ATest.questions[numQuest].options[1].text;

      // делаем замену данных элементов массива
      ATest.questions[numQuest].options[1].id := ATest.questions[numQuest].options[rnd].id;
      ATest.questions[numQuest].options[1].text := ATest.questions[numQuest].options[rnd].text;

      ATest.questions[numQuest].options[rnd].id := tmpId;
      ATest.questions[numQuest].options[rnd].text := tmpText;
    end;


  case countOptions of
    2 : begin
      // Заполняем объект вариантами ответов и их идентификаторов
      for i := 1 to countOptions do options.AddObject(ATest.questions[numQuest].options[i].text , TObject(ATest.questions[numQuest].options[i].id));
      // Заносим в combobox
      // 1 combobox
      FTesting.CThird1.Items.Assign(options);
      FTesting.CThird1.ItemIndex := 0;
      // 2 combobox
      FTesting.CThird2.Items.Assign(options);
      FTesting.CThird2.ItemIndex := 0;
      // чистим
      options.Clear;
      // убираем string list
      FreeAndNil(options);
      // делаем невидимыми остальные combobox
      FTesting.CThird3.Visible := false;
      FTesting.CThird4.Visible := false;
      FTesting.CThird5.Visible := false;
      FTesting.CThird6.Visible := false;
      FTesting.CThird7.Visible := false;
    end;
    3 : begin
      options := TStringList.Create;
      // Заполняем объект вариантами ответов и их идентификаторов
      for i := 1 to countOptions do options.AddObject(ATest.questions[numQuest].options[i].text , TObject(ATest.questions[numQuest].options[i].id));
      // Заносим в combobox
      // 1 combobox
      FTesting.CThird1.Items.Assign(options);
      FTesting.CThird1.ItemIndex := 0;
      // 2 combobox
      FTesting.CThird2.Items.Assign(options);
      FTesting.CThird2.ItemIndex := 0;
      // 3 combobox
      FTesting.CThird3.Items.Assign(options);
      FTesting.CThird3.ItemIndex := 0;
      // чистим
      options.Clear;
      // убираем string list
      FreeAndNil(options);
      // делаем невидимыми остальные combobox
      FTesting.CThird4.Visible := false;
      FTesting.CThird5.Visible := false;
      FTesting.CThird6.Visible := false;
      FTesting.CThird7.Visible := false;
    end;
    4 : begin
      options := TStringList.Create;
      // Заполняем объект вариантами ответов и их идентификаторов
      for i := 1 to countOptions do options.AddObject(ATest.questions[numQuest].options[i].text , TObject(ATest.questions[numQuest].options[i].id));
      // Заносим в combobox
      // 1 combobox
      FTesting.CThird1.Items.Assign(options);
      FTesting.CThird1.ItemIndex := 0;
      // 2 combobox
      FTesting.CThird2.Items.Assign(options);
      FTesting.CThird2.ItemIndex := 0;
      // 3 combobox
      FTesting.CThird3.Items.Assign(options);
      FTesting.CThird3.ItemIndex := 0;
      // 4 combobox
      FTesting.CThird4.Items.Assign(options);
      FTesting.CThird4.ItemIndex := 0;
      // чистим
      options.Clear;
      // убираем string list
      FreeAndNil(options);
      FTesting.CThird4.Visible := true;

      // делаем невидимыми остальные combobox
      FTesting.CThird5.Visible := false;
    end;
    5 : begin
      options := TStringList.Create;
      // Заполняем объект вариантами ответов и их идентификаторов
      for i := 1 to countOptions do options.AddObject(ATest.questions[numQuest].options[i].text , TObject(ATest.questions[numQuest].options[i].id));
      // Заносим в combobox
      // 1 combobox
      FTesting.CThird1.Items.Assign(options);
      FTesting.CThird1.ItemIndex := 0;
      // 2 combobox
      FTesting.CThird2.Items.Assign(options);
      FTesting.CThird2.ItemIndex := 0;
      // 3 combobox
      FTesting.CThird3.Items.Assign(options);
      FTesting.CThird3.ItemIndex := 0;
      // 4 combobox
      FTesting.CThird4.Items.Assign(options);
      FTesting.CThird4.ItemIndex := 0;
      // 5 combobox
      FTesting.CThird5.Items.Assign(options);
      FTesting.CThird5.ItemIndex := 0;
      // чистим
      options.Clear;
      // убираем string list
      FreeAndNil(options);

      FTesting.CThird5.Visible := true;
    end;

    6 : begin
      options := TStringList.Create;
      // Заполняем объект вариантами ответов и их идентификаторов
      for i := 1 to countOptions do options.AddObject(ATest.questions[numQuest].options[i].text , TObject(ATest.questions[numQuest].options[i].id));
      // Заносим в combobox
      // 1 combobox
      FTesting.CThird1.Items.Assign(options);
      FTesting.CThird1.ItemIndex := 0;
      // 2 combobox
      FTesting.CThird2.Items.Assign(options);
      FTesting.CThird2.ItemIndex := 0;
      // 3 combobox
      FTesting.CThird3.Items.Assign(options);
      FTesting.CThird3.ItemIndex := 0;
      // 4 combobox
      FTesting.CThird4.Items.Assign(options);
      FTesting.CThird4.ItemIndex := 0;
      // 5 combobox
      FTesting.CThird5.Items.Assign(options);
      FTesting.CThird5.ItemIndex := 0;
      // 6 combobox
      FTesting.CThird6.Items.Assign(options);
      FTesting.CThird6.ItemIndex := 0;
      // чистим
      options.Clear;
      // убираем string list
      FreeAndNil(options);

      FTesting.CThird5.Visible := true;
      FTesting.CThird6.Visible := true;
    end;
  end;
end;

procedure TCTestController.updateNumQuestHidden(numQuest: Byte);
begin
  FTesting.LNumQuestHidden.Caption := IntToStr(numQuest);
end;

procedure TCTestController.updateNumQuestShow(numQuset : Byte);
begin
  FTesting.LNumQuestShow.Caption := 'Вопрос № ' + IntToStr(numQuset) + ' из ' + IntToStr(ATest.count_quest);
end;

procedure TCTestController.updateTextQuest(numQuest: Byte);
begin
  FTesting.TextQuestion.Caption := ATest.questions[numQuest].text;
end;

end.
