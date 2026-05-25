/* func_02011b68: u16-table lookup + tail-call. Sibling of func_02011b4c
 * with a different callee target (func_02011a14 vs func_020119dc).
 *
 *     ldr  r1, .L_02011b7c    ; data_020b4a2c
 *     mov  r0, r0, lsl #0x1
 *     ldr  ip, .L_02011b80    ; func_02011a14
 *     ldrh r0, [r1, r0]
 *     bx   ip
 */

extern int func_02011a14(unsigned short v);
extern unsigned short data_020b4a2c[];

int func_02011b68(int i) {
    return func_02011a14(data_020b4a2c[i]);
}
