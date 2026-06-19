/* func_ov002_022942e0: family 2ca3cefd — return 1 iff both
 * func_ov002_02291050 and func_ov002_02294260 are non-zero, else 0.
 * Inverted polarity (body inside the `if`, not early-return) so the two
 * "return 0" paths share one epilogue, forcing orig's `beq` + `popne`
 * shape instead of predicated `moveq/popeq` (brief-249 gotcha).
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     mov   r4, r1
 *     bl    func_ov002_02291050
 *     cmp   r0, #0x0
 *     beq   .L_zero
 *     mov   r0, r5
 *     mov   r1, r4
 *     bl    func_ov002_02294260
 *     cmp   r0, #0x0
 *     movne r0, #0x1
 *     popne {r3, r4, r5, pc}
 *  .L_zero:
 *     mov   r0, #0x0
 *     pop   {r3, r4, r5, pc}
 */

extern int func_ov002_02291050(int self, int arg);
extern int func_ov002_02294260(int self, int arg);

int func_ov002_022942e0(int self, int arg) {
    if (func_ov002_02291050(self, arg) != 0) {
        if (func_ov002_02294260(self, arg) != 0) return 1;
    }
    return 0;
}
