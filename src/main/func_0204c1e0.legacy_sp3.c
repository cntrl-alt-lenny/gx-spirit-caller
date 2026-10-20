extern void *func_020498f0(void);
extern int func_0204c04c(void);
extern void func_0204c120(void);
extern void *func_0204ce3c(int a0);
/* The caller consumes r0 as the result; the existing void definition loses it. */
extern int func_0204d438(int a0);
extern int func_02062530(int *p);
/* This caller supplies a handle although the existing definition ignores it. */
extern void func_02065788(int handle);

#define WORD(off) (*(int *)((char *)func_020498f0() + (off)))
#define BYTE(off) (*(unsigned char *)((char *)func_020498f0() + (off)))

void func_0204c1e0(void) {
    WORD(0x20c) = 0;
    if (WORD(0x1a0) == 2) {
        func_0204c120();
        return;
    }
    BYTE(0x1a9) = 1;
    if (BYTE(0x15) == 3) {
        BYTE(0x1a9) = 1;
        if (BYTE(0xd) != 0) {
            func_02062530(**(int ***)((char *)func_020498f0() + 4));
        } else {
            if (func_0204d438((int)func_0204ce3c(WORD(0xf4))) != 0) return;
        }
        func_0204c120();
        return;
    }
    if (WORD(0x1a0) == 4 || WORD(0x1a0) == 5 || WORD(0x1a0) == 6 ||
        WORD(0x1a0) == 7 || WORD(0x1a0) == 0xb || WORD(0x1a0) == 0xc) {
        if (WORD(0x204) != 0) {
            if (func_0204d438((int)func_0204ce3c(WORD(0xf4))) != 0) return;
        }
        if (func_0204d438(func_0204c04c()) != 0) return;
    }
    if (WORD(0x19c) != 0) {
        func_02065788(WORD(0x19c));
        WORD(0x19c) = 0;
    }
    if (BYTE(0xd) != 0) {
        BYTE(0x1a9) = 1;
        func_02062530(**(int ***)((char *)func_020498f0() + 4));
    }
    func_0204c120();
}
