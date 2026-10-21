typedef struct { short left, top, right, bottom; } Rect;
typedef struct { Rect rect; int unused; } Window;
typedef struct { Window windows[3]; int unused[2]; } Display;
extern Display data_ov000_021c7540[];

void func_ov000_021ab258(int display, int window, int inside, int outside)
{
    Rect r = data_ov000_021c7540[display].windows[window].rect;
    switch (display) {
    case 0:
        switch (window) {
        case 0:
            *(volatile unsigned short *)0x04000048 = (*(volatile unsigned short *)0x04000048 & ~0x3f) | inside | 0x20;
            *(volatile unsigned short *)0x04000040 = ((r.left << 8) & 0xff00) | (r.right & 0xff);
            *(volatile unsigned short *)0x04000044 = ((r.top << 8) & 0xff00) | (r.bottom & 0xff);
            break;
        case 1:
            *(volatile unsigned short *)0x04000048 = (*(volatile unsigned short *)0x04000048 & ~0x3f00) | (inside << 8) | 0x2000;
            *(volatile unsigned short *)0x04000042 = ((r.left << 8) & 0xff00) | (r.right & 0xff);
            *(volatile unsigned short *)0x04000046 = ((r.top << 8) & 0xff00) | (r.bottom & 0xff);
            break;
        }
        *(volatile unsigned short *)0x0400004a = (*(volatile unsigned short *)0x0400004a & ~0x3f) | outside | 0x20;
        break;
    case 1:
        switch (window) {
        case 0:
            *(volatile unsigned short *)0x04001048 = (*(volatile unsigned short *)0x04001048 & ~0x3f) | inside | 0x20;
            *(volatile unsigned short *)0x04001040 = ((r.left << 8) & 0xff00) | (r.right & 0xff);
            *(volatile unsigned short *)0x04001044 = ((r.top << 8) & 0xff00) | (r.bottom & 0xff);
            break;
        case 1:
            *(volatile unsigned short *)0x04001048 = (*(volatile unsigned short *)0x04001048 & ~0x3f00) | (inside << 8) | 0x2000;
            *(volatile unsigned short *)0x04001042 = ((r.left << 8) & 0xff00) | (r.right & 0xff);
            *(volatile unsigned short *)0x04001046 = ((r.top << 8) & 0xff00) | (r.bottom & 0xff);
            break;
        }
        *(volatile unsigned short *)0x0400104a = (*(volatile unsigned short *)0x0400104a & ~0x3f) | outside | 0x20;
        break;
    }
}
