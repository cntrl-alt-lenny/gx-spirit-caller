extern char *GetSystemWork(void);
/* These forwarders preserve r0, which this caller consumes as a result. */
extern int func_020139b4(void);
extern int func_020139c4(void);
extern int func_020190ec(void);
extern void func_02018a38(unsigned int value);
extern void func_02018a64(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern void func_0201b708(int arg);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bits { unsigned int b0:1; };
void func_02015494(int *o) {
    char *sw = GetSystemWork();
    int x;
    if (((struct Bits *)(sw + 0x8d8))->b0 == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 0: break;
    case 1:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
        o[2] = 0x00110100;
        *(int *)(sw + 0x900) |= 0x1000000;
        break;
    case 2:
        if (func_020139b4() != 2) return;
        if (func_0201b7e0(o) != 4) return;
        o[2] = 0x00110200;
        func_0201b708(4);
        func_02018a38(0x13);
        break;
    case 3:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x69) return;
            o[2] = 0x00110300;
            func_02018a64();
            x = *(int *)(sw + 0x8e0);
            x = (x & ~1) | 1;
            *(int *)(sw + 0x8e0) = x;
            break;
        case 3:
            if (((struct Bits *)(sw + 0x8e0))->b0 != 0) return;
            if (func_020195ec() == 0) o[2] = 0x00110301;
            else o[2] = 0x00110302;
            break;
        case 2:
            o[2] = 0x00110303;
            func_0201b7b4();
            *(int *)(sw + 0x900) &= ~0x1000000;
            break;
        }
        break;
    case 4:
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
        if (func_020139c4() == 5) o[2] = 0x00110400;
        break;
    }
}
