typedef unsigned short u16;
typedef unsigned char u8;

extern unsigned int data_ov002_022d016c[];
extern char data_ov002_022cf1a4[];

extern int func_ov002_0223df38(u16 *p, int a, int b);
extern int func_ov002_0223de94(u16 *p, int a);
extern int func_ov002_021d5a08(u16 *p, int a, int b, int c, int d, int e);

int func_ov002_0223b228(u16 *p) {
    unsigned int flags = data_ov002_022d016c[0xd0 / 4];
    if (flags & 1) {
        return 0;
    }
    if (!((flags >> 1) & 1)) {
        return 0;
    }
    if (func_ov002_0223df38(p, 0, 0)) {
        int r0 = func_ov002_0223de94(p, 0);
        int lo = (u8)r0;
        u16 r = r0;
        int hi = (u8)(r >> 8);
        if (*(u16 *)(data_ov002_022cf1a4 + (lo & 1) * 0x868 + hi * 0x14) != 0) {
            func_ov002_021d5a08(p, lo, hi, *p, 4, 0);
        }
    }
    return 0;
}
