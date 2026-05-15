/* func_02082170: bit-pack: `data[a] = b | (a << 30)`.
 *
 *     ldr r2, =data
 *     orr r1, r1, r0, lsl #0x1e   ; r1 = b | (a << 30)
 *     str r1, [r2, r0, lsl #0x2]  ; data[a] = r1
 *     bx lr
 */

extern unsigned int data_021a1880[];
void func_02082170(unsigned int a, unsigned int b) {
    data_021a1880[a] = b | (a << 30);
}
