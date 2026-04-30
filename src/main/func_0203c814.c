/* func_0203c814: `x > 2 ? (x - 3) & 0xff : x`.
 *
 *     cmp r0, #2
 *     subhi r0, r0, #3       ; if x > 2: r0 = x - 3
 *     andhi r0, r0, #0xff    ; if x > 2: r0 &= 0xff
 *     bx lr
 */
unsigned int func_0203c814(unsigned int x) {
    if (x > 2) return (x - 3) & 0xff;
    return x;
}
