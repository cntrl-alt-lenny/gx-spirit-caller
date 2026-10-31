typedef unsigned int u32;
typedef struct {
    u32 a, b;
    unsigned char pad8[0x14];
    struct { u32 low8:8; u32:24; };
    unsigned char pad20[4];
    struct { u32:17; u32 mid4:4; u32:11; };
} state_t;
typedef struct { int a; unsigned int mode:3; unsigned int rest:29; } Config;
typedef struct { u32 a,b; } Dims02001e94;
typedef struct { int kind; char text[0x20]; int scale, step; char rest[0x10]; } Message;
extern state_t data_02102c90;
extern Config data_02104f4c;
extern char data_ov004_02209dfc[];
extern char *func_0202c93c(void);
extern void func_0202c9c0(int active);
extern void func_02001d68(int arg);
extern void func_02001d0c(state_t *p, int a, int b);
extern int func_0202c0c0(int id);
extern char *func_0208df0c(void);
extern char *func_0208e1cc(void);
extern void func_02094504(int value, void *dst, unsigned int size);
extern int func_020054a4(int a, int b);
extern void func_02004f58(int a, int b, int c, int d, int e, int f);
extern void func_02001e94(Dims02001e94 *p, unsigned short *dst, int val, int shift);
extern int OS_SPrintf(char *dst, const char *fmt, ...);
/* Fill32's assembly definition has a void placeholder; its actual ABI takes three arguments. */
extern void Fill32(int value, void *dest, int size);
extern char *func_020aadf8(char *dst, const char *src);
extern int func_02022b74(Message *p);
extern void func_0202cca4(int a);
void func_ov004_021d0168(int value) {
    int active = value != 0;
    if (active != *(int *)func_0202c93c()) {
        func_0202c9c0(active);
        if (active == 0) {
            int text;
            char *vram;
            int width;
            func_02001d68(data_02104f4c.mode);
            func_02001d0c(&data_02102c90, 0x20, 2);
            text = func_0202c0c0(0x3ca);
            vram = func_0208df0c();
            func_02094504(0, func_0208e1cc(), 0x600);
            func_02094504(0, vram + 0x220, 0x800);
            width = func_020054a4(text, 0xc);
            func_02004f58((int)&data_02102c90, text, (int)(vram + 0x220), 0x80 - width / 2, 4, 0xc);
            func_02001e94((Dims02001e94 *)&data_02102c90, (unsigned short *)(func_0208e1cc() + 0x4c0), 0x11, 0xf);
        }
        {
            u32 enabled = (*(volatile u32 *)0x04000000 & 0x1f00) >> 8;
            *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0x1f00) | ((enabled | 2) << 8);
        }
    }
    if (*(int *)func_0202c93c() == 0) return;
    if (value != ((int *)func_0202c93c())[1]) {
        char buf[0x20];
        Message msg;
        OS_SPrintf(buf, data_ov004_02209dfc, value);
        Fill32(0, &msg, 0x3c);
        func_020aadf8(msg.text, buf);
        msg.scale = 0x10000;
        msg.step = 0x1000;
        func_02022b74(&msg);
    }
    func_0202cca4(value);
}



