extern int func_020469b4(void);
extern void *func_020498f0(void);
extern void func_020498dc(int);
extern int func_0204b0d0(int);
extern int func_0204b134(int, int);
extern int func_0204b850(int, int);
extern int func_0204bdc4(int);
extern void func_0204bf44(int);
extern long long func_020930b0(void);
extern unsigned long long func_020b3808(unsigned long long, unsigned long long);
struct Slots { char pad[0xf4]; int slots[1]; };
#define FIELD(type, off) (*(type *)((char *)func_020498f0() + off))
int func_0204b62c(int a0, int a1, int a2) {
    if (func_020469b4() != 6) return 1;
    switch (a1) {
    case 13:
        if (FIELD(int, 0x1a0) != 8) {
            func_020498dc(8);
            func_0204bdc4(a2);
        }
        if (func_0204b850(a0, 14) == 0) return 0;
        break;
    case 14:
        if (FIELD(int, 0x1a0) == 14) {
            unsigned long long now = func_020930b0();
            if ((func_020b3808((now - FIELD(unsigned long long, 0x1e8)) << 6, 0x82ea) >> 1) > 300) {
                unsigned long long elapsed = (func_020b3808((now - FIELD(unsigned long long, 0x1e8)) << 6, 0x82ea) >> 1) - 300;
                if (elapsed > FIELD(unsigned short, 0x1b2)) FIELD(unsigned short, 0x1b2) = elapsed;
            }
            {
                int bit = func_0204b134(a0, 0);
                if (bit != 255) FIELD(int, 0x1d8) |= 1 << bit;
            }
            {
                int mask = func_0204b0d0(1);
                if (mask == FIELD(int, 0x1d8)) {
                    int i;
                    for (i = 1; i <= FIELD(unsigned char, 0xd); i++) {
                        if (func_0204b850(((struct Slots *)func_020498f0())->slots[i], 15) == 0) return 0;
                    }
                    func_020498dc(15);
                }
            }
        } else {
            if (func_0204b850(a0, 15) == 0) return 0;
        }
        break;
    case 15:
        if (FIELD(int, 0x1a0) == 8) func_0204bf44(2);
        break;
    }
    return 1;
}

