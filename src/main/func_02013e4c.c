extern char *GetSystemWork(void);
/* These existing void forwarders preserve the result in r0 read by this caller. */
extern int func_020139b4(void);
extern int func_020139c4(void);
extern int func_020190ec(void);
extern int func_020190fc(void);
extern void func_02018a38(unsigned int value);
extern void func_02018a64(void);
extern int func_020195b8(int a0, int a1);
extern unsigned int func_020195ec(void);
extern int func_0201969c(void);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b:1; };
void func_02013e4c(int *o) {
    char *sw = GetSystemWork();
    if (((struct Bit0 *)(sw + 0x8d8))->b == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 1:
        if (func_020195b8(13, 0) <= 0) return;
        if (func_020195b8(14, 0) <= 0) return;
        if (func_020190fc() == 0) return;
        if (func_020139c4() == 5) o[2] = 0x40100;
        return;
    case 2: o[2] = 0x40200; return;
    case 3: o[2] = 0x40300; return;
    case 4: o[2] = 0x40400; return;
    case 5:
        if (func_0201b7e0(o) != 4) return;
        if (func_020139b4() != 2) return;
        *(unsigned int *)(sw + 0x900) |= 0x1000000;
        o[2] = 0x40500;
        func_02018a38(19);
        return;
    case 6:
        if (func_0201969c() == 0x42) o[2] = 0x40600;
        return;
    case 7:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 4;
        case 4:
            if (func_0201969c() != 0x40) return;
            o[2] = 0x40700;
            func_02018a64();
            *(unsigned int *)(sw + 0x8e0) = (*(unsigned int *)(sw + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(sw + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) { o[2] = 0x40701; return; }
            else { o[2] = 0x40702; return; }
            return;
        case 2:
            o[2] = 0x40703;
            *(unsigned int *)(sw + 0x900) &= ~0x1000000;
            return;
        }
        break;
    case 8:
        if (func_0201b7e0(o) == 4) o[2] = 0x40800;
        return;
    case 9:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        o[2] = 0x40900;
        func_0201b7b4();
        return;
    }
}



