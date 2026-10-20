extern int func_020469b4(void);
extern void *func_020498f0(void);
extern void func_020498dc(int x);
extern int func_0204be40(void);
extern void func_0204bf44(int x);
extern void func_02050054(void *a0, void *a1);
extern int func_02062530(int *p);
/* This caller passes a handle although the current callee C ignores it. */
extern void func_02065788(int handle);
extern unsigned long long func_020930b0(void);

#define B(off) (*(unsigned char *)((char *)func_020498f0() + (off)))
#define I(off) (*(int *)((char *)func_020498f0() + (off)))
int func_0204fcc0(void *a, int b) {
    if (func_020469b4() != 5) return 0;
    if (B(0x15) == 2) return 1;
    if (a != 0) {
        func_02050054(a, (void *)(b + 0xfffec780));
        return 1;
    }
    B(0x2d0) = 0;
    if (B(0x1a9) == 1 || B(0x1a8) == 1 || B(0x1a8) == 2) return 1;
    if (I(0x19c) != 0) {
        func_02065788(I(0x19c));
        I(0x19c) = 0;
    }
    if (B(0xd) != 0) {
        if (B(0x1a8) == 0) {
            B(0x1a8) = 3;
            func_02062530(**(int ***)((char *)func_020498f0() + 4));
        }
    } else if (B(0x15) == 3) {
        func_02050054((void *)6, (void *)0xfffec5d2);
    } else if (I(0x208) != 0) {
        func_0204be40();
    } else if (I(0x1a0) == 1) {
        unsigned long long t;
        void *p;
        func_020498dc(0x12);
        p = func_020498f0();
        t = func_020930b0();
        *(int *)((char *)p + 0x1f0) = (int)t;
        *(int *)((char *)p + 0x1f4) = (int)(t >> 32);
    } else {
        func_0204bf44(1);
    }
    return 1;
}

