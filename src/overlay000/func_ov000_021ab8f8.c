typedef struct { unsigned inside:5; unsigned dirty:1; unsigned :26; int padding[2]; } WinFlags;
typedef struct { int rect[2]; unsigned flags; } Window;
typedef struct {
 unsigned a:7; unsigned b:7; unsigned update:1; unsigned dirty:1; unsigned c:5; unsigned d:5; unsigned :6;
 unsigned cached:10; unsigned :22;
 unsigned mask:8; unsigned updateBrightness:1; unsigned master:1; signed brightness:6; signed previousBrightness:6; unsigned :10;
 unsigned planes:8; unsigned previousPlanes:8; unsigned :16;
 Window windows[2];
 unsigned mode:3; unsigned previousMode:3; unsigned outside:5; unsigned :21;
} Display;
extern Display data_ov000_021c7530[];
extern void func_ov000_021ab798(void);
extern void func_0208c884(unsigned short *, int);
extern void func_0208e318(int *, int, int, int, int);
extern void func_0208e2f4(unsigned short *, int, int);
extern void func_ov000_021ab850(int);
extern void func_ov000_021ab258(int, int, int, int);
/* Original call supplies only the display, omitting the definition's value argument. */
extern void func_ov000_021ab474();
void func_ov000_021ab8f8(void) {
 int i,j; WinFlags *w; Display *display;
 func_ov000_021ab798();
 i=0;

 for(;i<2;i++) {
  display=&data_ov000_021c7530[i];
  if(display->planes != display->previousPlanes) {
   switch(i) {
   case 0: *(volatile unsigned *)0x04000000 = (*(volatile unsigned *)0x04000000 & ~0x1f00) | (display->planes<<8); break;
   case 1: *(volatile unsigned *)0x04001000 = (*(volatile unsigned *)0x04001000 & ~0x1f00) | (display->planes<<8); break;
   }
   display->previousPlanes=display->planes;
  }
  if(display->update) {
   display->update=0;
   { int d=display->d; int c=display->c; int b=display->b; int a=display->a;
   switch(i) {
   case 0: func_0208e318((int *)0x04000050,a,b,c,d); break;
   case 1: func_0208e318((int *)0x04001050,a,b,c,d); break;
   }
   }
  } else {
   int d=display->d;
   int c=display->c;
   if(display->cached != (unsigned short)(c | d<<5)) {
    unsigned short mode;
    switch(i) {
    case 0: mode=*(volatile unsigned short *)0x04000050 & ~0x40; break;
    case 1: mode=*(volatile unsigned short *)0x04001050 & ~0x40; break;
    default: mode=0; break;
    }
    if(mode != 0x40) {
     int b=display->b; int a=display->a;
     switch(i) {
     case 0: func_0208e318((int *)0x04000050,a,b,c,d); break;
     case 1: func_0208e318((int *)0x04001050,a,b,c,d); break;
     }
    } else {
     switch(i) {
     case 0: *(volatile unsigned short *)0x04000052=c | d<<8; break;
     case 1: *(volatile unsigned short *)0x04001052=c | d<<8; break;
     }
    }
    display->cached=(unsigned short)(display->c | display->d<<5);
   }
  }
  if(display->updateBrightness) {
   display->updateBrightness=0;
   if(display->master) {
    switch(i) {
    case 0: (void)*(volatile unsigned short *)0x04000050; break;
    case 1: (void)*(volatile unsigned short *)0x04001050; break;
    }
    { int brightness=display->brightness; switch(i) {
    case 0: func_0208c884((unsigned short *)0x0400006c,brightness); break;
    case 1: func_0208c884((unsigned short *)0x0400106c,brightness); break;
    }
    } func_ov000_021ab850(i);
   } else {
    int brightness=display->brightness; int mask=display->mask;
    switch(i) {
    case 0: func_0208e2f4((unsigned short *)0x04000050,mask,brightness); break;
    case 1: func_0208e2f4((unsigned short *)0x04001050,mask,brightness); break;
    }
   }
  } else if(display->brightness != display->previousBrightness) {
   if(display->master) {
    { int brightness=display->brightness; switch(i) {
    case 0: func_0208c884((unsigned short *)0x0400006c,brightness); break;
    case 1: func_0208c884((unsigned short *)0x0400106c,brightness); break;
    }
    } func_ov000_021ab850(i);
   } else {
    int brightness=display->brightness; int mask=display->mask;
    switch(i) {
    case 0: func_0208e2f4((unsigned short *)0x04000050,mask,brightness); break;
    case 1: func_0208e2f4((unsigned short *)0x04001050,mask,brightness); break;
    }
   }
   display->previousBrightness=display->brightness;
  }
  display->dirty=0;

  for(j=0;j<2;j++) {
   w=(WinFlags *)&display->windows[j].flags;
   if(w->dirty) {
    func_ov000_021ab258(i,j,w->inside,display->outside);
    w->dirty=0;
   }
  }
  if(display->mode != display->previousMode) {
   func_ov000_021ab474(i);
   display->previousMode=display->mode;
  }
 }
}









