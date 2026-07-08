; func_ov002_0224d850 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202b86c
        .extern func_ov002_021e788c
        .extern func_ov002_02253370
        .global func_ov002_0224d850
        .arm
func_ov002_0224d850:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    add r4, sp, #0x0
    mov r5, #0x0
    mov sl, r0
    str r5, [r4]
    ldrh r1, [sp, #0x2]
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x2]
    ldrh r1, [sp, #0x2]
    ldr r0, _LIT0
    and r3, sl, #0x1
    bic r1, r1, #0x3e
    orr r1, r1, #0x16
    strh r1, [sp, #0x2]
    mul r1, r3, r0
    ldrh r6, [sp, #0x2]
    ldr r0, _LIT1
    mov r9, r2
    ldr r0, [r0, r1]
    bic r3, r6, #0x3000
    strh r3, [sp, #0x2]
    cmp r0, #0x0
    addls sp, sp, #0x18
    str r5, [r4, #0x4]
    str r5, [r4, #0x8]
    str r5, [r4, #0xc]
    str r5, [r4, #0x10]
    str r5, [r4, #0x14]
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    ldr fp, _LIT3
    add r8, r0, r1
    add r0, r8, #0x18
    add r7, r0, #0x400
.L_9c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202b86c
    cmp r0, #0x3
    bne .L_118
    ldr r2, [r7]
    ldrh r0, [sp, #0x4]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    and r2, r0, fp
    mov r0, r1, lsl #0x17
    orr r3, r2, r0, lsr #0x11
    mov r0, r4
    mov r1, sl
    mov r2, r9
    strh r6, [sp]
    strh r3, [sp, #0x4]
    bl func_ov002_021e788c
    cmp r0, #0x1
    bne .L_118
    mov r0, sl
    mov r1, #0xe
    mov r2, r5
    bl func_ov002_02253370
.L_118:
    ldr r0, [r8, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x4
    bcc .L_9c
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0xffff803f
