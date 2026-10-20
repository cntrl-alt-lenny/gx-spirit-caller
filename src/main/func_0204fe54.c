extern void *func_020498f0(void);
extern void func_020498dc(int x);
extern int func_0204b0d0(int a0);
extern void func_0204bb5c(int, int);
extern void func_0204c40c(int);
#define BYTE(p,o) (((unsigned char *)(p))[o])
#define WORD(p,o) (*(int *)((char *)(p) + (o)))
#define HALF(p,o) (*(unsigned short *)((char *)(p) + (o)))
struct Context { unsigned char pad[0xf4]; int slots[32]; unsigned char pad174[0x15c]; unsigned char ids[32]; };
void func_0204fe54(int a, int mode, unsigned char *data) {
    int index;
    int value;
    int mask;
    int i;
    void *p;
    switch (mode) {
    case 2:
        if (WORD(func_020498f0(),0x1a0) == 1) {
            if (data[0] == 1) WORD(func_020498f0(),0x20c) = 0;
            index = data[1];
            ((struct Context *)func_020498f0())->ids[index] = data[2];
            p = func_020498f0();
            ((struct Context *)p)->slots[index] = WORD(func_020498f0(),0x200);
            if (BYTE(func_020498f0(),0x15) == 0 || BYTE(func_020498f0(),0x15) == 1) {
                p = func_020498f0();
                BYTE(p,0x16) = BYTE(func_020498f0(),0xd);
            }
            BYTE(func_020498f0(),0x1ad) = 0;
            func_020498dc(9);
        }
        func_0204bb5c(a,3);
        break;
    case 3:
        if (WORD(func_020498f0(),0x1a0) == 0x10) {
            WORD(func_020498f0(),0x1d4) |= 1 << a;
            value = data[0] | (data[1] << 8);
            if (value > HALF(func_020498f0(),0x1b0)) HALF(func_020498f0(),0x1b0) = value;
            mask = func_0204b0d0(0);
            if (mask != WORD(func_020498f0(),0x1d4)) return;
            for (i = 1; i <= BYTE(func_020498f0(),0xd); i++) {
                func_0204bb5c(((struct Context *)func_020498f0())->ids[i],4);
            }
            func_020498dc(0x11);
        } else {
            func_0204bb5c(a,4);
        }
        break;
    case 4:
        if (WORD(func_020498f0(),0x1a0) != 9) return;
        func_0204c40c(4);
        break;
    }
}

