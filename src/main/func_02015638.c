extern char *GetSystemWork(void);
extern void func_0200a26c(int v);
extern int func_020139c4(void);
extern int func_020190ec(void);
extern int func_020191cc(void);
extern int func_020195b8(int a, int b);
extern int func_020195ec(void);
extern int func_02019640(int v);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201abb0(int v);
extern void func_0201abd4(int v);
extern void func_0201b7b4(void);

struct Bit02015638 {
    unsigned int b0 : 1;
    unsigned int b1 : 1;
};

void func_02015638(int *o) {
    char *sw = GetSystemWork();
    int x;

    if (((struct Bit02015638 *)(sw + 0x8d8))->b0 == 0) {
        return;
    }
    if (*(int *)(sw + 0x920) != 1) {
        return;
    }

    switch (*(int *)(sw + 0x924)) {
    case 0:
        break;
    case 1:
        *(int *)(sw + 0x924) = 4;
    case 4:
        if (func_020191cc() >= 0xb &&
            func_020195b8(0xf, 0) >= 1 &&
            func_020190ec() != 0 &&
            func_020139c4() >= 5) {
            func_0201abb0(7);
            if (((struct Bit02015638 *)(sw + 0x8e0))->b1 == 0) {
                func_0200a26c(8);
            }
        } else {
            func_0201abd4(7);
        }
        if (func_02019664() != 0x65) {
            return;
        }
        if (func_0201969c() != 7) {
            return;
        }
        o[2] = 0x00120100;
        x = *(int *)(sw + 0x8e0);
        x = (x & ~1) | 1;
        *(int *)(sw + 0x8e0) = x;
        break;
    case 3:
        if (((struct Bit02015638 *)(sw + 0x8e0))->b0 != 0) {
            return;
        }
        if (func_020195ec() != 0) {
            goto nonzero;
        }
        o[2] = 0x00120104;
        if (((struct Bit02015638 *)(sw + 0x8e0))->b1 == 0) {
            *(int *)(sw + 0x924) = *(int *)(sw + 0x924) - 1;
        }
        func_0201b7b4();
        func_0201abd4(7);
        break;
nonzero:
        o[2] = 0x00120102;
        break;
    case 2:
        o[2] = 0x00120103;
        if (((struct Bit02015638 *)(sw + 0x8e0))->b1 == 0) {
            *(int *)(sw + 0x920) = 1;
            *(int *)(sw + 0x924) = 5;
        }
        if (((struct Bit02015638 *)(sw + 0x8e0))->b1 != 0) {
            return;
        }
        func_02019640(0);
        break;
    default:
        break;
    }
}
