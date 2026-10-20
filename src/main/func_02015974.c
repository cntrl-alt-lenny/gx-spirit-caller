extern char *GetSystemWork(void);
/* The original consumes r0 although the existing forwarder is typed void. */
extern int func_020139b4(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201abb0(int n);
extern void func_0201abd4(int n);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);

struct Bits { unsigned int b0:1; unsigned int b1:1; };

void func_02015974(int *o) {
    char *sw = GetSystemWork();
    int x;
    if (((struct Bits *)(sw + 0x8d8))->b0 == 0) return;
    if (*(int *)(sw + 0x920) != 1) return;
    switch (*(int *)(sw + 0x924)) {
    case 0: break;
    case 1:
        *(int *)(sw + 0x924) = 5;
    case 5:
        if (func_0201b7e0(o) != 4) return;
        if (func_020139b4() != 2) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 2)) return;
        o[2] = 0x00140100;
        func_0201abb0(5);
        x = *(int *)(sw + 0x900);
        x |= 0x1000000;
        *(int *)(sw + 0x900) = x;
        break;
    case 4:
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 5) return;
        o[2] = 0x00140101;
        x = *(int *)(sw + 0x8e0);
        x = (x & ~1) | 1;
        *(int *)(sw + 0x8e0) = x;
        break;
    case 3:
        if (((struct Bits *)(sw + 0x8e0))->b0 != 0) return;
        if (func_020195ec() == 0) {
            o[2] = 0x00140104;
            if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
                *(int *)(sw + 0x924) = *(int *)(sw + 0x924) - 1;
            }
            func_0201b7b4();
            func_0201abd4(5);
            x = *(int *)(sw + 0x900);
            x &= ~0x1000000;
            *(int *)(sw + 0x900) = x;
        } else {
            o[2] = 0x00140102;
        }
        break;
    case 2:
        o[2] = 0x00140103;
        if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
            *(int *)(sw + 0x920) = 1;
            *(int *)(sw + 0x924) = 5;
        }
        if (((struct Bits *)(sw + 0x8e0))->b1 != 0) return;
        func_02019640(0);
        break;
    }
}
