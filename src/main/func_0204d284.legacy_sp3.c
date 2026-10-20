extern void *func_020498f0(void);
/* The thunk forwards r0 and r1, and its caller consumes the returned r0. */
extern void *func_02068cc8(void *, int);
extern int func_02068a20(void *, void *, int);
extern int func_020689dc(void *p);
extern unsigned short func_020689b8(unsigned short *s);
extern long long func_020930b0(void);
extern int func_0204ead0(int, int, int, int, int *, int);
extern char data_020ff980[];
#define W(p,o) (*(int *)((char *)(p)+(o)))
#define H(p,o) (*(unsigned short *)((char *)(p)+(o)))
#define B(p,o) (*(unsigned char *)((char *)(p)+(o)))
int func_0204d284(int a, int b) {
    int args[3];
    int count;
    int mode;
    void *obj;
    void *p;
    long long t;
    if (b != 0 || (W(func_020498f0(),0x1c) == 0 && H(func_020498f0(),0x1a) == 0)) {
        W(func_020498f0(),0x1bc) = 1;
        p = func_020498f0();
        t = func_020930b0();
        W(p,0x1c0) = (int)t;
        W(p,0x1c4) = (int)(t >> 32);
        W(func_020498f0(),0xf4) = a;
        return 0;
    }
    if (B(func_020498f0(),0x15) == 0) {
        obj = func_02068cc8(*(void **)((char *)func_020498f0()+0xe4),0);
        p = func_020498f0();
        W(p,0xf4) = func_02068a20(obj,data_020ff980,0);
        p = func_020498f0();
        W(p,0x24) = func_020689dc(obj);
        p = func_020498f0();
        H(p,0xa4) = func_020689b8(obj);
        p = func_020498f0();
        W(p,0x204) = W(func_020498f0(),0xf4);
        count = 1;
    } else {
        if (B(func_020498f0(),0x15) == 1) W(func_020498f0(),0xf4) = a;
        W(func_020498f0(),0x204) = a;
        args[1] = W(func_020498f0(),0x1c);
        args[2] = H(func_020498f0(),0x1a);
        count = 3;
    }
    W(func_020498f0(),0x1c8) = 0x1770;
    p = func_020498f0();
    t = func_020930b0();
    W(p,0x1cc) = (int)t;
    W(p,0x1d0) = (int)(t >> 32);
    W(func_020498f0(),0x1bc) = 0;
    mode = W(func_020498f0(),0x208) != 0 ? 11 : 1;
    args[0] = B(func_020498f0(),0x15);
    p = func_020498f0();
    return func_0204ead0(mode,a,W(p,0x24),H(func_020498f0(),0xa4),args,count);
}
