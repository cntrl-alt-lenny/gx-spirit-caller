extern char *GetSystemWork(void);
/* Forwarders leave results in r0 which this caller consumes. */
extern int func_020139b4(void);
extern int func_020139c4(void);
extern int func_020190ec(void);
extern void func_02018a38(unsigned int value);
extern void func_02018a64(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201aabc(int id);
extern void func_0201aaf4(int unused0);
extern void func_0201abb0(int n);
extern void func_0201abd4(int n);
extern void func_0201b708(int arg);
extern void func_0201b730(int a0);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b : 1; };
void func_02016400(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_020190ec() == 0) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 2)) return;
        if (func_020139c4() != 5) return;
        *(int *)((char *)o + 8) = 0x001a0100;
        func_0201aabc(0x78);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 2:
        if (func_0201b7e0(o) != 3) return;
        if (func_02019664() != 0x78) return;
        *(int *)((char *)o + 8) = 0x001a0200;
        func_0201aaf4(0x78);
        func_02018a38(0x13);
        return;
    case 3:
        if (func_020139b4() == 2) func_0201abb0(1);
        else func_0201abd4(1);
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 1) return;
        if (func_020139b4() != 2) return;
        *(int *)((char *)o + 8) = 0x001a0300;
        func_0201abd4(1);
        func_0201b7b4();
        *(int *)(w + 0x900) &= ~0x1000000;
        func_02018a64();
        func_0201b708(8);
        return;
    case 4:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x6d) return;
            if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
            if (func_020139b4() != 2) return;
            *(int *)((char *)o + 8) = 0x001a0400;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x001a0401;
                return;
            } else {
                *(int *)((char *)o + 8) = 0x001a0402;
                return;
            }
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x001a0403;
            func_0201b7b4();
            func_0201b730(8);
            return;
        }
        return;
    }
}

