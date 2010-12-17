// {{{ C O P Y R I G H T
// ============================================================================
// =  Written by Colby Williams;  02/10/95                                    =
// =  Copyright (c) 1995 Colby Williams                                       =
// =  Adapted from an example in Teach Yourself C++ in 24 Hours               =
// =  Printed by Sams Publishing                                              =
// ============================================================================
// }}}

// {{{ I N C L U D E S 
// ==========================================================================

#include <dos.h>      // for MK_FP(), geninterrupt(), etc.
#include <time.h>     // for time() (used by randomize())
#include <conio.h>    // for kbhit() and getch()
#include <stdlib.h>   // for randomize(), random() et.al.
#include <string.h>   // for strlen()
// }}}

// {{{ P R E P R O C E S S O R    D E F I N I T I O N S
// ==========================================================================

#define INT10           0x10 // INT 10h
#define NUM_STARS       100  // Number of stars that appear
#define DELAY_TIME      2    // length of delay
#define C1              8    // Color of bottom layer
#define C2              7    // Color of middle layer
#define C3              15   // Color of top layer
// }}}

// {{{ P R O T O T Y P E S
// ==========================================================================

void setgmode(int mode);                // Sets graphics mode
int checkvidmode(void);                 // Check to make sure VGA
void c_ppixel(int x, int y, int colr);  // Puts a pixel at (x,y) with colr
void star_field(void);                  // The actual work of the program
void c_puts(const char *);              // puts out fast semi-formatted strings
void printhelp(void);                   // prints out the command-line help
// }}}

// {{{ T S T A R   S T R U C T U R E   D E C L A R A T I O N
// ==========================================================================

typedef struct Tstar        // Structure of Star
{
  int x,y;                  // Coordinates of Star (x,y)
  int len;                  // Length of the Star (in pixels)
  int colr;                 // Color of the Star
};
// }}}

// {{{  V A R I A B L E   D E C L A R A T I O N S
// ==========================================================================

struct Tstar stars[NUM_STARS];          // Variable array of Tstar

char far *vid_mem = (char far *)MK_FP(0xA000,0x0000); // pointer to VGA mem
char ch = '\x0';                        // Character for program end-check
unsigned int delei = DELAY_TIME;        // set delay to default
unsigned long int star_num = NUM_STARS; // set stars to default
unsigned int c1 = C1;                   // set layer 1 to default
unsigned int c2 = C2;                   // set layer 2 to default
unsigned int c3 = C3;                   // set layer 3 to default
// }}}

// {{{ M A I N   F U N C T I O N
// ==========================================================================

void main(int argc, char *argv[])
{
    int x;
    if (checkvidmode() <= 5)
    {
        c_puts("~~You need a VGA display to run C_Stars v3.40~~");
        if (checkvidmode() == -1)
            c_puts("Unknown Video card!~~");
        exit(255);
    }
    if (argc > 1)
    {
        for (x=1;x<=argc;x++)
        {
            switch(argv[x][0])
            {
            case '/':
                {
                    switch(argv[x][1])
                    {
                        case 'd':
                        case 'D':
                            {
                                argv[x][0] = '0';
                                argv[x][1] = '0';
                                delei = atoi(argv[x]);
                            } break;
                        case 's':
                        case 'S':
                            {
                                argv[x][0] = '0';
                                argv[x][1] = '0';
                                star_num = atoi(argv[x]);
                            } break;
                        case 'b':
                        case 'B':
                            {
                                argv[x][0] = '0';
                                argv[x][1] = '0';
                                c1 = atoi(argv[x]);
                            } break;
                        case 'm':
                        case 'M':
                            {
                                argv[x][0] = '0';
                                argv[x][1] = '0';
                                c2 = atoi(argv[x]);
                            } break;
                        case 't':
                        case 'T':
                            {
                                argv[x][0] = '0';
                                argv[x][1] = '0';
                                c3 = atoi(argv[x]);
                            } break;
                        default : printhelp(); break;
                    }
                }
            }
        }
    }
    if (delei == DELAY_TIME)
        c_puts("~Using Default Delay of 2");
    if (star_num == NUM_STARS)
        c_puts("~Using Default of 100 Stars");
    if ((c1 == C1) && (c2 == C2) && (c3 == C3))
        c_puts("~Using Default Colors");
    switch (checkvidmode())
    {
        case  6:
            {
                c_puts("~VGA Color Display Found");
                delay(100);
            } break;
        case  7:
            {
                c_puts("~VGA Monochrome Analog Display Found");
                delay(100);
            } break;
        case  8:
            {
                c_puts("~VGA Color Analog Display Found");
                delay(100);
            } break;
        case 10:
            {
                c_puts("~MCGA Digital Color Display Found");
                delay(100);
            } break;
        case 11:
            {
                c_puts("~MCGA Monochrome Analog Display Found");
                delay(100);
            } break;
        case 12:
            {
                c_puts("~MCGA Color Analog Display Found");
                delay(100);
            } break;
    }
    randomize();            // "Truly" random
    setgmode(0x13);         // Set video mode to VGA (320x200x256)
    while (1)               // Infinite loop
    {
        if (kbhit())        // Check for key press
        {
            ch = getch();   // Get the key
            break;          // break from while loop
        }
        star_field();       // run the Star Field
        delay(delei);       // for faster machines (0 recommended for 286)
    }
    setgmode(0x03);         // restore to 80x25x16
    c_puts("Written by Colby Williams;  02/10/95~");
    c_puts("Copyright (c) 1995 Colby Williams~");
}
// }}}

// {{{ S E T G M O D E   F U N C T I O N
// ==========================================================================

void setgmode(int mode)
{
    _AH = 0x00;           // mov ah,0
    _AL = mode;           // mov al,mode
    geninterrupt(INT10);  // int 10h
}
// }}}

// {{{ C H E C K V I D M O D E   F U N C T I O N
// ==========================================================================

int checkvidmode(void)
{
    _AH = 0x1A;             // mov ah,1Ah
    _AL = 0x00;             // mov al,0
    geninterrupt(INT10);    // int 10h
    if (_AL == 0x1A)        // cmp al,1Ah
    {
        switch(_BL)         // bl holds value of display type if al==0x1A
        {
            case 0x00:  return 0;    // no display
            case 0x01:  return 1;    // MDA with monochrome
            case 0x02:  return 2;    // CGA with color
            case 0x04:  return 4;    // EGA with color
            case 0x05:  return 5;    // EGA with monochrome
            case 0x06:  return 6;    // VGA with color
            case 0x07:  return 7;    // VGA with monochrome analog
            case 0x08:  return 8;    // VGA with color analog
            case 0x0A:  return 0x0A; // MCGA with digital color
            case 0x0B:  return 0x0B; // MCGA with monochrome analog
            case 0x0C:  return 0x0C; // MCGA with color analog
            case 0xFF:  return -1;   // unknown video card
        }
    }
    return 0;
}
// }}}

// {{{ C _ P P I X E L   F U N C T I O N
// ==========================================================================

void c_ppixel(int x, int y, int colr)
{ // puts a pixel at coordinates (x,y) with colr
    vid_mem[y*320+x] = colr;  //  set pixel position the fast way
}
// }}}

// {{{ S T A R _ F I E L D   F U N C T I O N
// ==========================================================================

void star_field(void)
{ // real work of this program
    static int star_first = 1;  // determines whether this is first time exec
    int i;     // for loop counter and indice

    if (star_first)  // check if first time called
    {
        star_first = 0;  // make sure this code isn't called again

        for (i=0; i<=star_num; i++)  // indice for structure from 0 to star_num
        {
            stars[i].x = random(320);  // choose random x coord
            stars[i].y = random(200);  // choose random y coord

            switch (random(3))         // choose random star type
            {
                case 0:
                    {
                        stars[i].len = 2;   // length of star
                        stars[i].colr = c1;  // color of star
                    } break;
                case 1:
                    {
                        stars[i].len = 3;  // length of Star is len-1
                        stars[i].colr = c2;
                    } break;
                case 2:
                    {
                        stars[i].len = 4;
                        stars[i].colr = c3;
                    } break;
            } // End switch ()
        } // End for ()
    } // End if ()
    else
    {
        for (i=0; i<=star_num; i++)
        {
            if (stars[i].colr == c1)
                stars[i].x+=stars[i].len;
            if (stars[i].colr == c2)
                stars[i].x+=stars[i].len+1;
            if (stars[i].colr == c3)
                stars[i].x+=stars[i].len+2;

            c_ppixel(stars[i].x,stars[i].y,stars[i].colr); // put the pixel
            c_ppixel(stars[i].x-=stars[i].len-1,stars[i].y,0);// black the previous
        } // End for ()
    } // End else ()
} // End star_field()
// }}}

// {{{C _ P U T S   F U N C T I O N
// ==========================================================================

void c_puts(const char *str)
{
    int s_len = strlen(str);  // get the length of the string
    int a;                    // for loop counter and indice
    _BH = 0x00;               // assume page 0
    for (a=0;a<=s_len;a++)
    {
        _AH = 0x0E;             // 0x0E for teletype;  0x0A or 0x09 for char out
        if (str[a] == '~')      // CR/LF suffix
        {
            _AL = 0x0A;           // 0Ah == CR
            geninterrupt(INT10);   // int 10h
            _AL = 0x0D;           // 0Ah == LF
            geninterrupt(INT10);   // int 10h
        }
        else                    // must not have been '~'
        {
            _AL = str[a];         // put char into AL
            geninterrupt(INT10);   // int 10h
        }
    }
}
// }}}

// {{{ P R I N T H E L P   F U N C T I O N
// ==========================================================================

void printhelp(void)
{
    clrscr();
    c_puts("Written by Colby Williams;  02/10/95~");
    c_puts("Copyright (c) 1995 Colby Williams~");
    c_puts("~~        /D<delay>   Sets duration of the delay~");
    c_puts("       /S<stars>   Sets the number of stars that appear~");
    c_puts("       /B<0..255>  Sets the color of the bottom layer~");
    c_puts("       /M<0..255>  Sets the color of the middle layer~");
    c_puts("       /T<0..255>  Sets the color of the top layer~");
    c_puts("~~Example:~     c_stars /d2 /s100 /b8 /m7 /t15~");
    exit(254);
}
// }}}

//  E N D   O F   F I L E 
// vim: foldmethod=marker
