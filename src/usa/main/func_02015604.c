extern char *GetSystemWork(void);
extern void func_0200a250(int v);
extern int func_02013990(void);
extern int func_020190b8(void);
extern int func_02019198(void);
extern int func_02019584(int a, int b);
extern int func_020195b8(void);
extern int func_0201960c(int v);
extern int func_02019630(void);
extern int func_02019668(void);
extern void func_0201ab70(int v);
extern void func_0201ab94(int v);
extern void func_0201b774(void);

struct Bit02015638 {
    unsigned int b0 : 1;
    unsigned int b1 : 1;
};

void func_02015604(int *o) {
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
        if (func_02019198() >= 0xb &&
            func_02019584(0xf, 0) >= 1 &&
            func_020190b8() != 0 &&
            func_02013990() >= 5) {
            func_0201ab70(7);
            if (((struct Bit02015638 *)(sw + 0x8e0))->b1 == 0) {
                func_0200a250(8);
            }
        } else {
            func_0201ab94(7);
        }
        if (func_02019630() != 0x65) {
            return;
        }
        if (func_02019668() != 7) {
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
        if (func_020195b8() != 0) {
            goto nonzero;
        }
        o[2] = 0x00120104;
        if (((struct Bit02015638 *)(sw + 0x8e0))->b1 == 0) {
            *(int *)(sw + 0x924) = *(int *)(sw + 0x924) - 1;
        }
        func_0201b774();
        func_0201ab94(7);
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
        func_0201960c(0);
        break;
    default:
        break;
    }
}
