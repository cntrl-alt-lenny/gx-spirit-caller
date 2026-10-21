extern char *GetSystemWork(void);
/* The existing void forwarder leaves its callee's result in r0, read here. */
extern int func_020139c4(void);
extern void func_02018a38(unsigned int value);
extern void func_02018a64(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b:1; };
struct Bit1 { unsigned int pad:1; unsigned int b:1; };
void func_02014920(int *o) {
    char *sw = GetSystemWork();
    if (((struct Bit0 *)(sw + 0x8d8))->b == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 0: break;
    case 1:
        if (func_020139c4() != 0) return;
        if (func_0201b7e0(o) == 4) o[2] = 0xa0100;
        break;
    case 2:
        if (func_0201b7e0(o) == 5) o[2] = 0xa0200;
        break;
    case 3:
        if (func_02019664() == 0x67) o[2] = 0xa0300;
        break;
    case 4:
        o[2] = 0xa0400;
        func_02018a38(0x13);
        break;
    case 5:
        o[2] = 0xa0500;
        *(unsigned int *)(sw + 0x900) |= 0x1000000;
        break;
    case 6:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 5;
        case 5:
            if (func_0201969c() != 0x2d) return;
            o[2] = 0xa0600;
            func_02018a64();
            *(unsigned int *)(sw + 0x8e0) = (*(unsigned int *)(sw + 0x8e0) & ~1) | 1;
            break;
        case 4:
            if (((struct Bit0 *)(sw + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0xa0601;
                if (((struct Bit1 *)(sw + 0x8e0))->b == 0) --*(int *)(sw + 0x924);
            } else {
                o[2] = 0xa0602;
            }
            break;
        case 3:
            if (func_0201b7e0(o) != 4) return;
            o[2] = 0xa0603;
            if (((struct Bit1 *)(sw + 0x8e0))->b == 0) {
                *(int *)(sw + 0x920) = 5;
                *(int *)(sw + 0x924) = 1;
            }
            break;
        case 2:
            o[2] = 0xa0604;
            *(unsigned int *)(sw + 0x900) &= ~0x1000000;
            break;
        }
        break;
    case 7:
        o[2] = 0xa0700;
        func_0201b7b4();
        break;
    }
}
