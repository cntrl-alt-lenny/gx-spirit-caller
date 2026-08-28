/* func_02043b20: spin-wait on a state poll, kick off a callback via
 * func_02096340, then busy-loop calling func_02043cec until it signals
 * done, sleeping between polls. */

extern int func_02096318(int a0, int a1);
extern void func_02096340(int a0, void *a1);
extern int func_02043cec(int a0, int a1, int a2, int a3);
extern void WaitByLoop(int a0);
extern void func_02043ae8(void);

int func_02043b20(void) {
    while (func_02096318(4, 1) == 0) {
    }

    func_02096340(4, (void *)func_02043ae8);

    for (;;) {
        if (func_02043cec(7, 0, 0, 0) == 1) {
            break;
        }
        WaitByLoop(0x40000);
    }

    return 1;
}
