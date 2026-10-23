extern void *func_020498f0(void);
extern int func_0204b850(int a0, int a1);
extern int func_0204bc4c(int mask);
extern void func_0204bf44(int mode);
extern long long func_020930b0(void);
extern unsigned long long func_020b3808(unsigned long long, unsigned long long);
struct Slots { char pad[0xf4]; int slots[1]; };
#define FIELD(type, off) (*(type *)((char *)func_020498f0() + off))
int func_0204b410(void) {
    unsigned long long elapsed;
    if (FIELD(int, 0x1a0) == 8 || FIELD(int, 0x1a0) == 14 || FIELD(int, 0x1a0) == 15) {
        unsigned long long now = func_020930b0();
        elapsed = func_020b3808((now - FIELD(unsigned long long, 0x1e8)) << 6, 0x82ea);
    } else {
        return 1;
    }
    switch (FIELD(int, 0x1a0)) {
    case 8:
        if (elapsed > 6000) {
            if (func_0204b850(FIELD(int, 0xf4), 14) == 0) return 0;
        }
        break;
    case 14:
        if (elapsed > 6000) {
            FIELD(unsigned char, 0x1ac)++;
            if (FIELD(unsigned char, 0x1ac) > 5) {
                if (func_0204bc4c(FIELD(int, 0x1d8)) == 0) return 0;
                if (FIELD(unsigned char, 0xd) != 0) {
                    FIELD(unsigned char, 0x1ac) = 0;
                    {
                        char *h = (char *)func_020498f0();
                        long long now = func_020930b0();
                        *(int *)(h + 0x1e8) = (int)now;
                        *(int *)(h + 0x1ec) = (int)(now >> 32);
                    }
                } else {
                    func_0204bf44(2);
                }
            } else {
                int i;
                for (i = 1; i <= FIELD(unsigned char, 0xd); i++) {
                    if (!(FIELD(int, 0x1d8) & (1 << *(unsigned char *)((char *)func_020498f0() + i + 0x2d0)))) {
                        if (func_0204b850(((struct Slots *)func_020498f0())->slots[i], 13) == 0) return 0;
                    }
                }
            }
        }
        break;
    case 15:
        if (elapsed > FIELD(unsigned short, 0x1b2)) func_0204bf44(2);
        break;
    }
    return 1;
}
