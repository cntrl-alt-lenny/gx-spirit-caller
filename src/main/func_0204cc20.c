extern void *func_020498f0(void);
extern void func_020498dc(int x);
extern int func_0204b850(int a0, int a1);
extern int func_0204bdc4(int a0);
extern void func_0204bf00(void);
extern void func_0204bf44(int a);
extern int func_0204cf7c(int a, int b, int c);
extern void func_02065788(int unused0);
typedef struct Mgr Mgr;
extern void func_020673dc(Mgr *m);
extern long long func_020930b0(void);
#define B(o) (*(unsigned char *)((char *)func_020498f0() + (o)))
#define W(o) (*(int *)((char *)func_020498f0() + (o)))
typedef struct { char pad[0xf4]; int entries[32]; } EntryCtx;
int func_0204cc20(int a0) {
    int flag;
    char *p;
    int i;
    if (B(0x17) != 0 && W(0x20) == W(0x200)) {
        flag = 0;
    } else {
        flag = 1;
    }
    if (flag != 0) {
        B(0x17) = 0;
        W(0x20) = 0;
        func_020673dc(*(Mgr **)((char *)func_020498f0() + 0x10));
    }
    if (B(0xd) < 31) {
        p = func_020498f0();
        *(int *)(p + (B(0xd) + 1) * 4 + 0xf4) = 0;
    }
    B(0x3cc) = 0xff;
    if (W(0x19c) != 0) {
        func_02065788(W(0x19c));
        W(0x19c) = 0;
    }
    p = func_020498f0();
    *(unsigned char *)(p + 0x14) = B(0xd);
    W(0x204) = 0;
    if (flag == 0) {
        if (B(0x15) != 3) func_0204bf00();
    } else if (B(0x15) == 0) {
        long long time;
        func_020498dc(3);
        W(0xe8) = 2;
        p = func_020498f0();
        time = func_020930b0();
        *(int *)(p + 0xec) = (int)time;
        *(int *)(p + 0xf0) = (int)(time >> 32);
    } else if (B(0x15) == 1) {
        func_020498dc(4);
        func_0204cf7c(1, 0, 0);
    } else if (B(0x15) == 2) {
        func_020498dc(14);
        W(0x1d8) = 0;
        *(unsigned short *)((char *)func_020498f0() + 0x1b2) = 0;
        func_0204bdc4(a0);
        for (i = 1; i <= B(0xd); i++) {
            if (func_0204b850(((EntryCtx *)func_020498f0())->entries[i], 13) == 0) return 0;
        }
        if (B(0xd) == 0) func_0204bf44(2);
    }
    return 1;
}

