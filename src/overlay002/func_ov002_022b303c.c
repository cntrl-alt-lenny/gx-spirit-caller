extern char data_02104bac[];
extern char data_021040ac[];
extern int func_0208cf58(void);
extern int func_0208cf44(void);
extern void func_0208d8c0(int);
extern void func_0201d5c0(int arg0, int arg1);
extern void func_ov002_022b31a4(char *);
extern void func_ov002_022b32c8(char *, int, int);
extern void func_ov002_022b3434(char *, int);
extern void func_ov002_022b3448(char *, int);
/* The original caller also supplies a third argument, 1. */
extern void func_ov002_022b35d8(void *self, int kind, int flag);
#define DISP (*(volatile unsigned int *)0x04000000)
void func_ov002_022b303c(char *o, int enabled) {
    unsigned int planes;
    *(int *)(o + 4) = enabled;
    *(int *)(o + 0x64) = *(unsigned short *)(data_02104bac + 0x52) == 0;
    if (*(int *)o == 0) return;
    if (enabled) {
        planes = (DISP & 0x1f00) >> 8;
        DISP = (DISP & ~0x1f00) | ((planes & ~0x1e) << 8);
        func_0208cf58();
        func_0208cf44();
        func_0208d8c0(0x60);
        DISP = (DISP & 0xffcfffef) | 0x10;
        func_0201d5c0(4, 0);
        func_ov002_022b31a4(o);
        func_ov002_022b32c8(o, 0, *(int *)(o + 0x34));
        func_ov002_022b32c8(o, 1, *(int *)(o + 0x38));
        func_ov002_022b3434(o, *(int *)(o + 0xc));
        func_ov002_022b3448(o, *(int *)(o + 0x10));
        if (*(int *)(o + 0x68)) {
            func_ov002_022b35d8(o, *(int *)(data_021040ac + 0xb9c), 1);
        }
        planes = (DISP & 0x1f00) >> 8;
        DISP = (DISP & ~0x1f00) | ((planes | 0x10) << 8);
    } else {
        func_0208cf58();
        func_0208cf44();
        planes = (DISP & 0x1f00) >> 8;
        DISP = (DISP & ~0x1f00) | ((planes & ~0x1e) << 8);
        DISP &= ~0xe000;
        *(volatile unsigned short *)0x04000050 = 0;
    }
}


