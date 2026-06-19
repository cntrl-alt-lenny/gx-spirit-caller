/* func_ov005_021aa3d0: Fill32 a 0x5c-byte global, return 1.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_021aa4cc            ; &data_ov005_021b1c4c
 *     mov   r0, #0x0
 *     mov   r2, #0x5c
 *     bl    Fill32
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void Fill32(unsigned int value, void *dest, int size_bytes);
extern char data_ov005_021b1c4c[];

int func_ov005_021aa3d0(void) {
    Fill32(0, data_ov005_021b1c4c, 0x5c);
    return 1;
}
