extern char *GetSystemWork(void);
extern int func_020139c4(void);
extern void func_02018a38(int v);
extern void func_02018a64(void);
extern int func_020190ec(void);
extern int func_020195ec(void);
extern int func_02019640(int v);
extern int func_0201969c(void);
extern void func_0201b7b4(void);

struct Bit020157d4 {
    unsigned int b0 : 1;
    unsigned int b1 : 1;
};

void func_020157d4(int *o) {
    char *sw = GetSystemWork();
    int state;
    int x;

    if (((struct Bit020157d4 *)(sw + 0x8d8))->b0 == 0) {
        return;
    }

    state = *(int *)(sw + 0x920);
    if (state == 1) {
        goto state1;
    }
    if (state == 2) {
        goto state2;
    }
    if (state == 3) {
        goto state3;
    }
    return;

state1:
    if (func_020190ec() == 0) {
        return;
    }
    if (func_020139c4() == 5) {
        o[2] = 0x00130100;
    }
    return;

state2:
    o[2] = 0x00130200;
    func_02018a38(0x13);
    x = *(int *)(sw + 0x900);
    x |= 0x1000000;
    *(int *)(sw + 0x900) = x;
    return;

state3:
    switch (*(int *)(sw + 0x924)) {
    case 0:
        break;
    case 1:
        *(int *)(sw + 0x924) = 5;
    case 5:
        if (func_0201969c() == 0xf) {
            o[2] = 0x00130300;
        }
        break;
    case 4:
        o[2] = 0x00130301;
        x = *(int *)(sw + 0x8e0);
        x = (x & ~1) | 1;
        *(int *)(sw + 0x8e0) = x;
        break;
    case 3:
        if (((struct Bit020157d4 *)(sw + 0x8e0))->b0 != 0) {
            return;
        }
        if (func_020195ec() != 0) {
            goto nonzero;
        }
        o[2] = 0x00130305;
        if (((struct Bit020157d4 *)(sw + 0x8e0))->b1 == 0) {
            *(int *)(sw + 0x924) = *(int *)(sw + 0x924) - 1;
        }
        func_0201b7b4();
        x = *(int *)(sw + 0x900);
        x &= ~0x1000000;
        *(int *)(sw + 0x900) = x;
        func_02018a64();
        break;
nonzero:
        o[2] = 0x00130303;
        break;
    case 2:
        o[2] = 0x00130304;
        if (((struct Bit020157d4 *)(sw + 0x8e0))->b1 == 0) {
            *(int *)(sw + 0x920) = 3;
            *(int *)(sw + 0x924) = 6;
        }
        if (((struct Bit020157d4 *)(sw + 0x8e0))->b1 != 0) {
            return;
        }
        func_02019640(0);
        break;
    default:
        break;
    }
}
