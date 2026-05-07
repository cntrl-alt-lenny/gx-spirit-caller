/* func_020566d8: clear 4 fields of a struct (offsets 0x8, 0x10, 0x14,
 * 0x18) and return 1. Note the struct pointer arrives in r1, not r0.
 *
 *     mov r0, #0x0
 *     str r0, [r1, #0x8]
 *     str r0, [r1, #0x10]
 *     str r0, [r1, #0x14]
 *     str r0, [r1, #0x18]
 *     mov r0, #0x1
 *     bx  lr
 *
 * mwcc fuses the four zero-stores by reusing r0 (zero) across all
 * stores, then materialises the return value `1` into r0 last.
 */

typedef struct {
    char _pad_8[0x8];
    int  f_8;
    char _pad_10[0x10 - 0x8 - 4];
    int  f_10;
    int  f_14;
    int  f_18;
} state_4zero_t;

int func_020566d8(int unused, state_4zero_t *p) {
    (void)unused;
    p->f_8  = 0;
    p->f_10 = 0;
    p->f_14 = 0;
    p->f_18 = 0;
    return 1;
}
