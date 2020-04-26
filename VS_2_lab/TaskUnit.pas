unit TaskUnit;

interface
uses
  Classes,
  SysUtils,
  Windows;

function CountLett(lines: TStrings; n: integer) : TStrings;

implementation

function nextWord(s: string; var i: integer): string;
var
  len: integer;
begin
  len:=length(s);
  while (i<=len) and (s[i]=' ') do
    inc(i);
  result:='';
  while (i<=len) and (s[i]<>' ') do
    begin
      result:=result+s[i];
      inc(i);
    end;
end;


function CountLett(lines: TStrings; n: integer): TStrings;
var
  i, j: integer;
  word: string;
  eol: Boolean;
begin
  result := TStringList.Create();
  for j:=0 to lines.Count-1 do
  begin
    i:=1;
    repeat
      word:=nextWord(lines[j], i);
      eol:= word = '';

      if (not eol) and (Length(word) = n) then
        Result.Add(word);

      i:=i+1;
    until eol = True;

  end;
end;
end.
