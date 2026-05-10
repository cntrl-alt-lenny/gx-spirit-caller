/* func_02001ba4: call(2) + Fill32(0, data_02102d04, 0x48).
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r0, #0x2
 *     bl    func_020068f4
 *     ldr   r1, .L_02001bc4
 *     mov   r0, #0x0
 *     mov   r2, #0x48
 *     bl    Fill32
 *     ldmia sp!, {r3, pc}
 *  .L_02001bc4: .word data_02102d04
 */

extern int  func_020068f4(int x);
extern void Fill32(int v, void *dst, int size);
extern char data_02102d04[];

void func_02001ba4(void) {
    func_020068f4(2);
    Fill32(0, data_02102d04, 0x48);
}
