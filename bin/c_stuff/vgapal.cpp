#include <dos.h>
#include <conio.h>

void setgmode(int mode);

char far *vid_mem=(char far *)MK_FP(0xA000,0x0000);

void main(void)
{
    int x,y;
    setgmode(0x13);
    for (y=0;y<200;y++)
        for (x=0;x<256;x++)
            vid_mem[y*320+x] = x;
    getch();
    setgmode(0x03);
}

void setgmode(int mode)
{
    _AH = 0x00;
    _AL = mode;
    geninterrupt(0x10);
}
