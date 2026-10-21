typedef unsigned int u32;
typedef unsigned short u16;
struct Mtx22 { int _[4]; };
extern void func_0208b0f0(int, int, int);
extern void func_0208e318(int *, int, int, int, int);
extern void func_0208e2f4(volatile u16 *, int, int);
extern void G2x_SetBGyAffine_(u32, const struct Mtx22 *, int, int, int, int);
/* The original passes two arguments to this no-prototype SDK stub. */
extern void func_ov002_022aacbc();
extern char data_ov002_022d0fe4[];
extern char data_ov002_022d1410[];
extern struct { int f0; u32 :3; u32 mode:2; u32 :27; } data_02104f4c;
void func_ov002_022a4a30(int *p) {
    struct Mtx22 m;
    int mode, x, y;
    mode = (int)data_02104f4c.mode;
    x = mode % 2 ? -12 : 12;
    y = mode / 2 ? 72 : 88;
    if (p[2] < 16) {
        int left, scale;
        u32 bits = (*(volatile u32 *)0x04001000 & 0x1f00) >> 8;
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((bits | 8) << 8);
        left = 16 - ++p[2];
        scale = 0x1000 - (left << 10) / 8;
        func_0208e318((int *)0x04001050, 8, 63, p[2], left);
        func_0208b0f0((int)&m, scale, scale);
        G2x_SetBGyAffine_((u32)data_ov002_022d0fe4, &m, 128, 16, -x, -y);
        p[3] = 0;
    } else if (p[2] == 16) {
        if (p[3] == 0) {
            func_0208b0f0((int)&m, 0x1000, 0x1000);
            G2x_SetBGyAffine_((u32)data_ov002_022d0fe4, &m, 128, 16, -x, -y);
            *(volatile u16 *)0x0400100e &= ~3;
        }
        ++p[3];
        if (p[1] != 3) {
            p[2] += p[3] >= 16;
            *(volatile u16 *)0x04001050 = 0;
        } else {
            p[2] += p[3] >= 32;
            if (p[3] <= 16) func_0208e2f4((volatile u16 *)0x04001050, 8, 16-p[3]);
        }
    } else if (p[2] < 24) {
        int left;
        left = (24 - ++p[2]) * 2;
        func_0208e318((int *)0x04001050, 8, 63, left, 16-left);
    } else {
        u32 bits = (*(volatile u32 *)0x04001000 & 0x1f00) >> 8;
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((bits & ~8) << 8);
        *(volatile u16 *)0x04001050 = 0;
        func_ov002_022aacbc(data_ov002_022d1410, p[1]);
        p[0] = 0;
    }
}
