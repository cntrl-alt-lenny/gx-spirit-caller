extern char *GetSystemWork(void);
/* The void forwarder leaves its final callee result in r0, tested here. */
extern int func_020139b4(void);
extern void func_02018a38(unsigned int value);
extern void func_02018a64(void);
extern unsigned short func_02019034(void);
extern int func_020195b8(int a0, int a1);
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201abb0(int n);
extern void func_0201abd4(int n);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b:1; };
struct Bit1 { unsigned int pad:1; unsigned int b:1; };
void func_0201406c(int *o) {
    char *sw = GetSystemWork();
    if (((struct Bit0 *)(sw + 0x8d8))->b == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 1:
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 3)) return;
        if (func_020195b8(0x42, 0) < 2) return;
        if (func_020195b8(0x41, 0) < 2) return;
        if (func_0201b7e0(o) != 4) return;
        if (func_020139b4() != 2) return;
        func_0201abb0(1);
        o[2] = 0x50100;
        *(unsigned int *)(sw + 0x900) |= 0x1000000;
        func_02018a38(19);
        return;
    case 2:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 1) return;
            o[2] = 0x50200;
            func_02018a64();
            *(unsigned int *)(sw + 0x8e0) = (*(unsigned int *)(sw + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(sw + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0x50204;
                if (((struct Bit1 *)(sw + 0x8e0))->b == 0) --*(int *)(sw + 0x924);
                func_0201b7b4();
                *(unsigned int *)(sw + 0x900) &= ~0x1000000;
                func_0201abd4(1);
            } else {
                o[2] = 0x50202;
            }
            return;
        case 2:
            o[2] = 0x50203;
            if (((struct Bit1 *)(sw + 0x8e0))->b == 0) {
                *(int *)(sw + 0x920) = 2;
                *(int *)(sw + 0x924) = 5;
            }
            if (((struct Bit1 *)(sw + 0x8e0))->b == 0) func_02019640(0);
            func_02018a38(19);
            return;
        }
        break;
    case 3:
        o[2] = 0x50300;
        return;
    case 4:
        if (func_020195b8(8, 0) < 2) return;
        if (func_020195b8(9, 0) < 2) return;
        if (func_0201b7e0(o) != 4) return;
        o[2] = 0x50400;
        func_0201b7b4();
        return;
    }
}
