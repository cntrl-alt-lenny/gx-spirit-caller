typedef unsigned int u32;
extern int func_0202d9f8(void);
extern void func_0208e890(void);
extern void func_0208ecd8(int, int, int, int, int, int, int, int, void *);
void func_ov004_021d03ec(int a) {
    volatile u32 *p = (volatile u32 *)0x04000444;
    if (!func_0202d9f8()) return;
    func_0208e890();
    func_0208ecd8(0, 0xc0000, 0, 0x100000, -0x400000, 0x400000, 0x400000, 1, 0);
    p[0] = 0;
    p[11] = 0x33000;
    p[11] = 0x60000;
    p[11] = 0x1000;
    p[10] = a << 7;
    p[10] = 0x80000;
    p[10] = 0x1000;
    *(volatile u32 *)0x04000440 = 3;
    p[4] = 0;
    *(volatile u32 *)0x04000440 = 2;
    p[31] = 0x4210ffff;
    p[32] = 0x4210;
    p[25] = 0x56402000;
    p[26] = 0x100;
    p[24] = 0x1f00c0;
    p[47] = 1;
    p[17] = 0;
    p[18] = 0xf800f800;
    p[18] = 0;
    p[17] = 0x800;
    p[18] = 0xf8000800;
    p[18] = 0;
    p[17] = 0x08000800;
    p[18] = 0x08000800;
    p[18] = 0;
    p[17] = 0x08000000;
    p[18] = 0x0800f800;
    p[18] = 0;
    p[48] = 0;
    p[1] = 1;
}


