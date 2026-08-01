/* func_0200111c: state dispatcher on func_02018b14()'s state getter
 * (0-10). Case 0 and default return 0 with no side effects. Case 1
 * checks a signed 5-bit field at bit 16 of func_02018b60()[0x1c]; if it
 * equals 4, calls func_02012578(1), else gathers three separate
 * func_02018b60() pointers and forwards packed sub-fields from each
 * into func_020124c0(). Every other case sets data_02103fcc+0xb64 to a
 * per-state value (some via func_02000cc4() or func_02000d4c()-1,
 * case 4 doing the latter twice) and falls into a shared tail:
 * func_02018b00(0), return 1. */

extern char data_02103fcc[];
extern char *func_02018b60(void);
extern int func_02018b14(void);
extern void func_02000cc4(void);
extern int func_02000d4c(void);
extern void func_02000e34(void);
extern void func_020124c0(int, int, int);
extern void func_02012578(int);
extern void func_02018b00(int);

int func_0200111c(void) {
    char *sw = data_02103fcc;
    int state = func_02018b14();

    switch (state) {
    case 1: {
        char *p1, *p2, *p3;
        int w0, w1, w2;
        int a0, a1, a2;
        if (((*(int *)(func_02018b60() + 0x1c) << 0xb) >> 0x1b) == 4) {
            func_02012578(1);
        } else {
            p1 = func_02018b60();
            p2 = func_02018b60();
            p3 = func_02018b60();
            w0 = *(int *)(p1 + 0x14);
            w1 = *(int *)(p2 + 0x1c);
            w2 = *(int *)(p3 + 0x1c);
            a0 = (unsigned int)(w0 << 0x18) >> 0x18;
            a1 = (w1 << 0xb) >> 0x1b;
            a2 = (w2 << 0x10) >> 0x18;
            func_020124c0(a0, a1, a2);
        }
        func_02000cc4();
        *(int *)(sw + 0xb64) = 0x33;
        goto shared_tail;
    }
    case 2:
        func_02000e34();
        goto shared_tail;
    case 3:
        func_02000cc4();
        *(int *)(sw + 0xb64) = 0xd;
        goto shared_tail;
    case 4:
        *(int *)(sw + 0xb64) = func_02000d4c() - 1;
        *(int *)(sw + 0xb64) = func_02000d4c() - 1;
        goto shared_tail;
    case 5:
        func_02000cc4();
        *(int *)(sw + 0xb64) = 0x29;
        goto shared_tail;
    case 6:
        *(int *)(sw + 0xb64) = func_02000d4c() - 1;
        goto shared_tail;
    case 7:
        *(int *)(sw + 0xb64) = 0x23;
        goto shared_tail;
    case 8:
        func_02000cc4();
        *(int *)(sw + 0xb64) = 0x21;
        goto shared_tail;
    case 9:
        func_02000cc4();
        *(int *)(sw + 0xb64) = 0x2b;
        goto shared_tail;
    case 10:
        func_02000cc4();
        *(int *)(sw + 0xb64) = 0xb;
        goto shared_tail;
    default:
    case 0:
        return 0;
    }

shared_tail:
    func_02018b00(0);
    return 1;
}
