extern char *GetSystemWork(void);
extern void func_0200a26c(int a0);
/* These forwarding functions preserve a result in r0, used by this caller. */
extern int func_020139b4(void);
extern int func_020139c4(void);
extern int func_020190ec(void);
extern void func_02018a38(unsigned int value);
extern void func_02018a64(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern int func_0201969c(void);
extern int func_0201a3ec(void);
extern void func_0201abb0(int n);
extern void func_0201abd4(int n);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b : 1; };
struct Bits { unsigned int b0 : 1; unsigned int b1 : 1; };
void func_02017ea8(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_0201a3ec() == 0) return;
        if (func_02019034() < *(unsigned int *)(w + 0x8dc) + 1) return;
        if (func_020139c4() != 0) return;
        *(int *)((char *)o + 8) = 0x00290100;
        if (((struct Bits *)(w + 0x8e0))->b1 != 0) return;
        func_0200a26c(6);
        break;
    case 2:
        if (func_0201b7e0(o) != 5) return;
        *(int *)((char *)o + 8) = 0x00290200;
        func_0201b7b4();
        break;
    case 3:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        if (func_02019034() < *(unsigned int *)(w + 0x8dc) + 1) return;
        *(int *)((char *)o + 8) = 0x00290300;
        *(int *)(w + 0x900) |= 0x1000000;
        break;
    case 4:
        if (func_0201b7e0(o) != 4) return;
        *(int *)((char *)o + 8) = 0x00290400;
        func_0201abb0(3);
        func_02018a38(0x14);
        break;
    case 5:
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 3) return;
        *(int *)((char *)o + 8) = 0x00290500;
        func_0201abd4(3);
        func_0201abb0(2);
        func_02018a64();
        break;
    case 6:
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 2) return;
        if (func_020139b4() != 2) return;
        *(int *)((char *)o + 8) = 0x00290600;
        func_0201abd4(2);
        break;
    case 7:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_020139b4() == 2) {
                char *s;
                func_0201abb0(6);
                s = GetSystemWork();
                *(int *)(s + 0x8f8) |= 0x1000;
            }
            if (func_020139b4() != 2) return;
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 6) return;
            *(int *)((char *)o + 8) = 0x00290700;
            ((struct Bits *)(w + 0x8e0))->b0 = 1;
            *(int *)(w + 0x900) |= 0x1000000;
            break;
        case 3:
            if (((struct Bits *)(w + 0x8e0))->b0 != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x00290701;
            } else {
                *(int *)((char *)o + 8) = 0x00290702;
            }
            break;
        case 2:
            {
                char *s;
                *(int *)((char *)o + 8) = 0x00290703;
                func_0201b7b4();
                func_0201abd4(6);
                s = GetSystemWork();
                *(int *)(s + 0x8f8) &= ~0x1000;
                *(int *)(w + 0x900) &= ~0x1000000;
            }
            break;
        }
        break;
    }
}
