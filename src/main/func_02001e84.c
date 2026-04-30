/* func_02001e84: extract bit 22 of `p[8]`.
 *
 *     ldr r0, [r0, #0x20]
 *     mov r0, r0, lsl #0x9
 *     mov r0, r0, lsr #0x1f       ; (x << 9) >> 31 = bit 22
 *
 * Uses bit-field syntax to pin shift-shift codegen (mwcc optimizes
 * `(x >> 22) & 1` to AND otherwise — see #218 intel).
 */

typedef struct {
    char         _pad_0x00[0x20];
    unsigned int _pad_lo22 : 22;
    unsigned int bit_22    : 1;
    unsigned int _pad_hi   : 9;
} state_t;

unsigned int func_02001e84(state_t *p) {
    return p->bit_22;
}
