typedef unsigned long long u64;
extern char *GetSystemWork(void);
/* The existing void forwarder leaves a result in r0, tested by this caller. */
extern int func_020139b4(void);
extern unsigned int func_0201b7e0(void *obj);
extern unsigned int func_020191cc(void);
extern int func_02019664(void);
extern void func_0201b708(int arg);
extern void func_02018a38(unsigned int value);
extern void func_0202ae1c(int arg0);
extern void func_0201a134(int value);
extern void func_0202af40(void);
extern void func_0201b7b4(void);
extern void func_02018a64(void);
extern void func_0200a26c(int a0);
struct Rng { u64 state, mult, add; };
extern struct Rng data_02102c64;
struct Table { unsigned char a[3]; };
extern struct Table data_020b599c;
extern char data_02104f4c[];
struct Mode { unsigned int b:3; };
struct Bit0 { unsigned int b:1; };
struct Bit1 { unsigned int pad:1; unsigned int b:1; };
void func_02014478(int *o) {
    char *sw = GetSystemWork();
    if (((struct Bit0 *)(sw + 0x8d8))->b == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 1:
        if (func_020139b4() != 2) return;
        if (func_0201b7e0(o) != 8) return;
        if ((int)func_020191cc() < 6) return;
        o[2] = 0x70100;
        *(unsigned int *)(sw + 0x900) |= 0x1000000;
        func_0201b708(13);
        func_02018a38(19);
        return;
    case 2:
        if (func_02019664() != 0x72) return;
        if (((struct Bit1 *)(sw + 0x8e0))->b == 0) {
            struct Table table = data_020b599c;
            unsigned int value;
            unsigned int mode;
            data_02102c64.state = data_02102c64.mult * data_02102c64.state + data_02102c64.add;
            mode = ((struct Mode *)(data_02104f4c + 4))->b;
            value = table.a[(u64)(unsigned int)(data_02102c64.state >> 32) * 3 >> 32];
            func_0202ae1c(mode);
            func_0201a134(value);
            func_0202af40();
            *(unsigned int *)(sw + 0x8e8) = (*(unsigned int *)(sw + 0x8e8) & ~0xff) | value;
        }
        o[2] = 0x70200;
        func_0201b7b4();
        *(unsigned int *)(sw + 0x900) &= ~0x1000000;
        func_02018a64();
        return;
    case 3:
        if (func_0201b7e0(o) != 4) return;
        o[2] = 0x70300;
        func_0201b7b4();
        if (((struct Bit1 *)(sw + 0x8e0))->b != 0) return;
        func_0200a26c(3);
        return;
    }
}






