/* func_ov002_021efc64: Same guard-chain-then-inverted-func_ov002_021c1e44 shape as func_ov002_021f0174, with an added leading bitfield check.
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_021c1e44(void);
extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a2[];

asm void func_ov002_021efc64(void) {
    nofralloc
    stmdb sp!, {r4, lr}
    ldrh    r3, [r0, #2]
    mov r3, r3, lsl #31
    cmp r1, r3, lsr #31
    moveq   r0, #0
    ldmeqia sp!, {r4, pc}
    cmp r2, #5
    movge   r0, #0
    ldmgeia sp!, {r4, pc}
    ldr ip, =0x00000868
    and lr, r1, #1
    mul r4, lr, ip
    mov r3, #20
    mul lr, r2, r3
    ldr ip, =data_ov002_022cf16c
    add r3, ip, r4
    add r3, r3, lr
    ldr r3, [r3, #48]
    mov r3, r3, lsl #19
    movs r3, r3, lsr #19
    moveq   r0, #0
    ldmeqia sp!, {r4, pc}
    ldr r3, =data_ov002_022cf1a2
    add r3, r3, r4
    ldrh    r3, [lr, r3]
    cmp r3, #0
    moveq   r0, #0
    ldmeqia sp!, {r4, pc}
    bl  func_ov002_021c1e44
    cmp r0, #0
    moveq   r0, #1
    movne   r0, #0
    ldmia sp!, {r4, pc}
}
