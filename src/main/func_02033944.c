/* func_02033944: for each of obj->count bit-indices not equal to
 * func_02046ac4()'s current value and set in the a1 bitmask, run the
 * per-index gate func_02052bc4; if it passes, run func_020469d0 — a
 * miss there just clears the bit and keeps scanning, but a HIT there
 * bails out the whole function immediately returning 0. Otherwise
 * (loop exhausted) tail-calls the 3-arg forward function. */
typedef struct Obj02033944 {
    char         pad_ea0[0xea0];
    unsigned int count;  /* +0xea0 */
} Obj02033944;

extern int func_02046ac4(void);
extern int func_02052bc4(int a);
extern int func_020469d0(int a);
extern int func_02052974(int a, int b, int c);

int func_02033944(Obj02033944 *obj, int a1, int a2, int a3) {
    int i;
    for (i = 0; i < obj->count; i++) {
        if (i == func_02046ac4()) {
            continue;
        }
        if (!(a1 & (1 << i))) {
            continue;
        }
        if (func_02052bc4((unsigned char)i) != 0) {
            continue;
        }
        if (func_020469d0(i & 0xff) == 0) {
            a1 &= ~(1 << i);
            continue;
        }
        return 0;
    }
    return func_02052974(a1, a2, a3);
}
