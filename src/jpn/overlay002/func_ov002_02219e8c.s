; func_ov002_02219e8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern func_ov002_021bcf50
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5c58
        .extern func_ov002_021d6f64
        .extern func_ov002_021de390
        .extern func_ov002_02210014
        .global func_ov002_02219e8c
        .arm
func_ov002_02219e8c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldrh r4, [r6, #0x2]
    mov r2, r4, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x2
    bne .L_438
    mov r2, r4, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r5, _LIT0
    ldr r2, _LIT1
    and r3, r3, #0x1
    mla ip, r3, r2, r5
    mov r4, r4, lsl #0x1a
    mov r5, r4, lsr #0x1b
    mov r2, #0x14
    ldrh r3, [r6, #0x4]
    mul r2, r5, r2
    mov r4, r3, lsl #0x11
    add r3, ip, #0x30
    ldr r3, [r3, r2]
    mov r4, r4, lsr #0x17
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r4, r2
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    bl func_ov002_02210014
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_438:
    mov r0, r4, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcf50
    movs r5, r0
    bmi .L_4fc
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT2
    and r4, r5, #0xff
    mov r2, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r0, [r0, #0x4]
    mov r3, r2, lsr #0x1f
    mov r2, r1, lsr #0x1b
    and r0, r0, #0xff
    orr r0, r0, r4, lsl #0x8
    mov r1, r0, lsl #0x10
    and r3, r3, #0xff
    and r0, r2, #0xff
    orr r0, r3, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d6f64
    ldr r0, _LIT2
    ldrh r3, [r6, #0x2]
    ldr r1, [r0, #0x4]
    ldr r2, [r0]
    ldr r0, [r0, #0x1c]
    and r1, r1, #0xff
    orr r1, r1, r4, lsl #0x8
    mov r3, r3, lsl #0x1f
    mov r1, r1, lsl #0x10
    and r2, r2, #0xff
    and r0, r0, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d5c58
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    ldrh r2, [r6]
    ldr r0, [r0, #0x4]
    mov r1, r5
    mov r3, #0x21
    bl func_ov002_021d58dc
    b .L_51c
.L_4fc:
    ldrh r0, [r6, #0x2]
    ldrh r3, [r6]
    mov r2, #0x0
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021de390
.L_51c:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x1f
    bl func_ov002_021d46ac
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cd314
