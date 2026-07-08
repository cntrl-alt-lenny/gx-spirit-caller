; func_ov002_021b39e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b3414
        .extern func_ov002_021b3538
        .extern func_ov002_021b9dec
        .extern func_ov002_021e788c
        .global func_ov002_021b39e0
        .arm
func_ov002_021b39e0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x18
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_ov002_021b3538
    mov r4, r0
    add r3, sp, #0x0
    mov r2, #0x0
    mov r0, r8
    mov r1, r7
    str r2, [r3]
    str r2, [r3, #0x4]
    str r2, [r3, #0x8]
    str r2, [r3, #0xc]
    str r2, [r3, #0x10]
    str r2, [r3, #0x14]
    bl func_ov002_021b9dec
    ldrh r9, [sp, #0x2]
    mov r2, r8, lsl #0x10
    mov lr, r2, lsr #0x10
    bic sl, r9, #0x1
    and r9, lr, #0x1
    orr r9, sl, r9
    strh r9, [sp, #0x2]
    ldrh lr, [sp, #0x2]
    mov r2, r7, lsl #0x10
    mov ip, r2, lsr #0x10
    strh r0, [sp]
    ldr r2, _LIT0
    ldrh r3, [sp, #0x4]
    ldr r0, _LIT1
    ldr r9, _LIT2
    mov ip, ip, lsl #0x1b
    bic lr, lr, #0x3e
    orr lr, lr, ip, lsr #0x1a
    and ip, r8, #0x1
    mov r1, #0x14
    mla r9, ip, r9, r0
    mul r0, r7, r1
    add r1, r9, #0x30
    ldr r9, [r1, r0]
    strh lr, [sp, #0x2]
    mov r1, r9, lsl #0x2
    mov r1, r1, lsr #0x18
    ldrh ip, [sp, #0x2]
    mov r9, r9, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r9, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r0, ip, #0x3000
    and r3, r3, r2
    mov r1, r1, lsl #0x17
    orr r1, r3, r1, lsr #0x11
    strh r0, [sp, #0x2]
    strh r1, [sp, #0x4]
    cmp r4, r2, lsr #0x10
    beq .L_120
    mov r1, r4, asr #0x8
    mov r2, r8
    mov r3, r7
    and r0, r4, #0xff
    and r1, r1, #0xff
    bl func_ov002_021b3414
    cmp r0, #0xc
    cmpne r0, #0xd
    bne .L_120
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_120:
    add r0, sp, #0x0
    mov r1, r6
    mov r2, r5
    bl func_ov002_021e788c
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0xffff803f
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
