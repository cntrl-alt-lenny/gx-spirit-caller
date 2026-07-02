extern char *GetSystemWork(void);
extern int func_02019000(void);
extern int func_020195b8(void);
extern int func_0201b7a0(int *o);

struct Bit02014b28 {
    unsigned int b0 : 1;
};

void func_02014af4(int *o) {
    char *sw = GetSystemWork();
    int s;
    int x;

    if (((struct Bit02014b28 *)(sw + 0x8d8))->b0 == 0) {
        return;
    }
    if (*(int *)(sw + 0x920) != 1) {
        return;
    }

    s = *(int *)(sw + 0x924);
    if (s == 1) {
        goto state1;
    }
    if (s == 2) {
        goto state2;
    }
    if (s == 3) {
        goto state3;
    }
    return;

state1:
    *(int *)(sw + 0x924) = 3;
state3:
    if (func_0201b7a0(o) != 4) {
        return;
    }
    if ((unsigned int)func_02019000() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) {
        return;
    }
    o[2] = 0x000b0100;
    x = *(int *)(sw + 0x8e0);
    x = (x & ~1) | 1;
    *(int *)(sw + 0x8e0) = x;
    return;

state2:
    if (((struct Bit02014b28 *)(sw + 0x8e0))->b0 != 0) {
        return;
    }
    if (func_020195b8() == 0) {
        o[2] = 0x000b0102;
    } else {
        o[2] = 0x000b0101;
    }
}
