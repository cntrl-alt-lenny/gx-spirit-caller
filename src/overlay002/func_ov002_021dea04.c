/* func_ov002_021dea04: C-42 — bit-set + 4-arg helper + tst-bool tail.
 *
 *   push {r4, lr}
 *   add r1, r2, r1, lsl #4
 *   mov r2, #1; mov r4, r2, lsl r1
 *   mov r1, r4; mov r2, #0xd; mov r3, #0x800000
 *   bl func_ov002_021de134(a, mask, 0xd, 0x800000)
 *   tst r4, r0; movne r0, #1; moveq r0, #0
 *   pop
 */

extern int func_ov002_021de134(int a, unsigned int mask, int k1, int k2);

int func_ov002_021dea04(int a, int b, int c) {
    int bit = c + (b << 4);
    unsigned int mask = 1u << bit;
    return (func_ov002_021de134(a, mask, 0xd, 0x800000) & mask) ? 1 : 0;
}
