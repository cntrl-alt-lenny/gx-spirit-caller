/* func_020955e8: handshake sequence -- bail early if a0's ready-check ever
 * trips, otherwise busy-wait signalling 0, recheck, run func_020953e4,
 * recheck, then busy-wait signalling 1 until the ready-check trips.
 */

extern int func_02095554(unsigned int a0);
extern int func_0209591c(int a);
extern void func_020953e4(void);

void func_020955e8(int a0) {
    if (func_02095554(a0) != 0) {
        return;
    }
    while (func_0209591c(0) != 0) {
    }
    if (func_02095554(a0) != 0) {
        return;
    }
    func_020953e4();
    if (func_02095554(a0) != 0) {
        return;
    }
    do {
        func_0209591c(1);
    } while (func_02095554(a0) == 0);
}
