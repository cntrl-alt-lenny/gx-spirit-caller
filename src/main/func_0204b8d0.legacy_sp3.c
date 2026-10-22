extern void *func_020498f0(void);
extern int func_020469b4(void);
extern void func_0204bb5c(int, int);
extern int func_0204bc4c(int mask);
extern void func_0204bd8c(void);
extern void func_0204bf44(int);
extern void func_0204c40c(int);
/* This caller passes the entry in r0 although the existing C callee ignores it. */
extern int func_0204cb54(int entry);
extern int func_0204cc20(int a0);
extern long long func_020930b0(void);
extern unsigned long long func_020b3808(unsigned long long, unsigned long long);
#define F(t,o) (*(t *)((char *)func_020498f0() + (o)))
typedef struct { char pad[0x2d0]; unsigned char slots[32]; } Slots;
int func_0204b8d0(void) {
    unsigned long long elapsed;
    int i;
    if (F(int,0x1a0) == 9 || F(int,0x1a0) == 16 || F(int,0x1a0) == 17) {
        unsigned long long now = func_020930b0();
        elapsed = func_020b3808((now - F(unsigned long long,0x1e0)) << 6, 0x82ea);
    } else return 1;
    switch (F(int,0x1a0)) {
    case 9:
        if (elapsed > 6000) {
            if (func_020469b4() == 5 && F(unsigned char,0x1ad) >= 5) {
                if (func_0204cb54(F(int,0xf4)) == 0) return 0;
            } else {
                F(unsigned char,0x1ad)++;
                func_0204bb5c(F(unsigned char,0x2d0),3);
            }
        }
        break;
    case 16:
        if (elapsed > 6000) {
            F(unsigned char,0x1ab)++;
            if (F(unsigned char,0x1ab) > 5) {
                if (F(unsigned char,0x15) == 0 || F(unsigned char,0x15) == 1) {
                    func_0204bd8c();
                    func_0204bf44(1);
                } else {
                    if (func_0204bc4c(F(int,0x1d4)) == 0) return 0;
                    if (F(unsigned char,0xd) != 0) {
                        char *p;
                        long long now;
                        F(unsigned char,0x1ab) = 0;
                        p = func_020498f0();
                        now = func_020930b0();
                        *(int *)(p+0x1e0) = (int)now;
                        *(int *)(p+0x1e4) = (int)(now >> 32);
                    } else {
                        if (func_0204cc20(F(int,0x20c)) == 0) return 0;
                    }
                }
            } else {
                for (i=1; i<=F(unsigned char,0xd); i++) {
                    if (!(F(int,0x1d4) & (1 << ((Slots *)func_020498f0())->slots[i]))) {
                        func_0204bb5c(((Slots *)func_020498f0())->slots[i],2);
                    }
                }
            }
        }
        break;
    case 17:
        if (elapsed > F(unsigned short,0x1b0)) func_0204c40c(4);
        break;
    }
    return 1;
}

