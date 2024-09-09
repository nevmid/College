program dfc;
Uses  GraphABC,dkr7;
var (m,wx,wy,g) := (100, 350,350, 10);
procedure text;
begin
  textout(10, 30, 'Left - влево');
  textout(10, 50, 'Right - вправо');
  textout(10, 70, 'Up - вверх');
  textout(10, 90, 'Down - вниз');
  textout(10, 110, 'Q - увеличение');
  textout(10, 130, 'W - уменьшение');
  textout(10, 150, 'A - увеличение глубины');
  textout(10, 170, 'S - уменьшение глубины');
end;
Procedure KeyDown(k: integer);
begin
 case K of
    VK_Escape: halt;
    VK_Up: wy -= 10;
    VK_Down: wy += 10; 
    VK_Right: wx += 10;  
    VK_Left: wx -= 10;
    VK_Q: if m < 500 then m+=10;
    VK_W: if m > 20 then m-=10;
    VK_A: if g < 15 then g+=1;
    VK_S: if g > 0 then g -=1;
   end;
 Window.Clear;
 text;
 levy(wx-m,wy,wx+m,wy,g);
 Redraw;
end;
Begin
SetWindowSize(700,600);
LockDrawing;
KeyDown(0);
OnkeyDown += KeyDown;
End.