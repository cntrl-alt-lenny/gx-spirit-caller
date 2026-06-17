/* func_02011b34: u16-table lookup + tail-call. Sibling of func_02011b18
 * with a different callee target (func_020119e0 vs func_020119a8).
 *
 *     ldr  r1, .L_02011b7c    ; data_020b4938
 *     mov  r0, r0, lsl #0x1
 *     ldr  ip, .L_02011b80    ; func_020119e0
 *     ldrh r0, [r1, r0]
 *     bx   ip
 */

extern int func_020119e0(unsigned short v);
extern unsigned short data_020b4938[];

int func_02011b34(int i) {
    return func_020119e0(data_020b4938[i]);
}
