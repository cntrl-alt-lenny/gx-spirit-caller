extern char *GetSystemWork(void);
/* These existing void forwarders preserve a result in r0, read by this caller. */
extern int func_020139c4(void);
extern int func_020190ec(void);
extern int func_020190fc(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern void func_0201aabc(int id);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b:1; };
struct Bit1 { unsigned int pad:1; unsigned int b:1; };
void func_02014630(int *o) {
    char *sw = GetSystemWork();
    if (((struct Bit0 *)(sw + 0x8d8))->b == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 1:
        if (func_020190fc() == 0) return;
        if (func_020139c4() != 5) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
        o[2] = 0x80100;
        func_0201b7b4();
        return;
    case 2:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
        o[2] = 0x80200;
        func_0201aabc(0x7b);
        *(unsigned int *)(sw + 0x900) |= 0x1000000;
        return;
    case 3:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 4;
        case 4:
            if (func_0201b7e0(o) != 3) return;
            if (func_02019664() != 0x7b) return;
            o[2] = 0x80300;
            *(unsigned int *)(sw + 0x8e0) = (*(unsigned int *)(sw + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(sw + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0x80304;
                if (((struct Bit1 *)(sw + 0x8e0))->b == 0) --*(int *)(sw + 0x924);
                func_0201b7b4();
                *(unsigned int *)(sw + 0x900) &= ~0x1000000;
            } else {
                o[2] = 0x80302;
            }
            return;
        case 2:
            o[2] = 0x80303;
            if (((struct Bit1 *)(sw + 0x8e0))->b == 0) {
                *(int *)(sw + 0x920) = 3;
                *(int *)(sw + 0x924) = 5;
            }
            if (((struct Bit1 *)(sw + 0x8e0))->b != 0) return;
            func_02019640(0);
            return;
        }
        break;
    }
}
