/* func_ov002_021fa4f8: family 3 — 2 helpers + bool tail.
 *
 *     push {r3, r4, r5, lr}
 *     mov r5, r0; mov r4, r1
 *     bl func_ov002_021f495c(self, arg)
 *     cmp r0, #0; moveq r0, #0; popeq    ; predicated early-return on 0
 *     mov r0, r5; mov r1, r4
 *     bl func_ov002_021f4910(self, arg)
 *     cmp r0, #0; movne r0, #1; moveq r0, #0    ; bool tail
 *     pop
 *
 * Sibling family: 4 picks (021fa5e8, 02203df4, 022054d0, 0220a7b8).
 */
extern int func_ov002_021f495c(int self, int arg);
extern int func_ov002_021f4910(int self, int arg);

int func_ov002_021fa4f8(int self, int arg) {
    if (func_ov002_021f495c(self, arg) == 0) return 0;
    return func_ov002_021f4910(self, arg) != 0;
}
