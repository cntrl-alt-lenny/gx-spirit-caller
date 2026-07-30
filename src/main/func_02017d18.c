extern char *GetSystemWork(void);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201abb0(int v);
extern void func_0201abd4(int v);
extern void func_02018a38(int v);
extern void func_02018a64(void);
extern int func_0201b7e0(int *dst);

struct Bit02017d18 {
    unsigned int b0 : 1;
};

void func_02017d18(int *o) {
    char *sw = GetSystemWork();
    int x;

    if (((struct Bit02017d18 *)(sw + 0x8d8))->b0 == 0) {
        return;
    }

    switch (*(int *)(sw + 0x920)) {
    case 1:
        if (func_02019664() != 0x66) {
            return;
        }
        o[2] = 0x00270100;
        x = *(int *)(sw + 0x900);
        x |= 0x1000000;
        *(int *)(sw + 0x900) = x;
        break;
    case 2:
        if (func_0201b7e0(o) != 4) {
            return;
        }
        o[2] = 0x00270200;
        func_0201abb0(2);
        func_02018a38(0x13);
        break;
    case 3:
        if (func_02019664() != 0x65) {
            return;
        }
        if (func_0201969c() != 2) {
            return;
        }
        o[2] = 0x00270300;
        func_0201abd4(2);
        x = *(int *)(sw + 0x900);
        x &= ~0x1000000;
        *(int *)(sw + 0x900) = x;
        func_02018a64();
        break;
    default:
        break;
    }
}
