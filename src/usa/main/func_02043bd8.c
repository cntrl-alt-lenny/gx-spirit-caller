/* func_02043bd8: sibling of func_02043b70 -- same spin-wait/callback
 * kickoff preamble, an extra init call over the caller's two objects,
 * then an infinite busy-loop that returns 1 as soon as func_02043cec
 * signals done. */

extern int func_02096318(int a0, int a1);
extern void func_02096340(int a0, void *a1);
extern void func_02092800(int a0, int a1);
extern int func_02043cec(int a0, int a1, int a2, int a3);
extern void WaitByLoop(int a0);
extern void func_02043ae8(void);

int func_02043bd8(int a0, int a1, int a2) {
    while (func_02096318(4, 1) == 0) {
    }

    func_02096340(4, (void *)func_02043ae8);
    func_02092800(a2, a1);

    for (;;) {
        int result = func_02043cec(2, a0, a1, a2);
        if (result == 1) {
            return result;
        }
        WaitByLoop(0x40000);
    }
}
