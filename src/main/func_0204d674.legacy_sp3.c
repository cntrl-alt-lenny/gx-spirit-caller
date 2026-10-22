extern void *func_020498f0(void);
extern int func_0204b280(int target);
extern void *func_0204ce3c(int a0);
/* The original consumes r0; both dispatch targets return int. */
extern int func_0204d438(int a0);
extern int func_020556c8(void *self, int unused1);
typedef struct Mgr Mgr;
extern void func_020673dc(Mgr *m);
extern unsigned char data_0219dc8c[];
#define W(p,o) (*(int *)((char *)(p)+(o)))
#define P(p,o) (*(void **)((char *)(p)+(o)))
#define B(p,o) (*(unsigned char *)((char *)(p)+(o)))
#define H(p,o) (*(unsigned short *)((char *)(p)+(o)))
int func_0204d674(int a, int b, int c, int d, int e) {
    int result;
    void *p;
    switch (B(func_020498f0(),0x15)) {
    case 1:
        if (func_020556c8(P(func_020498f0(),0),a) == 0) { result = 0xff; break; }
        if (func_0204b280(a) == 0) { result = 3; break; }
    case 0:
        if (d != B(func_020498f0(),0x15) || B(func_020498f0(),0x1a9) != 0 ||
            (p = func_020498f0(), B(p,0x14) == B(func_020498f0(),0x16)) ||
            (B(func_020498f0(),0x17) != 0 &&
             (p = func_020498f0(), W(p,0x20) == W(func_020498f0(),0x200)))) {
            result = 3;
            if (B(func_020498f0(),0x15) == 0 && W(P(func_020498f0(),0x10),0xb4) == 0 &&
                B(func_020498f0(),0x17) != 0 &&
                (p = func_020498f0(), W(p,0x20) == W(func_020498f0(),0x200))) {
                func_020673dc(P(func_020498f0(),0x10));
            }
            break;
        }
        if (!((W(func_020498f0(),0x1a0) == 3 || W(func_020498f0(),0x1a0) == 4) &&
            (W(func_020498f0(),0x1c) != 0 || H(func_020498f0(),0x1a) != 0) &&
            (b != 0 || c != 0))) { result = 4; break; }
        {
            if (W(func_020498f0(),0x204) != 0) {
                if (a == W(func_020498f0(),0x204)) {
                    if (e != 0 || (W(func_020498f0(),0x200) < a && a != W(func_020498f0(),0x208))) result = 2;
                    else result = 0xff;
                } else {
                    if (e != 0 || (W(func_020498f0(),0x200) < a && W(func_020498f0(),0x208) == 0)) {
                        if (func_0204d438((int)func_0204ce3c(W(func_020498f0(),0x204))) != 0) return 0xff;
                        result = 2;
                    } else result = 3;
                }
            } else result = 2;
        }
        break;
    case 2:
        if (func_020556c8(P(func_020498f0(),0),a) == 0) { result = 0xff; break; }
        if (!(d == 3 && (p = func_020498f0(), B(p,0x14) != B(func_020498f0(),0x16)))) { result = 3; break; }
        {
            if (data_0219dc8c[0] == 1 && data_0219dc8c[1] == 1) { result = 0x13; break; }
            if (!(W(func_020498f0(),0x1a0) == 10 &&
                (W(func_020498f0(),0x1c) != 0 || H(func_020498f0(),0x1a) != 0) &&
                (b != 0 || c != 0))) { result = 4; break; }
            result = 2;
        }
        break;
    }
    return result;
}
