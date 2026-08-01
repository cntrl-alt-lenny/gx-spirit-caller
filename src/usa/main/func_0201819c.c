/* func_0201819c: system-work state-machine step handler, mode dispatch
 * on state[0x920] (values 1/2/3), with mode 3 running its own inner
 * sub-state dispatch on state[0x924] (values 0/1/4/3/2 + default).
 * Gated at entry by bit 0 of state[0x8d8]. Sibling of func_020147e0 /
 * func_02014af4 (same offsets, same coding idioms).
 */

extern char *GetSystemWork(void);
extern int func_0201b7a0(int *o);
extern int func_02013980(void);
extern int func_02019668(void);
extern void func_0201ab70(int n);
extern int func_02019630(void);
extern void func_02018a30(void);
extern unsigned int func_020195b8(void);
extern void func_0201ab94(int n);
extern void func_0201b774(void);
extern void func_02018a04(unsigned int value);

struct Bit020181d0 {
    unsigned int b0 : 1;
};

void func_0201819c(int *o) {
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
    if (func_0201b7a0(o) != 4) {
        return;
    }
    if (func_02013980() != 2) {
        return;
    }
    *(int *)(state + 0x900) |= 0x1000000;
    o[2] = 0x002b0100;
    return;

mode2:
    if (func_02019668() != 0x4a) {
        return;
    }
    o[2] = 0x002b0200;
    func_0201ab70(6);
    *(int *)(GetSystemWork() + 0x8f8) |= 0x1000;
    func_02018a04(0x14);
    return;

mode3:
    switch (*(int *)(state + 0x924)) {
    case 0:
        break;
    case 1:
        *(int *)(state + 0x924) = 4;
    case 4:
        if (func_02019630() != 0x65) {
            return;
        }
        if (func_02019668() != 6) {
            return;
        }
        o[2] = 0x002b0300;
        func_02018a30();
        x = *(int *)(state + 0x8e0);
        x = (x & ~1) | 1;
        *(int *)(state + 0x8e0) = x;
        break;
    case 3:
        if (((struct Bit020181d0 *)(state + 0x8e0))->b0 != 0) {
            return;
        }
        if (func_020195b8() == 0) {
            o[2] = 0x002b0301;
        } else {
            o[2] = 0x002b0302;
        }
        break;
    case 2:
        o[2] = 0x002b0303;
        func_0201ab94(6);
        func_0201b774();
        *(int *)(state + 0x900) &= ~0x1000000;
        *(int *)(GetSystemWork() + 0x8f8) &= ~0x1000;
        break;
    default:
        break;
    }
}
