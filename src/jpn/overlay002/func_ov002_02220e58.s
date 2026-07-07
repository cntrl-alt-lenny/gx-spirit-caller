; func_ov002_02220e58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021d5918
        .extern func_ov002_021d630c
        .extern func_ov002_021d6718
        .extern func_ov002_021e267c
        .global func_ov002_02220e58
        .arm
func_ov002_02220e58:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r8, #0x0
    ldr r7, _LIT0
    ldr fp, _LIT1
    mov sl, r0
    mov r9, r8
    mov r6, #0x2
    mov r5, #0x3
    mov r4, #0x1f4
.L_28:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    and r0, r1, #0x1
    mla r2, r0, fp, r7
    add r2, r2, r9
    ldr r0, [r2, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_c4
    ldrh r0, [r2, #0x36]
    cmp r0, #0x0
    ldrh r0, [r2, #0x38]
    beq .L_84
    cmp r0, #0x0
    moveq r3, #0x1
    movne r3, #0x0
    mov r0, sl
    mov r2, r8
    str r6, [sp]
    bl func_ov002_021d6718
    b .L_9c
.L_84:
    cmp r0, #0x0
    bne .L_9c
    mov r0, sl
    mov r2, r8
    mov r3, #0x2
    bl func_ov002_021d630c
.L_9c:
    str r5, [sp]
    str r4, [sp, #0x4]
    ldrh r1, [sl, #0x2]
    ldrh r3, [sl]
    mov r0, sl
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    mov r2, r8
    bl func_ov002_021d5918
.L_c4:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r9, r9, #0x14
    blt .L_28
    ldrh r0, [sl, #0x2]
    ldrh r1, [sl]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r3, #0x0
    bl func_ov002_021e267c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
