unit UCreate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CheckLst, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, Vcl.Buttons;

type
  TFCreate = class(TForm)
    PEditQuestion: TPanel;
    EText: TEdit;
    CType: TComboBox;
    LTitleEdit: TLabel;
    BAppend: TButton;
    BAdd: TButton;
    PListQuestions: TPanel;
    LTitleList: TLabel;
    BChange: TButton;
    BDelete: TButton;
    LQuestion: TListBox;
    PTest: TPanel;
    LTitleTest: TLabel;
    ETitle: TEdit;
    BSave: TButton;
    POptions: TPanel;
    LTitleOption: TLabel;
    LListOption: TListBox;
    EEditOption: TEdit;
    BAddOption: TButton;
    BSaveOption: TButton;
    CCorrect: TCheckBox;
    CNumberOption: TComboBox;
    LMessageOption: TLabel;
    LMessageQuestion: TLabel;
    LMessageTest: TLabel;
    testDataButton: TButton;
    BCancel: TButton;
    BChangeOption: TButton;
    BDeleteOption: TButton;
    EOptionText: TEdit;
    insertTestData: TButton;
    BCancelOption: TButton;
    LMessageListOption: TLabel;
    GOptionText: TGroupBox;
    GEditOption: TGroupBox;
    LPostionOption: TLabel;
    STest: TSaveDialog;
    OTest: TOpenDialog;
    grpTitleQuestion: TGroupBox;
    grpTypeQuestion: TGroupBox;
    xmldcmnt1: TXMLDocument;
    grpTest: TGroupBox;
    BLoad: TBitBtn;
    LInfo: TLabel;
    procedure BAddClick(Sender: TObject);
    procedure BChangeClick(Sender: TObject);
    procedure BAppendClick(Sender: TObject);
    procedure testDataButtonClick(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
    procedure BChangeOptionClick(Sender: TObject);
    procedure insertTestDataClick(Sender: TObject);
    procedure LListOptionClick(Sender: TObject);
    procedure BSaveOptionClick(Sender: TObject);
    procedure CCorrectClick(Sender: TObject);
    procedure BAddOptionClick(Sender: TObject);
    procedure CNumberOptionChange(Sender: TObject);
    procedure BDeleteOptionClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  { ������� ���� }
  TLastData = record
    id      : Byte;
  end;

  TOption   = record
    id      : Byte;
    text    : String[255];
    correct : Boolean;
  end;

  // ��� ��� ������
  TOptionExchange = record
    n   : Byte;
    id  : Byte;
    text: string;
  end;

  TQuestion = record
    id      : Byte;
    text    : String[255];
    qtype   : Byte;
    options : array [1..100] of TOption;
  end;
  { ������� ���� ����� }

  { ��������� ��������� }
  procedure controllMessage(action : String; part : String; mes : String = '');
  procedure testToXmlFormat(test_title : string; file_name : String);
  { ��������� ��������� �����}  

var
  FCreate   : TFCreate;
  AQuestion : array [1..100] of TQuestion;
  ALastData : TLastData;
implementation

uses Math;

{$R *.dfm}

{ ��������� ��������� � ������� }
  procedure controllMessage(action : String; part : String; mes : String = '');
  begin
    if (action <> '') and (part <> '') then
    begin
      if (action = 'message') and (mes <> '') then
      begin
        if part = 'question' then FCreate.LMessageQuestion.Caption := mes;
        if part = 'option' then FCreate.LMessageOption.Caption := mes;
        if part = 'test' then FCreate.LMessageTest.Caption := mes;
        if part = 'listOption' then FCreate.LMessageListOption.Caption := mes;
      end; // end action = message
      if action = 'clear' then
      begin
        if part = 'question' then FCreate.LMessageQuestion.Caption := '';
        if part = 'option' then FCreate.LMessageOption.Caption := '';
        if part = 'test' then FCreate.LMessageTest.Caption := '';
        if part = 'listOption' then FCreate.LMessageListOption.Caption := '';
      end;
    end;// end action && part <> ''
  end; // end function controllMessage

  procedure testToXmlFormat(test_title : string ; file_name : string);
  var
    xml : IXMLDocument;
    i , n   : Integer;
    controllUnswers : Boolean;
  begin
    xml := TXMLDocument.Create(nil);
    with xml do
    begin
      Active    := True;
      Encoding  := 'utf-8';
      // �������� �������� �������
      with AddChild('test') do
      begin
        // ��������� ������� - �������� �����
        ChildValues['title'] := test_title;
        with AddChild('questions') do
        begin
          // ���������� ������� � ����� � ���������
          for i := 1 to FCreate.LQuestion.Items.Count do
          begin
            // ��������� ������� ������ �������
            with AddChild('question') do
            begin
              ChildValues['id'] := AQuestion[i].id;
              ChildValues['type'] := AQuestion[i].qtype;
              ChildValues['title'] := AQuestion[i].text;
              with AddChild('unswers') do
              begin
                controllUnswers := True;
                n := 1;
                while controllUnswers = True do
                begin
                  // ���� ������� ������� ������ �� ������...
                  if (AQuestion[i].options[n].id <> 0) and (n <= 100) then
                  begin
                    // ��������� ������� ������
                    with AddChild('unswer') do
                    begin
                      ChildValues['id'] := AQuestion[i].options[n].id;
                      ChildValues['title'] := AQuestion[i].options[n].text;
                      ChildValues['correct'] := AQuestion[i].options[n].correct;
                    end;
                  end
                  else controllUnswers := False;

                  n:= n + 1;
                end;
              end;
            end;
          end;
        end;
      end;
    end;

    xml.SaveToFile(file_name + '.xml');
  end;
{ ��������� ��������� ����� � ������� }

// ��������� ��������� ������
procedure TFCreate.BAddClick(Sender: TObject);
var
  i : Byte;
  controlCycle : Boolean;
begin
  if (FCreate.EText.Text <> '') and (FCreate.EText.Text <> ' ') then
    begin
      if FCreate.CType.ItemIndex <> -1 then
        begin
          controllMessage('clear' , 'question');
          controlCycle := true;
          i := 0;
          While (controlCycle = true) do
            begin
              i := i + 1;
              if AQuestion[i].id = 0 then
                begin
                  controlCycle := false;
                  ALastData.id := i;
                  // ���������� ������ � ������� � ���������� ������
                  with AQuestion[i] do
                    begin
                      text := FCreate.EText.Text;
                      qtype:= FCreate.CType.ItemIndex;
                      id   := i;
                    end;
                  //ShowMessage(AQuestion[i].text + ' ' + IntToStr(AQuestion[i].id)+ ' ' + IntToStr(AQuestion[i].qtype));
                  // ��������� ������ � ������ ��������
                  FCreate.LQuestion.Items.Add(AQuestion[i].text);
                  // ������� ���� ����� �������
                  FCreate.EText.Text := '';
                  // �������� ��� �������
                  FCreate.CType.ItemIndex := -1;
                end; // if aquestion[i].id = 0
            end; // while controlCycle = true
          controlCycle := true;
        end
      else controllMessage('message' , 'question' , '�������� ��� �������');
    end // ������� �������
  else controllMessage('message' , 'question' , '��������� ���� "����� �������"');
end;

procedure TFCreate.BChangeClick(Sender: TObject);
begin
  //ShowMessage(IntToStr(LQuestion.ItemIndex));
  if LQuestion.ItemIndex <> -1 then
    begin
      FCreate.BCancel.Enabled   := true;
      FCreate.BAppend.Enabled   := true;
      FCreate.BAdd.Enabled      := false;
      FCreate.LQuestion.Enabled := false;
      FCreate.BChange.Enabled   := false;

      FCreate.EText.Text        := AQuestion[FCreate.LQuestion.ItemIndex + 1].text;
      FCreate.CType.ItemIndex   := AQuestion[FCreate.LQuestion.ItemIndex + 1].qtype;

      controllMessage('clear' , 'listOption');
    end
  else controllMessage('message' , 'listOption' , '�������� ������ ��� ���������');

end;

procedure TFCreate.BAppendClick(Sender: TObject);
begin
  if (FCreate.EText.Text <> '') and (FCreate.EText.Text <> '') then
    begin
      AQuestion[FCreate.LQuestion.ItemIndex + 1].text   :=  FCreate.EText.Text;
      AQuestion[FCreate.LQuestion.ItemIndex + 1].qtype  :=  FCreate.CType.ItemIndex;

      FCreate.LQuestion.Items[FCreate.LQuestion.ItemIndex] := FCreate.EText.Text;

      FCreate.EText.Text := '';
      FCreate.CType.ItemIndex := -1;

      FCreate.BCancel.Enabled   := false;
      FCreate.BAppend.Enabled   := false;
      FCreate.BAdd.Enabled      := true;
      FCreate.LQuestion.Enabled := true;
      FCreate.BChange.Enabled   := true;
    end
  else controllMessage('message' , 'question' , '��������� ���� "����� �������"');
end;

procedure TFCreate.testDataButtonClick(Sender: TObject);
var
  i : Integer;
begin
  ShowMessage(IntToStr(Length(AQuestion[1].options)));
end;

procedure TFCreate.BCancelClick(Sender: TObject);
begin
  FCreate.BCancel.Enabled   := false;
  FCreate.BAppend.Enabled   := false;
  FCreate.BAdd.Enabled      := true;
  FCreate.LQuestion.Enabled := true;
  FCreate.BChange.Enabled   := true;
  FCreate.CCorrect.Enabled  := false;
  CNumberOption.Enabled     := false;

  BDelete.Enabled := True;
  BChange.Enabled := True;
  BChangeOption.Enabled := True;

  FCreate.EText.Text      := '';
  FCreate.EOptionText.Text:= '';
  FCreate.EEditOption.Text:= '';
  FCreate.CType.ItemIndex := -1;
  FCreate.LListOption.Items.Clear;

  POptions.Enabled := False;

end;

procedure TFCreate.BChangeOptionClick(Sender: TObject);
var
  countOptions , i : Byte;
  n : Byte;
begin
  If LQuestion.ItemIndex <> -1 then
    begin
      countOptions := 0;
      n := LQuestion.ItemIndex+1;
      controllMessage('clear' , 'listOption');

      POptions.Enabled := True;

      FCreate.BDeleteOption.Enabled := true;
      FCreate.BSaveOption.Enabled   := true;
      FCreate.BAddOption.Enabled    := true;
      FCreate.BCancelOption.Enabled := true;
      FCreate.LQuestion.Enabled     := false;

      BDelete.Enabled := False;
      BChange.Enabled := False;
      BChangeOption.Enabled := False;

      // ������� ���������� ��������� ������� � �������
      for i := 1 to Length(AQuestion[n].options) do
        begin
          if AQuestion[n].options[i].id <> 0 then
            countOptions := countOptions + 1;
        end; // for i=1 to lenght options

      // ������� ������ ����� �������
      for i:= 1 to countOptions do
        begin
          FCreate.LListOption.Items.Add(AQuestion[n].options[i].text);
        end;

      if AQuestion[LQuestion.ItemIndex + 1].qtype = 2 then
        begin
          FCreate.CCorrect.Enabled  := false;
          for i := 1 to LListOption.Items.Count do
            begin
              CNumberOption.Items.Add(IntToStr(i));
            end;
        end;
      //ShowMessage(IntToStr(countOptions));
    end // if LQuestion.ItemIndex <> -1
  else controllMessage('message' , 'listOption' , '�������� ������ �� ������');
end;

procedure TFCreate.insertTestDataClick(Sender: TObject);
begin
  LQuestion.Items.Add('1 ������');
  LQuestion.Items.Add('2 ������');
  LQuestion.Items.Add('3 ������');

  AQuestion[1].id := 1;
  AQuestion[2].id := 2;
  AQuestion[3].id := 3;

  AQuestion[1].text := '1 ������';
  AQuestion[2].text := '2 ������';
  AQuestion[3].text := '3 ������';

  AQuestion[1].qtype := 0;
  AQuestion[2].qtype := 1;
  AQuestion[3].qtype := 2;

    AQuestion[1].options[1].id := 1;
    AQuestion[1].options[2].id := 2;
    AQuestion[1].options[3].id := 3;

    AQuestion[1].options[1].text := '1 ����� ';
    AQuestion[1].options[2].text := '2 ����� ';
    AQuestion[1].options[3].text := '3 ����� ';

    AQuestion[1].options[1].correct := false;
    AQuestion[1].options[2].correct := true;
    AQuestion[1].options[3].correct := false;

    // 2 question
    AQuestion[2].options[1].id := 1;
    AQuestion[2].options[2].id := 2;
    AQuestion[2].options[3].id := 3;

    AQuestion[2].options[1].text := '1 ����� ';
    AQuestion[2].options[2].text := '2 ����� ';
    AQuestion[2].options[3].text := '3 ����� ';

    AQuestion[2].options[1].correct := true;
    AQuestion[2].options[2].correct := true;
    AQuestion[2].options[3].correct := false;

    // 3 question
    AQuestion[3].options[1].id := 1;
    AQuestion[3].options[2].id := 2;
    AQuestion[3].options[3].id := 3;

    AQuestion[3].options[1].text := '1 ����� ';
    AQuestion[3].options[2].text := '2 ����� ';
    AQuestion[3].options[3].text := '3 ����� ';

    AQuestion[3].options[1].correct := true;
    AQuestion[3].options[2].correct := true;
    AQuestion[3].options[3].correct := true;
end;

procedure TFCreate.LListOptionClick(Sender: TObject);
var
  selectedOption , selectedQuestion : Byte;
begin
  selectedOption := FCreate.LListOption.ItemIndex + 1;
  selectedQuestion := FCreate.LQuestion.ItemIndex + 1;

  {if AQuestion[selectedQuestion].options[selectedOption].correct = true then
    ShowMessage('true' + ' ' + IntToStr(selectedOption))
  else ShowMessage('false');}

  if AQuestion[selectedQuestion].qtype <> 2 then
    begin
        FCreate.CCorrect.Enabled  := true;
        if AQuestion[selectedQuestion].options[selectedOption].correct = true then
          FCreate.CCorrect.Checked := True
        else
          FCreate.CCorrect.Checked := False;
    end
  else CNumberOption.ItemIndex := selectedOption - 1;


  if AQuestion[FCreate.LQuestion.ItemIndex + 1].qtype = 2 then
    begin
      FCreate.CNumberOption.Enabled := true;
    end;
  if FCreate.LListOption.ItemIndex <> -1 then
    FCreate.EOptionText.Text := FCreate.LListOption.Items[selectedOption-1];
end;

procedure TFCreate.BSaveOptionClick(Sender: TObject);
var
  selectedQuestion , selectedOption : Byte;
begin
  selectedQuestion := FCreate.LQuestion.ItemIndex + 1;
  selectedOption   := FCreate.LListOption.ItemIndex + 1;

  if (FCreate.EOptionText.Text <> '') and (FCreate.EOptionText.Text <> ' ') then
    begin
      FCreate.LListOption.Items[FCreate.LListOption.ItemIndex] := FCreate.EOptionText.Text;
      AQuestion[selectedQuestion].options[selectedOption].text := FCreate.EOptionText.Text;
    end
  else controllMessage('message' , 'option' , '��������� ���� ������ �������� ������');
end;

procedure TFCreate.CCorrectClick(Sender: TObject);
var
  selectedQuestion , selectedOption  , i: Byte;
begin
  selectedQuestion := FCreate.LQuestion.ItemIndex + 1;
  selectedOption   := FCreate.LListOption.ItemIndex + 1;

  case AQuestion[selectedQuestion].qtype of
    // ���� ��� ������� - ���� �����, ����������� ����-�� ������ ���-� ���-� �� false
    0 :
      begin
        if FCreate.CCorrect.State = cbChecked then
          begin
            for i:= 1 to FCreate.LListOption.Items.Count do
              begin
                if i <> selectedOption then
                  AQuestion[selectedQuestion].options[i].correct := false
                else
                  AQuestion[selectedQuestion].options[i].correct := true;
              end; // for i to count llistoption items
          end // if state checked
        else if FCreate.CCorrect.State = cbUnchecked then
            AQuestion[selectedQuestion].options[selectedOption].correct := false;
      end; // case qutype = 0
    1 :
      begin
        if FCreate.CCorrect.State = cbChecked then
          AQuestion[selectedQuestion].options[selectedOption].correct := true
        else if FCreate.CCorrect.State = cbUnchecked then
            AQuestion[selectedQuestion].options[selectedOption].correct := false;

      end; // case qtype = 1
    end; // end case
end;

procedure TFCreate.BAddOptionClick(Sender: TObject);
var
  selectedQuestion : Byte;
begin
  selectedQuestion := FCreate.LQuestion.ItemIndex + 1;
  if (EEditOption.Text <> '') and (EEditOption.Text <> ' ') then
    begin
      controllMessage('clear' , 'option');
      LListOption.Items.Add(EEditOption.Text);
      AQuestion[selectedQuestion].options[LListOption.Items.Count].text := EEditOption.Text;
      AQuestion[selectedQuestion].options[LListOption.Items.Count].id   := LListOption.Items.Count;
      EEditOption.Text := '';
    end
  else controllMessage('message' , 'option' , '��������� ���� ������ ��������');

end;

procedure TFCreate.CNumberOptionChange(Sender: TObject);
var
  selectedQuestion : Byte;
  exchangeArray     : array [1..3] of TOptionExchange;
begin
  selectedQuestion := FCreate.LQuestion.ItemIndex + 1;

  // ���������� ������� ������
  with exchangeArray[1] do
    begin
      n   := LListOption.ItemIndex;
      id  := AQuestion[selectedQuestion].options[LListOption.ItemIndex + 1].id;
      text:= AQuestion[selectedQuestion].options[LListOption.ItemIndex + 1].text;
    end;

  // ���������� ������� ������
  with exchangeArray[2] do
    begin
      n   := CNumberOption.ItemIndex + 1;
      id  := AQuestion[selectedQuestion].options[CNumberOption.ItemIndex + 1].id;
      text:= AQuestion[selectedQuestion].options[CNumberOption.ItemIndex + 1].text;
    end;

  { �������� ������ � ������� �������� }

  // ���������� �������
  AQuestion[selectedQuestion].options[LListOption.ItemIndex + 1].id := exchangeArray[1].id;
  AQuestion[selectedQuestion].options[LListOption.ItemIndex + 1].text := exchangeArray[1].text;

  // ���������� �������
  //AQuestion
  {
  selectedQuestion := FCreate.LQuestion.ItemIndex + 1;
  tmpText := LListOption.Items[LListOption.ItemIndex];

  AQuestion[selectedQuestion].options[LListOption.ItemIndex + 1].text :=
    LListOption.Items[CNumberOption.ItemIndex];

  AQuestion[selectedQuestion].options[CNumberOption.ItemIndex + 1].text :=
    LListOption.Items[LListOption.ItemIndex];

  LListOption.Items[LListOption.ItemIndex] :=
    LListOption.Items[CNumberOption.ItemIndex];

  LListOption.Items[CNumberOption.ItemIndex] := tmpText;
  }
end;

procedure TFCreate.BDeleteOptionClick(Sender: TObject);
  var
    selectedQuestion , i : Byte;
begin
  selectedQuestion := FCreate.LQuestion.ItemIndex + 1;
  // ������� ������� ������� � ��������� ����������� ���������
  for i:= LListOption.ItemIndex + 1 to Length(AQuestion[selectedQuestion].options) do
    begin
      AQuestion[selectedQuestion].options[i].text := AQuestion[selectedQuestion].options[i+1].text;
      AQuestion[selectedQuestion].options[i].correct := AQuestion[selectedQuestion].options[i+1].correct;
    end;
  // ��������� ������ �������� ������� � ������� ��� id
  for i:=1 to Length(AQuestion[selectedQuestion].options) do
    begin
      if (AQuestion[selectedQuestion].options[i].id <> 0) and (AQuestion[selectedQuestion].options[i].text = '') then
        AQuestion[selectedQuestion].options[i].id := 0;
    end;
  EOptionText.Text := '';
  LListOption.DeleteSelected;
end;

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

procedure TFCreate.BLoadClick(Sender: TObject);
var
  xmlt : TXMLDocument;
  count_questions , i , n , count_unswers : Byte;
begin
  if OTest.Execute then
    begin
      xmldcmnt1.LoadFromFile(OTest.FileName);
      xmldcmnt1.Active := True;
      ETitle.Text := xmldcmnt1.DocumentElement.ChildNodes['title'].Text;

      count_questions := xmldcmnt1.DocumentElement.ChildNodes['questions'].ChildNodes.Count;

      LQuestion.Items.Clear;

      for i := 0 to count_questions - 1 do
        begin
          // ���������� ��������� �������
          count_unswers := xmldcmnt1.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['unswers'].ChildNodes.Count;

          // ��������� �������
          AQuestion[i+1].id :=StrToInt(xmldcmnt1.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['id'].Text);
          AQuestion[i+1].text := xmldcmnt1.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['title'].text;
          AQuestion[i+1].qtype := StrToInt(xmldcmnt1.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['type'].text);

          // ��������� ���� � �������

          LQuestion.Items.Add(AQuestion[i+1].text);

          // ��������� �������� ������� ��������
          for n := 0 to count_unswers - 1 do
          begin
            AQuestion[i+1].options[n+1].id := StrToInt(xmldcmnt1.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['unswers'].ChildNodes.Nodes[n].ChildNodes['id'].Text);
            AQuestion[i+1].options[n+1].text := xmldcmnt1.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['unswers'].ChildNodes.Nodes[n].ChildNodes['title'].Text;
            AQuestion[i+1].options[n+1].correct := StrToBool(xmldcmnt1.DocumentElement.ChildNodes['questions'].ChildNodes.Nodes[i].ChildNodes['unswers'].ChildNodes.Nodes[n].ChildNodes['correct'].Text);
          end;

        end;
    end
  else
  begin
    LMessageTest.Caption := '�������� ����������';
  end;

end;

procedure TFCreate.BDeleteClick(Sender: TObject);
var
  i : Byte;
begin
  if (LQuestion.ItemIndex <> -1) then
    begin
      for i := LQuestion.ItemIndex + 1 to Length(AQuestion)-1 do
        begin
          AQuestion[i].text   := AQuestion[i+1].text;
          AQuestion[i].qtype  := AQuestion[i+1].qtype;
          AQuestion[i].options:= AQuestion[i+1].options;
        end;

      for i:=1 to Length(AQuestion) do
        begin
          if (AQuestion[i].id <> 0) and (AQuestion[i].text = '') then
            AQuestion[i].id := 0;
        end;

        LQuestion.DeleteSelected;
    end
  else controllMessage('message' , 'listOption' , '�������� ������ ��� ��������');
end;

procedure TFCreate.BSaveClick(Sender: TObject);
begin
  if (ETitle.Text <> '') and (ETitle.Text <> ' ') then
    begin
      if STest.Execute then
        begin
          testToXmlFormat(ETitle.Text , STest.FileName);
          controllMessage('message' , 'test' , '���� ��� ������� ��������');
        end
      else controllMessage('message' , 'test' , '���������� ����� ���� ��������');
    end
  else controllMessage('message' , 'test' , '������� �������� �����');
end;
end.
