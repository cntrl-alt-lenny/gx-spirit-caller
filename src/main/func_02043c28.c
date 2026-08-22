/* func_02043c28: sibling of func_02043b70 -- same spin-wait/callback
 * kickoff preamble, an extra init call over the caller's two objects,
 * then an infinite busy-loop that returns 1 as soon as func_02043d3c
 * signals done. */

extern int func_0209640c(int a0, int a1);
extern void func_02096434(int a0, void *a1);
extern void func_020928e8(int a0, int a1);
extern int func_02043d3c(int a0, int a1, int a2, int a3);
extern void WaitByLoop(int a0);
extern void func_02043b38(void);

int func_02043c28(int a0, int a1, int a2) {
    while (func_0209640c(4, 1) == 0) {
    }

    func_02096434(4, (void *)func_02043b38);
    func_020928e8(a2, a1);

    for (;;) {
        int result = func_02043d3c(2, a0, a1, a2);
        if (result == 1) {
            return result;
        }
        WaitByLoop(0x40000);
    }
}
