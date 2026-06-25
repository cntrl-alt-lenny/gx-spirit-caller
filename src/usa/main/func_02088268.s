; func_02088268 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a5058
        .extern data_021a50a4
        .extern func_0207d044
        .extern func_02087260
        .extern func_02087fd4
        .extern func_02088088
        .extern func_020881ec
        .extern func_02094d9c
        .extern func_02094eac
        .extern func_020b3988
        .global func_02088268
        .arm
func_02088268:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    mov sl, r0
    ldr r4, [sl, #0x24]
    mov r9, r1
    mov r1, r4, lsl #0x1f
    movs r1, r1, asr #0x1f
    ldr r1, [sp, #0x4c]
    str r2, [sp, #0x18]
    mov r4, r3
    str r1, [sp, #0x4c]
    beq .L_34
    bl func_020881ec
.L_34:
    ldr r0, [sp, #0x4c]
    ldr r2, [sl, #0x48]
    mov r0, r0, lsl #0x5
    mul r1, r2, r0
    mov r0, r4
    bl func_020b3988
    ldr r1, [sp, #0x4c]
    ldr r2, [sp, #0x48]
    mul r1, r0, r1
    mov r0, r1, lsl #0x5
    str r0, [sl, #0x28]
    ldr r0, [sl, #0x28]
    cmp r9, #0x1
    moveq r0, r0, lsr #0x1
    mul r0, r2, r0
    ldr r1, [sp, #0x4c]
    bl func_020b3988
    str r0, [sp, #0x1c]
    bl func_02087260
    str r0, [sl, #0x40]
    ldr r0, [sl, #0x40]
    cmp r0, #0x0
    addlt sp, sp, #0x24
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sl, #0x48]
    mov r8, #0x0
    cmp r0, #0x0
    ble .L_128
    ldr r0, [sp, #0x48]
    mov r7, r0, lsl #0x5
    ldr r6, _LIT0
    mov r5, r8
    mov r4, #0x7f
    mov fp, #0x40
    mov r0, #0x1
    str r0, [sp, #0x20]
.L_c8:
    ldr r2, [sl, #0x28]
    ldr r1, [sp, #0x18]
    add r0, sl, r8
    mla r1, r2, r8, r1
    ldrb r0, [r0, #0x4c]
    ldr r3, [sp, #0x20]
    str r1, [r6, r0, lsl #0x3]
    add r1, r6, r0, lsl #0x3
    str r5, [r1, #0x4]
    str r5, [sp]
    ldr r2, [sl, #0x28]
    mov r1, r9
    mov r2, r2, lsr #0x2
    str r2, [sp, #0x4]
    str r4, [sp, #0x8]
    str r5, [sp, #0xc]
    str r7, [sp, #0x10]
    str fp, [sp, #0x14]
    ldr r2, [r6, r0, lsl #0x3]
    bl func_02094d9c
    ldr r0, [sl, #0x48]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_c8
.L_128:
    str sl, [sp]
    ldr r1, [sp, #0x1c]
    ldr r0, [sl, #0x40]
    ldr r3, _LIT1
    mov r2, r1
    bl func_02094eac
    ldr r0, _LIT2
    mov r1, sl
    bl func_0207d044
    ldr r0, [sp, #0x4c]
    str r9, [sl, #0x20]
    str r0, [sl, #0x2c]
    ldr r1, [sp, #0x50]
    ldr r0, [sp, #0x54]
    str r1, [sl, #0x30]
    str r0, [sl, #0x34]
    mov r0, #0x0
    str r0, [sl, #0x38]
    str r0, [sl, #0x3c]
    ldr r0, [sl, #0x24]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [sl, #0x24]
    bl OS_DisableIrq
    mov r4, r0
    mov r2, #0x1
    mov r0, sl
    mov r1, #0x0
    str r2, [sl, #0x2c]
    bl func_02087fd4
    ldr r1, [sp, #0x4c]
    mov r0, r4
    str r1, [sl, #0x2c]
    bl OS_RestoreIrq
    mov r0, #0x1
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021a50a4
_LIT1: .word func_02088088
_LIT2: .word data_021a5058
