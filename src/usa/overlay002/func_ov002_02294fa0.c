/* func_ov002_02294fa0: family 2ca3cefd sibling of 022943f0 — same
 * inverted-polarity shape, second helper is func_ov002_022942b4.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     mov   r4, r1
 *     bl    func_ov002_02291050
 *     cmp   r0, #0x0
 *     beq   .L_zero
 *     mov   r0, r5
 *     mov   r1, r4
 *     bl    func_ov002_022942b4
 *     cmp   r0, #0x0
 *     movne r0, #0x1
 *     popne {r3, r4, r5, pc}
 *  .L_zero:
 *     mov   r0, #0x0
 *     pop   {r3, r4, r5, pc}
 */

extern int func_ov002_02291050(int self, int arg);
extern int func_ov002_022942b4(int self, int arg);

int func_ov002_02294fa0(int self, int arg) {
    if (func_ov002_02291050(self, arg) != 0) {
        if (func_ov002_022942b4(self, arg) != 0) return 1;
    }
    return 0;
}
