/* func_02019088: (x + func_02019034(x)) mod 7 — magic-number divide.
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     bl    func_02019034
 *     add   ip, r4, r0
 *     ldr   r3, .L_020190bc       ; 0x92492493 (magic for /7)
 *     lsr   r1, ip, #0x1f
 *     smull r2, r0, r3, ip
 *     add   r0, ip, r0
 *     add   r0, r1, r0, asr #0x2
 *     mov   r2, #0x7
 *     smull r0, r1, r2, r0
 *     sub   r0, ip, r0
 *     pop   {r4, pc}
 */

extern int func_02019034(int x);

int func_02019088(int x) {
    int y = x + func_02019034(x);
    return y % 7;
}
