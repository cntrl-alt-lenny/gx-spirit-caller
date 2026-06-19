/* func_ov003_021cee3c: queue a button event — if the input subsystem accepts it,
 * post a 4-byte packet {kind, key} where kind is 1 (press, mode 0) or 2 (release,
 * mode 1). Returns 1. (ov003_core.h) */
extern int  func_02034734(void);
extern void func_02034838(int, void *, int);
int func_ov003_021cee3c(int dummy, int key, int mode) {
    if (mode == 0) {
        if (func_02034734() != 0) {
            short packet[2];
            packet[0] = 1;
            packet[1] = key;
            func_02034838(4, packet, 4);
        }
    } else {
        if (func_02034734() != 0) {
            short packet[2];
            packet[0] = 2;
            packet[1] = key;
            func_02034838(4, packet, 4);
        }
    }
    return 1;
}
