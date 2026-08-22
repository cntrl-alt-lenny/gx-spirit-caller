/* func_02043b70: spin-wait on a state poll, kick off a callback via
 * func_02096434, then busy-loop calling func_02043d3c until it signals
 * done, sleeping between polls. */

extern int func_0209640c(int a0, int a1);
extern void func_02096434(int a0, void *a1);
extern int func_02043d3c(int a0, int a1, int a2, int a3);
extern void WaitByLoop(int a0);
extern void func_02043b38(void);

int func_02043b70(void) {
    while (func_0209640c(4, 1) == 0) {
    }

    func_02096434(4, (void *)func_02043b38);

    for (;;) {
        if (func_02043d3c(7, 0, 0, 0) == 1) {
            break;
        }
        WaitByLoop(0x40000);
    }

    return 1;
}
