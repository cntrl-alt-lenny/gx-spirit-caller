typedef unsigned int u32;
typedef unsigned short u16;
struct Mtx22 { int _[4]; };
extern void func_0208b0f0(int, int, int);
extern void func_0208e318(int *, int, int, int, int);
extern void G2x_SetBGyAffine_(u32, const struct Mtx22 *, int, int, int, int);
extern char data_ov002_022d0fd4[];
extern char data_ov002_022d0fe4[];
extern struct { int f0; u32 :3; u32 mode:2; u32 :27; } data_02104f4c;
void func_ov002_022a4ed8(int *p) {
    struct Mtx22 m1, m2;
    int mode, x, y;
    u32 bits;
    mode = (int)data_02104f4c.mode;
    x = mode % 2 ? -12 : 12;
    y = mode / 2 ? 72 : 88;
    ++p[2];
    bits = ((*(volatile u32 *)0x04001000 & 0x1f00) >> 8) & ~12;
    if (p[2] < 8) {
        int scale = ((8-p[2]) << 12) / 8;
        func_0208b0f0((int)&m1, 0x1000, 0x1000);
        func_0208b0f0((int)&m2, 0x1000+scale, 0x1000+scale);
        func_0208e318((int *)0x04001050, 8, 63, p[2]*2, 16-p[2]*2);
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((bits|8)<<8);
    } else if (p[2] < 16) {
        func_0208b0f0((int)&m1, 0x1000, 0x1000);
        func_0208b0f0((int)&m2, 0x1000, 0x1000);
        *(volatile u16 *)0x04001050 = 0;
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((bits|8)<<8);
    } else if (p[2] < 32) {
        int elapsed;
        func_0208b0f0((int)&m1, 0x1000, 0x1000);
        func_0208b0f0((int)&m2, 0x1000, 0x1000);
        elapsed = p[2]-16;
        func_0208e318((int *)0x04001050, 4, 63, elapsed, 16-elapsed);
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((bits|12)<<8);
    } else if (p[2] < 40) {
        func_0208b0f0((int)&m1, 0x1000, 0x1000);
        func_0208b0f0((int)&m2, 0x1000, 0x1000);
        *(volatile u16 *)0x04001050 = 0;
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((bits|4)<<8);
    } else if (p[2] < 48) {
        int scale = ((p[2]-40) << 12) / 8;
        int left;
        func_0208b0f0((int)&m1, 0x1000+scale, 0x1000+scale);
        func_0208b0f0((int)&m2, 0x1000, 0x1000);
        left = 16-(p[2]-40)*2;
        func_0208e318((int *)0x04001050, 4, 63, left, 16-left);
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((bits|4)<<8);
    } else {
        func_0208b0f0((int)&m1, 0x1000, 0x1000);
        func_0208b0f0((int)&m2, 0x1000, 0x1000);
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | (bits<<8);
        p[0] = 0;
    }
    G2x_SetBGyAffine_((u32)data_ov002_022d0fd4, &m1, 128, 16, -x, -y);
    G2x_SetBGyAffine_((u32)data_ov002_022d0fe4, &m2, 128, 16, -x, -y);
}

