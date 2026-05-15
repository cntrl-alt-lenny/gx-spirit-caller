/* func_02011a08: search-and-return-index. For i in [0, 0x91),
 * call f2(p, f1(i)); if it returns zero, return i. Else return 0
 * after exhausting.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r5, r0                        ; save p
 *     mov   r4, #0x0                       ; i = 0
 *  .L_02011a48:
 *     mov   r0, r4
 *     bl    func_020119e0
 *     mov   r1, r0
 *     mov   r0, r5
 *     bl    func_020aae4c
 *     cmp   r0, #0x0
 *     moveq r0, r4
 *     ldmeqia sp!, {r3, r4, r5, pc}
 *     add   r4, r4, #0x1
 *     cmp   r4, #0x91
 *     blo   .L_02011a48
 *     mov   r0, #0x0
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern int func_020119e0(int i);
extern int func_020aae4c(void *p, int x);

int func_02011a08(void *p) {
    unsigned int i;
    for (i = 0; i < 0x91u; i++) {
        if (func_020aae4c(p, func_020119e0(i)) == 0) return i;
    }
    return 0;
}
