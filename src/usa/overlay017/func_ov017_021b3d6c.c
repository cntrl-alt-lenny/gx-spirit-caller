extern char data_02104e6c[];
extern char data_ov017_021b8794[];
extern char data_ov017_021b8510[];

extern void func_020371b8(int a, int b, int c, int d);
extern void func_ov017_021b4470(void *a, int b);
extern unsigned int func_0208e0c4(void);
extern unsigned int func_0208dfb8(void);
extern void func_02094410(int a, unsigned int b, int c);

#define REG_1000 (*(volatile unsigned int *)0x04001000)
#define REG_1050 (*(volatile unsigned short *)0x04001050)

int func_ov017_021b3d6c(char *a) {
    if (*(int *)(a + 0xc) == 4) {
        func_020371b8(0x42, -1, 0, 1);
        return 1;
    }
    if (*(int *)(a + 0xc) == 2) {
        if (((*(unsigned int *)(data_02104e6c + 0xa64) & 0x1f00000) >> 20) == 0
            && *(unsigned int *)(data_02104e6c + 0xa74) == 0) {
            func_020371b8(0x43, -1, 0, 1);
            goto ret0;
        }
    }
    if (*(int *)(a + 0xc) == 1) {
        unsigned char v = *(unsigned char *)(data_ov017_021b8794 + 0x1ce);
        if (v == 6 || v == 0xb) {
            func_020371b8(0x43, -1, 0, 1);
            goto ret0;
        }
    }

    {
        unsigned int field = (REG_1000 & 0x1f00) >> 8;
        field &= ~0x6;
        REG_1000 = (REG_1000 & ~0x1f00) | (field << 8);
    }

    func_02094410(0, func_0208e0c4(), 0x800);
    func_02094410(0, func_0208dfb8(), 0x800);

    REG_1050 = 0;
    func_ov017_021b4470(data_ov017_021b8510, *(int *)(a + 0xc));
    *(int *)(a + 0x4) = 1;
    func_020371b8(0x3a, -1, 0, 1);
ret0:
    return 0;
}
