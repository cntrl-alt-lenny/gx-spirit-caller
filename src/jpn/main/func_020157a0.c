extern char *GetSystemWork(void);
extern int func_02013990(void);
extern void func_02018a04(int v);
extern void func_02018a30(void);
extern int func_020190b8(void);
extern int func_020195b8(void);
extern int func_0201960c(int v);
extern int func_02019668(void);
extern void func_0201b774(void);

struct Bit020157d4 {
    unsigned int b0 : 1;
    unsigned int b1 : 1;
};

void func_020157a0(int *o) {
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
    if (func_020190b8() == 0) {
        return;
    }
    if (func_02013990() == 5) {
        o[2] = 0x00130100;
    }
    return;

state2:
    o[2] = 0x00130200;
    func_02018a04(0x13);
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
        if (func_02019668() == 0xf) {
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
        if (func_020195b8() != 0) {
            goto nonzero;
        }
        o[2] = 0x00130305;
        if (((struct Bit020157d4 *)(sw + 0x8e0))->b1 == 0) {
            *(int *)(sw + 0x924) = *(int *)(sw + 0x924) - 1;
        }
        func_0201b774();
        x = *(int *)(sw + 0x900);
        x &= ~0x1000000;
        *(int *)(sw + 0x900) = x;
        func_02018a30();
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
        func_0201960c(0);
        break;
    default:
        break;
    }
}
