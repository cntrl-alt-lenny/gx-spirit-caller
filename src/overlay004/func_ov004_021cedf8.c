extern char data_ov004_0220b500[];
extern char data_02104bac[];
extern void func_02006110(int *, int *);
extern unsigned int func_02006164(void);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_ov004_021ce9b8(void);
extern void func_ov004_021ce9e4(int);
extern void func_ov004_021cea48(void);
extern void func_ov004_021ceb24(void);
extern int func_ov004_021ced78(void);

void func_ov004_021cedf8(void) {
    char *b = data_ov004_0220b500;
    if (*(int *)(b + 0x5c) != 0) return;
    *(int *)(b + 0x234) = 0;
    if (*(int *)(b + 0x224) == 0) {
        if (func_02006194() || func_0200617c()) {
            int x, y;
            int row;
            func_02006110(&x, &y);
            if (y < 62) return;
            if (y >= 166) return;
            if (x < 46) return;
            if (x >= 210) return;
            row = (y - 62) / 26;
            if ((y - 62) % 26 >= 21) return;
            if (row == 3) row += func_ov004_021ce9b8();
            if (func_02006164()) func_ov004_021ce9e4(row);
            if (*(int *)(b + 0x22c) != row) return;
            *(int *)(b + 0x234) = 1;
            if (func_0200617c()) func_ov004_021cea48();
        } else {
            if (*(unsigned short *)(data_02104bac + 0x54) & 1) {
                func_ov004_021cea48();
            } else {
                unsigned int keys = *(unsigned short *)(data_02104bac + 0x56);
                if (keys & 0xc0) {
                    if (keys & 0x40) {
                        int row = *(int *)(b + 0x22c);
                        func_ov004_021ce9e4(row - 1 - (row == 4));
                    } else if (keys & 0x80) {
                        func_ov004_021ce9e4(*(int *)(b + 0x22c) + 1);
                    }
                }
            }
        }
    } else {
        if (func_ov004_021ced78()) return;
        if (func_02006194() || func_0200617c()) {
            int x, y;
            int row;
            func_02006110(&x, &y);
            if (y < 62) return;
            if (y >= 166) return;
            if (x < 46) return;
            if (x >= 210) return;
            row = (y - 62) / 26;
            if (row == 3) row += func_ov004_021ce9b8();
            if (*(int *)(b + 0x22c) == row) return;
            if (func_0200617c()) func_ov004_021ceb24();
        } else {
            if (*(unsigned short *)(data_02104bac + 0x54) & 2)
                func_ov004_021ceb24();
        }
    }
}

