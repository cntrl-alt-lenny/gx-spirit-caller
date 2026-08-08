/* func_020442f8: build a top-N-bits mask, serialize as 4 big-endian bytes.
 *
 *     mvn r2, #0x0
 *     mov ip, #0x0
 *     eor r3, r2, r2, lsr r0
 *     mov r2, ip
 * .L_10:
 *     rsb r0, r2, #0x18
 *     mov r0, r3, lsr r0
 *     strb r0, [r1, ip]
 *     add ip, ip, #0x1
 *     cmp ip, #0x4
 *     add r2, r2, #0x8
 *     blt .L_10
 *     bx lr
 *
 * Leaf, no stack frame -- .legacy.c per C-71. Two independent loop
 * counters (byte index 0..3, and a separate x8-stepped accumulator
 * for the shift amount) -- not a strength-reduced `i*8` (C-65).
 * Register-alloc note: `sh` must be initialized as `= i` (a copy of
 * the byte index, matching orig's `mov ip,#0; ...; mov r2,ip`) not
 * as its own independent `= 0` -- otherwise identical logic lands
 * the two counters in a different pair of scratch registers.
 */

void func_020442f8(int shift, unsigned char *out) {
    int i = 0;
    unsigned int mask = 0xffffffffu ^ (0xffffffffu >> shift);
    int sh = i;

    for (; i < 4; i++) {
        out[i] = (unsigned char)(mask >> (0x18 - sh));
        sh += 8;
    }
}
