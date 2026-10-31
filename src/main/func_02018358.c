extern char *GetSystemWork(void);
/* These forwarders preserve the return value consumed by this caller. */
extern int func_020139c4(void);
extern int func_020190ec(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern void func_0201aabc(int id);
extern void func_0201aaf4(int unused0);
extern void func_0201b708(int arg);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
extern unsigned func_ov000_021ae4ac(void);
struct Bits { unsigned int b0:1; unsigned int b1:1; };
void func_02018358(int *o) {
    char *w = GetSystemWork();
    int x;
    if (((struct Bits *)(w + 0x8d8))->b0 == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        switch (*(int *)(w + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(w + 0x924) = 5;
        case 5:
            if (func_020190ec() == 0) return;
            if (func_02019034() < *(unsigned int *)(w + 0x8dc) + 1) return;
            if (func_020139c4() != 5) return;
            o[2] = 0x002c0100;
            func_0201aabc(0x7b);
            *(int *)(w + 0x900) |= 0x1000000;
            break;
        case 4:
            if (func_0201b7e0(o) != 3) return;
            if (func_02019664() != 0x7b) return;
            o[2] = 0x002c0101;
            x = *(int *)(w + 0x8e0);
            x = (x & ~1) | 1;
            *(int *)(w + 0x8e0) = x;
            break;
        case 3:
            if (((struct Bits *)(w + 0x8e0))->b0 != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0x002c0105;
                if (((struct Bits *)(w + 0x8e0))->b1 == 0) --*(int *)(w + 0x924);
                func_0201b7b4();
            } else {
                o[2] = 0x002c0103;
            }
            break;
        case 2:
            o[2] = 0x002c0104;
            if (((struct Bits *)(w + 0x8e0))->b1 == 0) {
                *(int *)(w + 0x920) = 1;
                *(int *)(w + 0x924) = 5;
            }
            if (((struct Bits *)(w + 0x8e0))->b1 == 0) func_02019640(0);
            break;
        }
        break;
    case 2:
        if (func_0201b7e0(o) != 3) return;
        if (func_02019664() != 0x7b) return;
        o[2] = 0x002c0200;
        if (((struct Bits *)(w + 0x8e0))->b1 == 0) func_02019640(0);
        break;
    case 3:
        switch (*(int *)(w + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_0201b7e0(o) != 3) return;
            if (func_02019664() != 0x7b) return;
            o[2] = 0x002c0300;
            x = *(int *)(w + 0x8e0);
            x = (x & ~1) | 1;
            *(int *)(w + 0x8e0) = x;
            break;
        case 3:
            if (func_ov000_021ae4ac() == 2) {
                *(int *)(w + 0x91c) = 0x2c;
                *(int *)(w + 0x920) = 3;
                *(int *)(w + 0x924) = 1;
                *(int *)(w + 0x8e0) |= 4;
                func_02019640(0);
                return;
            }
            if (((struct Bits *)(w + 0x8e0))->b0 != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0x002c0304;
                if (((struct Bits *)(w + 0x8e0))->b1 == 0) --*(int *)(w + 0x924);
                func_0201b7b4();
                *(int *)(w + 0x900) &= ~0x1000000;
                func_0201aaf4(0x7b);
                func_0201b708(8);
                func_0201b708(12);
                func_0201b708(10);
                func_0201b708(11);
            } else {
                o[2] = 0x002c0302;
            }
            break;
        case 2:
            o[2] = 0x002c0303;
            if (((struct Bits *)(w + 0x8e0))->b1 == 0) {
                *(int *)(w + 0x920) = 3;
                *(int *)(w + 0x924) = 5;
            }
            if (((struct Bits *)(w + 0x8e0))->b1 == 0) func_02019640(0);
            break;
        }
        break;
    }
}
