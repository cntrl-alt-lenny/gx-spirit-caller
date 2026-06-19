/* func_02001b84: call(2) + Fill32(0, data_02102c24, 0x48).
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r0, #0x2
 *     bl    func_020068d8
 *     ldr   r1, .L_02001bc4
 *     mov   r0, #0x0
 *     mov   r2, #0x48
 *     bl    Fill32
 *     ldmia sp!, {r3, pc}
 *  .L_02001bc4: .word data_02102c24
 */

extern int  func_020068d8(int x);
extern void Fill32(int v, void *dst, int size);
extern char data_02102c24[];

void func_02001b84(void) {
    func_020068d8(2);
    Fill32(0, data_02102c24, 0x48);
}
