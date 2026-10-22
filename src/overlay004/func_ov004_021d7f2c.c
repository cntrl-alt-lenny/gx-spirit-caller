extern char data_ov004_0220b500[];
extern int data_ov004_022915e8;
extern char data_02104bac[];
extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02037208(int a0, int a1, int a2, int a3);
extern void func_ov004_021d7440(int arg0);
#define F(off) (*(int *)(b + (off)))
#define KEYS (*(unsigned short *)(data_02104bac + 0x54))
static inline int locked(void) { int result; if (data_ov004_022915e8 != 0) result = 1; else result = 0; return result; }
void func_ov004_021d7f2c(void) {
    char *b = data_ov004_0220b500;
    int x, y;
    if (F(0x88) != 0) return;
    switch (data_ov004_022915e8 != 0) { case 0: break; default: return; }
    if (F(0x90) < 0) F(0x90) = 0;
    F(0x60) = 0;
    if (func_02006194() != 0 || func_0200617c() != 0) {
        func_02006110(&x, &y);
        F(0x60) = 1;
        if (x >= 4 && x < 0xca && y >= 8 && y < 0x94 && (y - 8) % 35 < 32) {
            F(0x60) = 0;
            F(0x90) = (y - 8) / 35;
            if (x < 0x19 || x >= 0xb5) {
                F(0x9c) = x < 0x21 ? -1 : 1;
                if (func_0200617c() != 0) {
                    if (F(0x90) != 3 || F(0x3cc8) == 0) {
                        func_02037208(0x38, -1, 0, 1);
                        ((int *)(b + 0x3c94))[F(0x90)] ^= 1;
                        func_ov004_021d7440(F(0x90));
                    }
                }
            }
        }
        if (x >= 0xd0 && x < 0xfd && y >= 0x3b && y < 0xa3 && (y - 7) % 52 < 45) {
            F(0x3c8c) = (y - 7) / 52;
            if (func_0200617c() != 0) {
                func_02037208(0x3a, -1, 0, 1);
                F(0x88) = (y - 7) / 52 + 1;
            }
        }
        if (x >= 0x18 && x < 0xb6 && y >= 0x96 && y < 0xae) {
            F(0x60) = 0;
            F(0x90) = 4;
            F(0x9c) = 1;
            if (func_0200617c() != 0) {
                func_02037208(0x3a, -1, 0, 1);
                F(0x88) = 1;
            }
        }
        if (x >= 0xe0 && x < 0xfa && y >= 0xa4 && y < 0xbe) {
            F(0xa0) = 1;
            if (func_0200617c() != 0) {
                func_02037208(0x42, -1, 0, 1);
                F(0xa0) = 1;
                F(0x54)--;
                F(0x58) = -256;
            }
        }
    } else {
        if (F(0x90) != 0 && (KEYS & 0x40)) {
            F(0x90)--;
            func_02037208(0x38, -1, 0, 1);
        } else if (F(0x90) < 4 && (KEYS & 0x80)) {
            F(0x90)++;
            func_02037208(0x38, -1, 0, 1);
        } else if (KEYS & 0x30) {
            if (F(0x90) == 3 && F(0x3cc8) != 0) return;
            func_02037208(0x38, -1, 0, 1);
            F(0x9c) = (KEYS & 0x20) ? -1 : 1;
            ((int *)(b + 0x3c94))[F(0x90)] ^= 1;
            func_ov004_021d7440(F(0x90));
        } else if (F(0x90) == 4 && (KEYS & 1)) {
            func_02037208(0x3a, -1, 0, 1);
            F(0x88) = 1;
        } else if (KEYS & 2) {
            func_02037208(0x42, -1, 0, 1);
            F(0xa0) = 1;
            F(0x54)--;
            F(0x58) = -256;
        }
    }
}




