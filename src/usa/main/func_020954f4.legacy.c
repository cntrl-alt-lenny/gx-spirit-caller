/* func_020954f4: handshake sequence -- bail early if a0's ready-check ever
 * trips, otherwise busy-wait signalling 0, recheck, run func_020952f0,
 * recheck, then busy-wait signalling 1 until the ready-check trips.
 */

extern int func_02095460(unsigned int a0);
extern int func_02095828(int a);
extern void func_020952f0(void);

void func_020954f4(int a0) {
    if (func_02095460(a0) != 0) {
        return;
    }
    while (func_02095828(0) != 0) {
    }
    if (func_02095460(a0) != 0) {
        return;
    }
    func_020952f0();
    if (func_02095460(a0) != 0) {
        return;
    }
    do {
        func_02095828(1);
    } while (func_02095460(a0) == 0);
}
