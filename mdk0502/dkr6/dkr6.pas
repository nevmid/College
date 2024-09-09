uses crt;

const
  MaxSize = 10; 

type PNode = ^Node;     
     Node = record   
       data: integer;  
       next, prev: PNode;              
     end;
     
type
  SNode = record
    SData: Integer;
    SPrev, SNext : Integer;
  end;
  
var
head, tail: PNode;
val, elem, m: integer;
pos: PNode;
c: char;
List: array[1..MaxSize] of SNode;
SHead, STail, Free, pos1, listSize: Integer;

procedure AddFirst(num: integer);
var newNode: PNode;
begin
    New(newNode);
    newNode^.data := num;
    newNode^.prev := nil;
    newNode^.next := head;
    if head <> nil then
      head^.prev := newNode;
    head := newNode;
    if tail = nil then
      tail := head;
end;

procedure AddEnd(num: Integer);
var
  newNode: PNode;
begin
    New(newNode);
    newNode^.data := num;
    newNode^.prev := tail;
    newNode^.next := nil;
    if tail <> nil then
      tail^.next := newNode;
    tail := newNode;
    if head = nil then
      head := tail;
end;


function FindElement(num: Integer): PNode;
var
  current: PNode;
begin
  current := head;
  while (current <> nil) and (current^.data <> num) do
    current := current^.next;
  FindElement := current;
end;

procedure AddBefore(current: PNode; num: Integer);
var
  newNode: PNode;
begin
    New(newNode);
    newNode^.data := num;
    newNode^.prev := current^.prev;
    newNode^.next := current;
    current^.prev := newNode;
    if newNode^.prev <> nil then
      newNode^.prev^.next := newNode
    else
      head := newNode;
end;

procedure AddAfter(current: PNode; num: Integer);
var
  newNode: PNode;
begin
  New(newNode);
  newNode^.data := num;
  newNode^.prev := current;
  newNode^.next := current^.next;
  current^.next := newNode;
  if newNode^.next <> nil then
    newNode^.next^.prev := newNode
  else
    tail := newNode;
end;

procedure DeleteNode(current: PNode);
begin
    if current^.prev = nil then
      head := current^.next
    else
      current^.prev^.next := current^.next;
  
    if current^.next = nil then
      tail := current^.prev
    else
      current^.next^.prev := current^.prev;
  
    Dispose(current);
    current := nil;
end;

procedure DisplayList;
var
  current: PNode;
  Curr: integer;
begin
  if m = 1 then
    begin
    current := head;
    while current <> nil do
    begin
      Write(current^.data, '<=>');
      current := current^.next;
    end;
    end
  else if m = 2 then
    begin
      Curr := SHead;
      while Curr <> 0 do
      begin
      Write(List[Curr].SData, '<=>');
      Curr := List[Curr].SNext;
      end;
    end;
end;

procedure Menu;
begin
  clrscr;
  DisplayList;
  writeln;
  Writeln('1. Добавить в начало');
  Writeln('2. Добавить в конец');
  Writeln('3. Добавить перед элементом');
  Writeln('4. Добавить после элемента');
  Writeln('5. Удалить элемент');
end;

procedure Dynamic;
var ch: char;
begin
  m := 1;
  repeat
    Menu;
    ch := readkey;
    case ch of
      '1': begin
        Writeln('Введите число:');
        readln(val);
        AddFirst(val);
      end;
      '2': begin
        Writeln('Введите число:');
        readln(val);
        AddEnd(val);
      end;
      '3': begin
        Writeln('Введите число:');
        readln(val);
        Writeln('Введите элемент, перед которым добавить число:');
        readln(elem);
        pos := FindElement(elem);
        if pos = nil then
          begin
          writeln('Элемент отсутствует в списке');
          sleep(1000);
          end
        else
          AddBefore(pos, val);
      end;
      '4': begin
        Writeln('Введите число:');
        readln(val);
        Writeln('Введите элемент, после которого добавить число:');
        readln(elem);
        pos := FindElement(elem);
        if pos = nil then
          begin
          writeln('Элемент отсутствует в списке');
          sleep(1000);
          end
        else
          AddAfter(pos, val);
      end;
      '5':begin
        Writeln('Введите элемент, который хотите удалить:');
        readln(elem);
        pos := FindElement(elem);
        if pos = nil then
          begin
          writeln('Элемент отсутствует в списке');
          sleep(1000);
          end
        else
          DeleteNode(pos);
      end;
    end;   
    until c = #27;
end;

function isFull: boolean;
begin
  isFull := listSize >= MaxSize;
end;

function isEmpty: boolean;
begin
  isEmpty := listSize = 0;
end;

procedure InitializeList;
var
  i: Integer;
begin
  Free := 1;
  SHead := 0;
  STail := 0;
  listSize := 0;
  
  for i := 1 to MaxSize do
  begin
    List[i].SPrev := i - 1;
    List[i].SNext := i + 1;
  end;
  
  List[MaxSize].SNext := 0;
end;

function AllocateNode: Integer;
var
  NodeIndex: Integer;
begin
  NodeIndex := Free;
  Free := List[Free].SNext;
  List[NodeIndex].SPrev := 0;
  List[NodeIndex].SNext := 0;
  
  Result := NodeIndex;
end;

procedure FreeNode(NodeIndex: Integer);
begin
  List[NodeIndex].SNext := Free;
  Free := NodeIndex;
end;

procedure AddNodeToHead(Data: Integer);
var
  NewNode: Integer;
begin
  if isFull then
    begin
    Writeln('Список полон!');
    sleep(1000);
    end
  else
    begin
      NewNode := AllocateNode;
      List[NewNode].SData := Data;
      
      if SHead = 0 then
      begin
        SHead := NewNode;
        STail := NewNode;
      end
      else
      begin
        List[NewNode].SNext := SHead;
        List[SHead].SPrev := NewNode;
        SHead := NewNode;
      end;
      listSize := listSize + 1;
    end;
end;

procedure AddNodeToTail(Data: Integer);
var
  NewNode: Integer;
begin
  if isFull then
    begin
    Writeln('Список полон!');
    sleep(1000);
    end
  else
    begin
    NewNode := AllocateNode;
    List[NewNode].SData := Data;
    
    if SHead = 0 then
      SHead := NewNode
    else
    begin
      List[STail].SNext := NewNode;
      List[NewNode].SPrev := STail;
      STail := NewNode;
    end;
    listSize := listSize + 1;
  end;
end;

function SFindElement(num: Integer): integer;
var
  current: integer;
begin
  current := SHead;
  while (current <> 0) and (list[current].SData <> num) do
    current := list[current].SNext;
  SFindElement := current;
end;

procedure AddNodeAfter(Data, NodeIndex: Integer);
var
  NewNode: Integer;
begin
  if isFull then
    begin
    Writeln('Список полон!');
    sleep(1000);
    end
  else
    begin
      if List[NodeIndex].SNext = 0 then
        AddNodeToTail(Data)
      else
      begin
        NewNode := AllocateNode;
        List[NewNode].SData := Data;
        List[NewNode].SNext := List[NodeIndex].SNext;
        List[List[NodeIndex].SNext].SPrev := NewNode;
        List[NodeIndex].SNext := NewNode;
        List[NewNode].SPrev := NodeIndex;
      end;
      listSize := listSize + 1;
  end;
end;

procedure AddNodeBefore(Data, NodeIndex: Integer);
var
  NewNode: Integer;
begin
  if isFull then
    begin
    Writeln('Список полон!');
    sleep(1000);
    end
  else
    begin
      if List[NodeIndex].SPrev = 0 then
        AddNodeToHead(Data)
      else
      begin
        NewNode := AllocateNode;
        List[NewNode].SData := Data;
        List[NewNode].SPrev := List[NodeIndex].SPrev;
        List[List[NodeIndex].SPrev].SNext := NewNode;
        List[NodeIndex].sPrev := NewNode;
        List[NewNode].SNext := NodeIndex;
      end;
      listSize := listSize + 1;
    end;
end;

procedure Delete(num: integer);
var current: integer;
begin
  current := Shead;
  while current <> 0 do
  begin
    if list[current].SData = num then
    begin
      if list[current].SPrev <> 0 then
        list[list[current].SPrev].SNext := list[current].SNext
      else
        Shead := list[current].SNext;
      if list[current].SNext <> 0 then
        list[list[current].Snext].Sprev := list[current].Sprev
      else
        STail := list[current].SPrev;
      FreeNode(current);
      listSize := listSize - 1;
      exit;
    end;
    current := list[current].SNext;
  end;
end;

procedure Staticc;
var ch: char;
begin
  m := 2;
  repeat
    Menu;
    ch := readkey;
    case ch of
      '1': begin
        Writeln('Введите число:');
        readln(val);
        AddNodeToHead(val);
      end;
      '2': begin
        Writeln('Введите число:');
        readln(val);
        AddNodeToTail(val);
      end;
      '3': begin
        Writeln('Введите число:');
        readln(val);
        Writeln('Введите элемент, перед которым добавить число:');
        readln(elem);
        pos1 := SFindElement(elem);
        if pos1 = 0 then
          begin
          writeln('Элемент отсутствует в списке');
          sleep(1000);
          end
        else
          AddNodeBefore(val, pos1);
      end;
      '4': begin
        Writeln('Введите число:');
        readln(val);
        Writeln('Введите элемент, после которого добавить число:');
        readln(elem);
        pos1 := SFindElement(elem);
        if pos1 = 0 then
          begin
          writeln('Элемент отсутствует в списке');
          sleep(1000);
          end
        else
          AddNodeAfter(val, pos1);
      end;
      '5':begin
        if isEmpty then
          begin
             Writeln('Список пуст');
             sleep(1000);
          end
        else
          begin
            Writeln('Введите элемент, который хотите удалить:');
            readln(elem);
            pos1 := SFindElement(elem);
            if pos1 = 0 then
              begin
              writeln('Элемент отсутствует в списке');
              sleep(1000);
              end
            else
              Delete(elem);
          end;
      end;
    end;   
  until ch = #27;
end;

begin
  head := nil;
  tail := nil;
  InitializeList;
  repeat 
  Writeln('1. Динамическая');
  Writeln('2. Статическая');
  c := ReadKey;
  case c of
    '1':Dynamic;
    '2':Staticc;
    end;
  until c = #27;
end.