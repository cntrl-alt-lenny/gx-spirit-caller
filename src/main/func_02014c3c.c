extern char *GetSystemWork(void);
/* The void forwarder preserves its callee's r0 result, read here. */
extern int func_020139b4(void);
extern void func_02018a38(unsigned int value);
extern void func_02018a64(void);
extern unsigned short func_02019034(void);
/* Original calls supply no arguments to this forwarding thunk. */
extern int func_020190c0();
extern unsigned int func_020191cc(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern void func_0201b708(int arg);
extern void func_0201b730(int arg);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b:1; };
struct Bit1 { unsigned int pad:1; unsigned int b:1; };
void func_02014c3c(int *o) {
    char *sw = GetSystemWork();
    if (((struct Bit0 *)(sw + 0x8d8))->b == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 0: break;
    case 1:
        if ((int)func_020191cc() < 9) return;
        if (func_020139b4() != 2) return;
        if (func_0201b7e0(o) != 4) return;
        if (func_020190c0() == 6 || func_020190c0() == 0 ||
            func_020190c0() == 1 || func_020190c0() == 2) {
            o[2] = 0xd0100;
            *(unsigned int *)(sw + 0x900) |= 0x1000000;
        }
        break;
    case 2:
        if (func_0201b7e0(o) != 5) return;
        o[2] = 0xd0200;
        func_0201b7b4();
        *(unsigned int *)(sw + 0x900) &= ~0x1000000;
        break;
    case 3:
        if (func_0201b7e0(o) != 4) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
        if (func_020139b4() != 2) return;
        o[2] = 0xd0300;
        *(unsigned int *)(sw + 0x900) |= 0x1000000;
        func_02018a38(0x13);
        func_0201b708(0xc);
        break;
    case 4:
        if (func_02019664() != 0x71) return;
        o[2] = 0xd0400;
        func_02018a64();
        break;
    case 5:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 4;
        case 4:
            o[2] = 0xd0500;
            *(unsigned int *)(sw + 0x8e0) = (*(unsigned int *)(sw + 0x8e0) & ~1) | 1;
            break;
        case 3:
            if (((struct Bit0 *)(sw + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0xd0501;
            } else {
                o[2] = 0xd0502;
                if (((struct Bit1 *)(sw + 0x8e0))->b == 0) {
                    *(int *)(sw + 0x920) = 5;
                    *(int *)(sw + 0x924) = 5;
                }
            }
            break;
        case 2:
            o[2] = 0xd0503;
            func_0201b7b4();
            *(unsigned int *)(sw + 0x900) &= ~0x1000000;
            func_0201b730(0xc);
            break;
        }
        break;
    }
}
