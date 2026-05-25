/* func_02011b4c: u16-table lookup + tail-call.
 *
 *     ldr  r1, .L_02011b60    ; data_020b4a2c
 *     mov  r0, r0, lsl #0x1
 *     ldr  ip, .L_02011b64    ; func_020119dc
 *     ldrh r0, [r1, r0]
 *     bx   ip
 */

extern unsigned short func_020119dc(unsigned short v);
extern unsigned short data_020b4a2c[];

unsigned short func_02011b4c(int i) {
    return func_020119dc(data_020b4a2c[i]);
}
