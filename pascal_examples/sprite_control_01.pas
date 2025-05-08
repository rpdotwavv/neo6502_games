program sprite_control;             
uses neo6502, neo6502math, graph, crt;

var spriteNum,d: byte;
    dx,dy,xplayer,yPlayer,x,y:integer;

procedure DrawSprite(x,y,spriteNum:word);
    begin
        NeoUpdateSprite(0,x,y,spriteNum,0,0);
    end;

begin
    ClrScr;
    NeoLoad('graphics.gfx',NEO_GFX_RAM);
    spriteNum:=0;   //change to select appropriate sprite
    xPlayer:=100;
    yPlayer:=100;

    repeat
        NeoWaitForVblank;
        NeoWaitForVblank;
        DrawSprite(xPlayer,yPlayer,spriteNum);
        d:=NeoGetJoy;
        dy:=0;
        dx:=0;
        if d and 1 <> 0 then dx:=-1;    //left
        if d and 2 <> 0 then dx:=1;     //right
        if d and 4 <> 0 then dy:=-1;    //up
        if d and 8 <> 0 then dy:=1;     //down
        xPlayer:=xPlayer + dx*8;
        yPlayer:=yPlayer + dy*8;
    until false;
end.