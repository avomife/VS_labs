unit Fourth;
{Ефимова Анастасия Андреевна
Нарисовать картинку с изображением дома}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure TForm1.page;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Rect: Trect;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var pol: array[1..10] of TPOint;
begin

  Canvas.Brush.Color:=$003c14DC;
  Canvas.Pen.Color:=$003c14DC;
                          
  Canvas.PolyGon([Point(250,149),Point(350,149),Point(300,109)]);

  Canvas.Brush.Color:=clyellow;
  Canvas.Pen.Color:=clblack;

  Canvas.PolyGon([Point(350,150),Point(350,220),Point(250,220),Point(250,150)]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Rect.Left:=0;
  Rect.Top:=0;
  Rect.Right:=Image1.Width;
  Rect.Bottom:=Image1.Height;
  Image1.Canvas.Brush.Color:=clWhite;
end;

end.
