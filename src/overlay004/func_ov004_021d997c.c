extern char data_ov004_0220b500[];
typedef struct { char pad[0x54]; unsigned short pressed, repeat; } Input;
extern Input data_02104bac;
extern unsigned int func_02006194(void);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006164(void);
extern void func_02006110(int *out_a, int *out_b);
extern void func_ov004_021d9724(int arg0);
extern void func_ov004_021d9778(void);
extern void func_ov004_021d97c8(void);
extern int func_ov004_021d9810(void);
extern int func_ov004_021d9948(void);
void func_ov004_021d997c(void) {
    char *b = data_ov004_0220b500;
    if (*(int *)(b+0x5c)) return;
    *(int *)(b+0x234) = 0;
    *(int *)(b+0xa0) = 0;
    if (*(int *)(b+0x224) == 0) {
        if (func_02006194() || func_0200617c()) {
            int x,y;
            func_02006110(&x,&y);
            if (y >= 0x58 && y < 0x8c && x >= 0x2e && x < 0xd2) {
                int row = (y-0x58)/26;
                if ((y-0x58)%26 < 21) {
                    if (func_02006164()) func_ov004_021d9724(row);
                    if (*(int *)(b+0x22c) == row) {
                        *(int *)(b+0x234) = 1;
                        if (func_0200617c()) func_ov004_021d9778();
                    }
                }
            }
        } else {
            if (data_02104bac.pressed & 1) func_ov004_021d9778();
            else if (data_02104bac.repeat & 0xc0) {
                if (data_02104bac.repeat & 0x40) func_ov004_021d9724(0);
                else if (data_02104bac.repeat & 0x80) func_ov004_021d9724(1);
            }
        }
        *(int *)(b+0xa0) = func_ov004_021d9810();
    } else {
        if (func_ov004_021d9948()) return;
        if (func_02006194() || func_0200617c()) {
            int x,y;
            func_02006110(&x,&y);
            if (y < 0x58 || y >= 0x8c || x < 0x2e || x >= 0xd2) return;
            if (*(int *)(b+0x22c) == (y-0x58)/26) return;
            if (!func_0200617c()) return;
            func_ov004_021d97c8();
        } else {
            if (!(data_02104bac.pressed & 2)) return;
            func_ov004_021d97c8();
        }
    }
}
