extern char *GetSystemWork(void);
/* These forwarders leave their final callee's result in r0, consumed here. */
extern int func_020139c4(void);
extern int func_020190ec(void);
extern int func_020190fc(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020191cc(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern void func_0201a430(unsigned int value);
extern void func_0201aabc(int id);
extern void func_0201aaf4(int unused0);
extern void func_0201ab5c(unsigned int value);
extern char *func_0201b75c(void);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bits { unsigned int b0:1; unsigned int b1:1; };
void func_02015f7c(int *o) {
    char *sw = GetSystemWork();
    int *flags;
    int x;
    if (((struct Bits *)(sw + 0x8d8))->b0 == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 0: break;
    case 1:
        if (func_020190fc() == 0) return;
        if (func_020139c4() != 5) return;
        if ((int)func_020191cc() >= 15) o[2] = 0x00170100;
        break;
    case 2:
        o[2] = 0x00170200;
        func_0201b7b4();
        break;
    case 3:
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        o[2] = 0x00170300;
        func_0201aabc(0x7b);
        flags = (int *)func_0201b75c();
        *flags |= 0x2000;
        break;
    case 4:
        o[2] = 0x00170400;
        *(int *)(sw + 0x900) |= 0x1000000;
        break;
    case 5:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 4;
        case 4:
            if (func_0201b7e0(o) != 3) return;
            if (func_02019664() != 0x7b) return;
            o[2] = 0x00170500;
            x = *(int *)(sw + 0x8e0);
            x = (x & ~1) | 1;
            *(int *)(sw + 0x8e0) = x;
            flags = (int *)func_0201b75c();
            *flags &= ~0x2000;
            break;
        case 3:
            if (((struct Bits *)(sw + 0x8e0))->b0 != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0x00170504;
                if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
                    *(int *)(sw + 0x924) -= 1;
                }
                *(int *)(sw + 0x900) &= ~0x1000000;
                func_0201aaf4(0x7b);
            } else {
                o[2] = 0x00170502;
            }
            break;
        case 2:
            o[2] = 0x00170503;
            if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
                *(int *)(sw + 0x920) = 5;
                *(int *)(sw + 0x924) = 5;
            }
            break;
        }
        break;
    case 6:
        o[2] = 0x00170600;
        func_0201b7b4();
        func_0201ab5c(1);
        func_0201a430(1);
        break;
    }
}
