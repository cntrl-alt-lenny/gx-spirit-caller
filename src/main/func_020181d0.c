/* func_020181d0: system-work state-machine step handler, mode dispatch
 * on state[0x920] (values 1/2/3), with mode 3 running its own inner
 * sub-state dispatch on state[0x924] (values 0/1/4/3/2 + default).
 * Gated at entry by bit 0 of state[0x8d8]. Sibling of func_02014814 /
 * func_02014b28 (same offsets, same coding idioms).
 */

extern char *GetSystemWork(void);
extern int func_0201b7e0(int *o);
extern int func_020139b4(void);
extern int func_0201969c(void);
extern void func_0201abb0(int n);
extern int func_02019664(void);
extern void func_02018a64(void);
extern unsigned int func_020195ec(void);
extern void func_0201abd4(int n);
extern void func_0201b7b4(void);
extern void func_02018a38(unsigned int value);

struct Bit020181d0 {
    unsigned int b0 : 1;
};

void func_020181d0(int *o) {
    char *state = GetSystemWork();
    int mode;
    int x;

    if (((struct Bit020181d0 *)(state + 0x8d8))->b0 == 0) {
        return;
    }

    mode = *(int *)(state + 0x920);
    if (mode == 1) {
        goto mode1;
    }
    if (mode == 2) {
        goto mode2;
    }
    if (mode == 3) {
        goto mode3;
    }
    return;

mode1:
    if (func_0201b7e0(o) != 4) {
        return;
    }
    if (func_020139b4() != 2) {
        return;
    }
    *(int *)(state + 0x900) |= 0x1000000;
    o[2] = 0x002b0100;
    return;

mode2:
    if (func_0201969c() != 0x4a) {
        return;
    }
    o[2] = 0x002b0200;
    func_0201abb0(6);
    *(int *)(GetSystemWork() + 0x8f8) |= 0x1000;
    func_02018a38(0x14);
    return;

mode3:
    switch (*(int *)(state + 0x924)) {
    case 0:
        break;
    case 1:
        *(int *)(state + 0x924) = 4;
    case 4:
        if (func_02019664() != 0x65) {
            return;
        }
        if (func_0201969c() != 6) {
            return;
        }
        o[2] = 0x002b0300;
        func_02018a64();
        x = *(int *)(state + 0x8e0);
        x = (x & ~1) | 1;
        *(int *)(state + 0x8e0) = x;
        break;
    case 3:
        if (((struct Bit020181d0 *)(state + 0x8e0))->b0 != 0) {
            return;
        }
        if (func_020195ec() == 0) {
            o[2] = 0x002b0301;
        } else {
            o[2] = 0x002b0302;
        }
        break;
    case 2:
        o[2] = 0x002b0303;
        func_0201abd4(6);
        func_0201b7b4();
        *(int *)(state + 0x900) &= ~0x1000000;
        *(int *)(GetSystemWork() + 0x8f8) &= ~0x1000;
        break;
    default:
        break;
    }
}
