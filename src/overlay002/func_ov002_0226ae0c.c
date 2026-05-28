/* func_ov002_0226ae0c: C-42 — null-check + 4-arg helper.
 *
 *   push {r3, lr}
 *   cmp r1, #0; popeq
 *   mov r1, r1, lsl #0x10; mov r2, r1, lsr #0x10  ; r2 = (u16)v
 *   mov r1, #1; mov r3, #0x80
 *   bl func_ov002_0226acf8(r0_passthrough, 1, (u16)v, 0x80)
 *   pop
 */

extern void func_ov002_0226acf8(int r0, int r1, unsigned short r2, int r3);

void func_ov002_0226ae0c(int r0, unsigned int v) {
    if (v == 0) return;
    func_ov002_0226acf8(r0, 1, (unsigned short)v, 0x80);
}
