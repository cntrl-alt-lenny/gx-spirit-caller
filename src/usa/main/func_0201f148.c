/* func_0201f148: store arg at f_2c iff `(unsigned)(f_30 - 9) > 1`.
 *
 *     ldr r1, .L_0201f1b4
 *     ldr r2, [r1, #0x30]
 *     sub r2, r2, #0x9
 *     cmp r2, #0x1
 *     strhi r0, [r1, #0x2c]    ; if (f_30 - 9) > 1: store arg
 *     bx  lr
 *
 * `(f_30 - 9) > 1` is mwcc's encoding of "f_30 not in {9, 10}" — a
 * range exclusion test compiled as subtract-then-unsigned-compare.
 */

typedef struct {
    char         _pad_2c[0x2c];
    int          f_2c;
    unsigned int f_30;
} state_02191f40_t;

extern state_02191f40_t data_02191e60;

void func_0201f148(int arg) {
    if ((data_02191e60.f_30 - 9) > 1) {
        data_02191e60.f_2c = arg;
    }
}
