; func_0209a0a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8394
        .extern func_02096358
        .global func_0209a0a4
        .arm
func_0209a0a4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    mov r5, r1
    mov ip, #0x0
    mov r6, r0
    str r2, [r4, #0x10]
    strh ip, [r4, #0xc]
    strh r5, [r4, #0xe]
    strh r3, [r4, #0x14]
    cmp r3, #0x0
    bls .L_ec
    mov r1, ip
.L_d4:
    ldr r0, [r4, #0x10]
    add r0, r0, ip, lsl #0x3
    add ip, ip, #0x1
    strh r1, [r0, #0x4]
    cmp ip, r3
    bcc .L_d4
.L_ec:
    bl OS_DisableIrq
    mov r4, r0
    ldr r0, _LIT1
    and r1, r5, #0xff
    orr r1, r1, r0
    mov r0, #0x6
    mov r2, #0x0
    bl func_02096358
    cmp r0, #0x0
    movlt r0, #0x0
    blt .L_138
    ldr r1, _LIT2
    mov r0, #0x6
    orr r1, r6, r1
    mov r2, #0x0
    bl func_02096358
    cmp r0, #0x0
    movlt r0, #0x0
    movge r0, #0x1
.L_138:
    ands r0, r0, #0xff
    bne .L_180
    mov r0, r4
    bl OS_RestoreIrq
    ldr r0, _LIT0
    ldrh r1, [r0, #0x34]
    ldr r3, [r0]
    orr r1, r1, #0x2
    strh r1, [r0, #0x34]
    cmp r3, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r0, #0x1
    mov r1, #0x4
    mov r2, #0x0
    blx r3
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_180:
    ldr r1, _LIT0
    mov r0, r4
    ldrh r2, [r1, #0x36]
    orr r2, r2, #0x2
    strh r2, [r1, #0x36]
    ldrh r2, [r1, #0x34]
    bic r2, r2, #0x2
    strh r2, [r1, #0x34]
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a8394
_LIT1: .word 0x02000100
_LIT2: .word 0x01010000
