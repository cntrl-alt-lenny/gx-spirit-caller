struct Ctx { char pad[0xcec]; int w; };
extern struct Ctx data_ov002_022d016c;
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021bae7c(int a, int b, int c);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021c1e20(int a, int b, int c);
extern int func_ov002_021dec2c(int p, int slot, int q, unsigned short v);
extern void func_ov002_021df680(int arg0, int arg1);
int func_ov002_022547c4(void)
{
    int i, j, mask, p, q;
    if (func_ov002_021bb068(0x12fb) != 0) {
        mask = 0;
        for (i = 0; i < 2; i++) {
            for (j = 0; j < 5; j++) {
                if (func_ov002_021b3ecc(i, j, 0x12ea) != 0) {
                    if (func_ov002_021c1e20(i, j, func_ov002_021bae7c(1-i, 0x12fb, -1) > 0) == 0) {
                        mask |= 1 << (j + i * 16);
                    }
                }
            }
        }
        if (mask != 0) {
            func_ov002_021df680(-1, 0x12fb);
            for (i = 0; i < 2; i++) {
                p = data_ov002_022d016c.w ^ i;
                q = func_ov002_021bae7c(1-p, 0x12fb, -1) > 0;
                for (j = 0; j < 5; j++) {
                    if (mask & (1 << (p * 16 + j))) {
                        func_ov002_021dec2c(p, j, q, 0x12fb);
                    }
                }
            }
            return 1;
        }
    }
    return 0;
}


