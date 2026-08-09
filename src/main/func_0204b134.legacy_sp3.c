/* func_0204b134: linear scan over a global table's parallel arrays.
 *
 *     stmdb sp!, {r4, r5, lr}; sub sp, sp, #0x4
 *     cmp r1, #0x0; moveq r4, #0x1; mov r5, r0; movne r4, #0x0
 *     bl func_020498f0
 *     ldrb r0, [r0, #0xd]
 *     cmp r4, r0
 *     bgt .L_c8
 *   .L_8c:
 *     bl func_020498f0
 *     add r0, r0, r4, lsl #0x2; ldr r0, [r0, #0xf4]
 *     cmp r5, r0
 *     bne .L_b4
 *     bl func_020498f0
 *     add r0, r0, r4
 *     ldrb r0, [r0, #0x2d0]
 *     ldmia sp!, {r4, r5, pc}
 *   .L_b4:
 *     add r4, r4, #0x1
 *     bl func_020498f0
 *     ldrb r0, [r0, #0xd]
 *     cmp r4, r0
 *     ble .L_8c
 *   .L_c8:
 *     mov r0, #0xff
 *     ldmia sp!, {r4, r5, pc}
 *
 * func_020498f0() is a no-arg singleton accessor re-invoked at every use
 * (mwcc never caches the pointer across calls), returning a struct with a
 * byte count at 0xd, a 4-byte-stride array at 0xf4, and a byte array at
 * 0x2d0. Classic mwcc loop rotation: upfront guard test, do-while body.
 */

struct S020498f0 {
    unsigned char pad_00[0x0d];
    unsigned char count;      /* 0x0d */
    unsigned char pad_0e[0xf4 - 0x0e];
    int arr_f4[1];              /* 0xf4 */
    unsigned char pad_f8[0x2d0 - 0xf8];
    unsigned char arr_2d0[1];     /* 0x2d0 */
};

extern struct S020498f0 *func_020498f0(void);

int func_0204b134(int in, int flag) {
    int i;

    for (i = (flag == 0) ? 1 : 0; i <= func_020498f0()->count; i++) {
        if (in == func_020498f0()->arr_f4[i]) {
            return func_020498f0()->arr_2d0[i];
        }
    }
    return 0xff;
}
