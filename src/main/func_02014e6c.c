extern char *GetSystemWork(void);
/* These forwarders preserve r0 from their final call; this caller reads it. */
extern int func_020139c4(void);
extern int func_020190ec(void);
extern unsigned short func_02019034(void);
extern int func_020190fc(void);
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern void func_0201aabc(int id);
extern void func_0201aaf4(int unused0);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
extern unsigned func_ov000_021ae4ac(void);
struct Bit0 { unsigned int b:1; };
struct Bit1 { unsigned int pad:1; unsigned int b:1; };
void func_02014e6c(int *o) {
    char *sw = GetSystemWork();
    if (((struct Bit0 *)(sw + 0x8d8))->b == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 0: break;
    case 1:
        if (func_020190fc() == 0) return;
        if (func_020139c4() == 5) o[2] = 0xe0100;
        break;
    case 2:
        o[2] = 0xe0200;
        func_0201b7b4();
        break;
    case 3:
        switch (*(int *)(sw + 0x924)) {
        case 1: *(int *)(sw + 0x924) = 3;
        case 3:
            if (func_020190ec() == 0) return;
            if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
            if (func_020139c4() == 5) o[2] = 0xe0300;
            break;
        case 2: o[2] = 0xe0301; break;
        }
        break;
    case 4:
        o[2] = 0xe0400;
        func_0201aabc(0x7b);
        *(unsigned int *)(sw + 0x900) |= 0x1000000;
        break;
    case 5:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1: *(int *)(sw + 0x924) = 4;
        case 4:
            o[2] = 0xe0500;
            *(unsigned int *)(sw + 0x8e0) = (*(unsigned int *)(sw + 0x8e0) & ~1) | 1;
            break;
        case 3:
            if (((struct Bit0 *)(sw + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0xe0504;
                if (((struct Bit1 *)(sw + 0x8e0))->b == 0) --*(int *)(sw + 0x924);
            } else {
                o[2] = 0xe0502;
            }
            break;
        case 2:
            o[2] = 0xe0503;
            if (((struct Bit1 *)(sw + 0x8e0))->b == 0) {
                *(int *)(sw + 0x91c) = 0xe;
                *(int *)(sw + 0x920) = 3;
                *(int *)(sw + 0x924) = 4;
                *(unsigned int *)(sw + 0x8e0) |= 4;
            }
            if (((struct Bit1 *)(sw + 0x8e0))->b == 0) func_02019640(0);
            break;
        }
        break;
    case 6:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1: *(int *)(sw + 0x924) = 4;
        case 4:
            if (func_0201b7e0(o) != 3) return;
            if (func_02019664() != 0x7b) return;
            o[2] = 0xe0600;
            *(unsigned int *)(sw + 0x8e0) = (*(unsigned int *)(sw + 0x8e0) & ~1) | 1;
            break;
        case 3:
            if (func_ov000_021ae4ac() == 2) {
                *(int *)(sw + 0x91c) = 0xe;
                *(int *)(sw + 0x920) = 6;
                *(int *)(sw + 0x924) = 4;
                *(unsigned int *)(sw + 0x8e0) |= 4;
                func_02019640(0);
                *(unsigned int *)(sw + 0x8e0) |= 4;
            } else {
                if (((struct Bit0 *)(sw + 0x8e0))->b != 0) return;
                if (func_020195ec() == 0) o[2] = 0xe0601;
                else o[2] = 0xe0602;
            }
            break;
        case 2:
            o[2] = 0xe0603;
            func_0201b7b4();
            func_0201aaf4(0x7b);
            *(unsigned int *)(sw + 0x900) &= ~0x1000000;
            break;
        }
        break;
    }
}
