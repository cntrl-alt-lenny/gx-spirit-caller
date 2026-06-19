/* func_ov002_02296b88: family 2244716a sibling of 02292a64 — same
 * shape, tail helper is func_ov002_02291104.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     mov   r4, r1
 *     bl    func_ov002_02291138
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     popeq {r3, r4, r5, pc}     ; if (... == 0) return 0
 *     mov   r0, r5
 *     mov   r1, r4
 *     bl    func_ov002_02291104  ; return func_ov002_02291104(self, arg)
 *     pop   {r3, r4, r5, pc}
 */

extern int func_ov002_02291138(int self, int arg);
extern int func_ov002_02291104(int self, int arg);

int func_ov002_02296b88(int self, int arg) {
    if (func_ov002_02291138(self, arg) == 0) return 0;
    return func_ov002_02291104(self, arg);
}
