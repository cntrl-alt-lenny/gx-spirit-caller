extern char *GetSystemWork(void);
/* Both forwarders leave their final callee's result in r0, consumed here. */
extern int func_020139c4(void);
extern int func_020190ec(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020191cc(void);
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern void func_0201aabc(int id);
extern void func_0201aaf4(int unused0);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
extern unsigned func_ov000_021ae4ac(void);
struct Bits { unsigned int b0:1; unsigned int b1:1; };
void func_02015b10(int *o) {
    char *sw = GetSystemWork();
    int x;
    if (((struct Bits *)(sw + 0x8d8))->b0 == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 1:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        if ((int)func_020191cc() < 13) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
        o[2] = 0x00150100;
        x = *(int *)(sw + 0x900);
        x |= 0x1000000;
        *(int *)(sw + 0x900) = x;
        func_0201aabc(0x7b);
        break;
    case 2:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 5;
        case 5:
            if (func_0201b7e0(o) != 3) return;
            if (func_02019664() != 0x7b) return;
            o[2] = 0x00150200;
            x = *(int *)(sw + 0x8e0);
            x = (x & ~1) | 1;
            *(int *)(sw + 0x8e0) = x;
            break;
        case 4:
            if (((struct Bits *)(sw + 0x8e0))->b0 != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0x00150201;
                if (((struct Bits *)(sw + 0x8e0))->b1 == 0)
                    *(int *)(sw + 0x924) -= 1;
            } else {
                o[2] = 0x00150202;
            }
            break;
        case 3:
            o[2] = 0x00150203;
            if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
                *(int *)(sw + 0x920) = 2;
                *(int *)(sw + 0x924) = 6;
            }
            break;
        case 2:
            o[2] = 0x00150204;
            func_0201b7b4();
            func_02019640(0);
            break;
        }
        break;
    case 3:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 4;
        case 4:
            if (func_0201b7e0(o) != 3) return;
            if (func_02019664() != 0x7b) return;
            o[2] = 0x00150300;
            x = *(int *)(sw + 0x8e0);
            x = (x & ~1) | 1;
            *(int *)(sw + 0x8e0) = x;
            break;
        case 3:
            if (func_ov000_021ae4ac() == 2) {
                *(int *)(sw + 0x91c) = 0x15;
                *(int *)(sw + 0x920) = 3;
                *(int *)(sw + 0x924) = 1;
                *(int *)(sw + 0x8e0) |= 4;
                func_02019640(0);
                return;
            }
            if (((struct Bits *)(sw + 0x8e0))->b0 != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0x00150304;
                *(int *)(sw + 0x900) &= ~0x1000000;
                func_0201b7b4();
                func_0201aaf4(0x7b);
                if (((struct Bits *)(sw + 0x8e0))->b1 == 0)
                    *(int *)(sw + 0x924) -= 1;
            } else {
                o[2] = 0x00150302;
            }
            break;
        case 2:
            o[2] = 0x00150303;
            if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
                *(int *)(sw + 0x920) = 3;
                *(int *)(sw + 0x924) = 5;
            }
            break;
        }
        break;
    }
}
