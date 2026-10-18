typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned char u8;
extern char data_ov002_022cf16c[];
extern int func_ov002_021b947c(int idx);
extern int func_ov002_021bc618(int a);
extern int func_ov002_021c33e4(int a, int b, int c);
extern int func_ov002_021ca2b8(int a);
extern int func_ov002_0227adb8(int a, int b, int c, int d);

typedef struct {
    u16 f0;
    u16 bit0 : 1;
    u16 pad2 : 15;
    u16 f4;
    u16 lo6 : 8;
    u16 kind : 8;
    u16 f8;
} Card;

int func_ov002_0221da74(Card *c) {
    if (func_ov002_021ca2b8(c->bit0) == 0)
        return 0;
    if (func_ov002_021bc618(c->bit0) == 0)
        return 0;
    if (c->kind == 1) {
        u32 v = func_ov002_021b947c(c->f8);
        u8 b0 = v;
        u8 b1 = (u16)v >> 8;
        u16 hi = v >> 16;
        if (b1 == 0xe) {
            if (func_ov002_021c33e4(c->bit0, b0, hi) != 0) {
                func_ov002_0227adb8(c->bit0, (b0 & 1) * 0x868 + (int)data_ov002_022cf16c + 0x418 + (hi << 2), 1, 0);
            }
        }
    }
    return 0;
}
