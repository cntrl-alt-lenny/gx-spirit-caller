/* func_ov003_021cef78: queue a button event — if the input subsystem accepts it,
 * post a 4-byte packet {kind, key} where kind is 1 (press, mode 0) or 2 (release,
 * mode 1). Returns 1. (ov003_core.h) */
extern int  func_02034784(void);
extern void func_02034888(int, void *, int);
int func_ov003_021cef78(int dummy, int key, int mode) {
    if (mode == 0) {
        if (func_02034784() != 0) {
            short packet[2];
            packet[0] = 1;
            packet[1] = key;
            func_02034888(4, packet, 4);
        }
    } else {
        if (func_02034784() != 0) {
            short packet[2];
            packet[0] = 2;
            packet[1] = key;
            func_02034888(4, packet, 4);
        }
    }
    return 1;
}
