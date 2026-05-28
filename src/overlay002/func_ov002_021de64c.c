/* func_ov002_021de64c: C-42 — bit-set + 3-arg helper + tst-bool tail.
 *
 *   push {r4, lr}
 *   add r1, r2, r1, lsl #4
 *   mov r2, #1; mov r4, r2, lsl r1
 *   mov r1, r4; mov r2, #0xf
 *   bl func_ov002_021de134(a, mask, 0xf)        ; no r3 set — 3-arg call
 *   tst r4, r0; movne r0, #1; moveq r0, #0
 *   pop
 */

extern int func_ov002_021de134(int a, unsigned int mask, int k1);

int func_ov002_021de64c(int a, int b, int c) {
    int bit = c + (b << 4);
    unsigned int mask = 1u << bit;
    return (func_ov002_021de134(a, mask, 0xf) & mask) ? 1 : 0;
}
