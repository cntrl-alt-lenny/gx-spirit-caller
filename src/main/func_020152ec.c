extern char *GetSystemWork(void);
extern unsigned short func_02019034(void);
/* This caller supplies no arguments to the four-argument forwarding thunk. */
extern int func_020190c0();
/* The original caller consumes the result preserved by this forwarder. */
extern int func_020190ec(void);
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201abd4(int n);
extern void func_0201b7b4(void);
struct Bits { unsigned int b0:1; unsigned int b1:1; };
void func_020152ec(int *o) {
    char *sw = GetSystemWork();
    int x;
    if (((struct Bits *)(sw + 0x8d8))->b0 == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 1:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 1) return;
            o[2] = 0x00100100;
            x = *(int *)(sw + 0x8e0);
            x = (x & ~1) | 1;
            *(int *)(sw + 0x8e0) = x;
            break;
        case 3:
            if (((struct Bits *)(sw + 0x8e0))->b0 != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0x00100104;
                if (((struct Bits *)(sw + 0x8e0))->b1 == 0)
                    *(int *)(sw + 0x924) -= 1;
                func_0201b7b4();
                func_0201abd4(1);
            } else {
                o[2] = 0x00100102;
            }
            break;
        case 2:
            o[2] = 0x00100103;
            if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
                *(int *)(sw + 0x920) = 1;
                *(int *)(sw + 0x924) = 5;
            }
            if (((struct Bits *)(sw + 0x8e0))->b1 != 0) return;
            func_02019640(0);
            break;
        }
        break;
    case 2:
        if (func_0201969c() != 4) return;
        if (func_02019664() != 0x6a) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
        if (func_020190c0() == 4) return;
        if (func_020190c0() == 5) return;
        if (func_020190ec() == 0) return;
        o[2] = 0x00100200;
        func_0201b7b4();
        break;
    }
}
