typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u32 attr; u16 tile, pad; } Sprite;
extern char data_ov002_022d0f7c[];
extern int func_0207f05c(void *, void *, int);
extern void func_0208e2f4(volatile u16 *ptr, int a, int brightness);
void func_ov002_022b4df0(int *p) {
    Sprite s;
    int offset, row, col, tile, x, y;
    if (p[0] == 0 || p[26] == 0) return;
    s.attr = 0x8000a000;
    offset = 0;
    s.tile = 0;
    if (p[26] < 32) {
        offset = (32-p[26])*124/32;
        *(volatile u16 *)0x04000040 = 511;
        *(volatile u16 *)0x04000044 = 0x447c;
    } else if (p[1] != 0) {
        if (p[26] < 48) {
            int amount = (48-p[26])*2;
            *(volatile u16 *)0x04000048 = (*(volatile u16 *)0x04000048 & ~63) | 63;
            *(volatile u16 *)0x0400004a = (*(volatile u16 *)0x0400004a & ~63) | 31;
            *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0xe000) | 0x2000;
            *(volatile u16 *)0x04000040 = 511;
            *(volatile u16 *)0x04000044 = 0x447c;
            func_0208e2f4((volatile u16 *)0x04000050,16,amount%16);
        } else if (p[26] < 64) {
            int a = ((p[26]-48)*64/16)/2;
            *(volatile u16 *)0x04000040 = 511;
            *(volatile u16 *)0x04000044 = (((96-a)<<8)&0xff00) | ((96+a)&255);
            func_0208e2f4((volatile u16 *)0x04000050,1,-12);
            *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0xe000) | 0x2000;
        } else {
            *(volatile u16 *)0x04000040 = 511;
            *(volatile u16 *)0x04000044 = 0x4080;
            func_0208e2f4((volatile u16 *)0x04000050,1,-12);
            *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0xe000) | 0x2000;
        }
    }
    for (row=0, tile=0x4780, x=32; row<12; row++, tile+=0x380, x+=16) {
        
        for (col=0; col<2; col++) {
            s.tile = (s.tile & ~0x3ff) | ((tile+col*0x180)/32);
            s.attr = (s.attr & 0xfe00ff00) | ((68+col*24 + ((row&1) ? offset : -offset)) & 255) | ((x&511)<<16);
            func_0207f05c(data_ov002_022d0f7c,&s,1);
        }
    }
    p[26] += 2;
}

