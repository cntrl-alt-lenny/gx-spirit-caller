/* func_02011b18: u16-table lookup + tail-call.
 *
 *     ldr  r1, .L_02011b60    ; data_020b4938
 *     mov  r0, r0, lsl #0x1
 *     ldr  ip, .L_02011b64    ; func_020119a8
 *     ldrh r0, [r1, r0]
 *     bx   ip
 */

extern unsigned short func_020119a8(unsigned short v);
extern unsigned short data_020b4938[];

unsigned short func_02011b18(int i) {
    return func_020119a8(data_020b4938[i]);
}
