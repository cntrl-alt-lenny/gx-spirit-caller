/* func_02034160: return 1 if 3 <= arg <= 5, else 0.
 *
 *     sub r0, r0, #0x3
 *     cmp r0, #0x2
 *     movls r0, #0x1     ; if (r0 - 3) <= 2 unsigned → 1
 *     movhi r0, #0x0
 *     bx  lr
 */

int func_02034160(unsigned int x) {
    return (x - 3) <= 2;
}
