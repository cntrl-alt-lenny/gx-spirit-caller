/* func_ov007_021b2468: zero-fill ov007 data + clear 2 fields, return 1.
 *
 *     stmdb sp!, {r4, lr}
 *     ldr   r1, .L_021b2594            ; r1 = &data_ov007_022333d0
 *     mov   r4, r0                     ; cache obj
 *     mov   r0, #0x0
 *     mov   r2, #0x50
 *     bl    Fill32
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x34]            ; obj[0x34] = 0
 *     str   r0, [r4, #0x38]            ; obj[0x38] = 0
 *     mov   r0, #0x1
 *     ldmia sp!, {r4, pc}
 */

extern void Fill32(unsigned int value, void *dest, int size_bytes);
extern char data_ov007_022333d0[];

int func_ov007_021b2468(void *obj) {
    Fill32(0, data_ov007_022333d0, 0x50);
    *(int *)((char *)obj + 0x34) = 0;
    *(int *)((char *)obj + 0x38) = 0;
    return 1;
}
