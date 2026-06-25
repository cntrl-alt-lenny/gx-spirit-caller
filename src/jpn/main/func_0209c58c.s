; func_0209c58c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a62f0
        .extern data_021a83e0
        .extern func_02000b60
        .extern func_020918f0
        .extern func_02091924
        .extern func_020919a4
        .extern func_02093b08
        .extern func_0209bfac
        .extern func_0209c270
        .extern func_0209d194
        .global func_0209c58c
        .arm
func_0209c58c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, _LIT0
    ldr r7, _LIT1
    bl func_02000b60
    cmp r5, #0x0
    bne .L_340
    bl func_02093b08
.L_340:
    bl func_0209bfac
    bl OS_DisableIrq
    ldr r1, [r7, #0x114]
    mov r4, r0
    ands r0, r1, #0x4
    beq .L_370
    add r6, r7, #0x10c
.L_35c:
    mov r0, r6
    bl func_020919a4
    ldr r0, [r7, #0x114]
    ands r0, r0, #0x4
    bne .L_35c
.L_370:
    ldr r0, [r7, #0x114]
    mov r1, #0x0
    orr r0, r0, #0x4
    str r0, [r7, #0x114]
    str r1, [r7, #0x38]
    mov r0, r4
    str r1, [r7, #0x3c]
    bl OS_RestoreIrq
    mov r0, r5
    bl func_0209c270
    ldr r0, _LIT2
    ldr r1, _LIT1
    ldr r2, [r0, #0x4]
    mov r0, r7
    str r2, [r1, #0x104]
    mov r1, #0x2
    mov r2, #0x1
    bl func_0209d194
    ldr r0, [r7]
    mov r1, #0x0
    str r1, [r0, #0xc]
    ldr r0, [r7]
    add r1, r7, #0x120
    str r1, [r0, #0x10]
    ldr r1, [r7]
    mov r2, #0x1
    mov r0, r7
    str r2, [r1, #0x14]
    mov r1, #0x6
    bl func_0209d194
    ldr r6, [r7, #0x38]
    ldr r5, [r7, #0x3c]
    bl OS_DisableIrq
    mov r4, r0
    ldr r1, [r7, #0x114]
    add r0, r7, #0x10c
    bic r1, r1, #0x4c
    str r1, [r7, #0x114]
    bl func_02091924
    ldr r0, [r7, #0x114]
    ands r0, r0, #0x10
    beq .L_420
    add r0, r7, #0x44
    bl func_020918f0
.L_420:
    mov r0, r4
    bl OS_RestoreIrq
    cmp r6, #0x0
    beq .L_438
    mov r0, r5
    blx r6
.L_438:
    ldr r0, [r7]
    ldr r0, [r0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x02000c1c
_LIT1: .word data_021a83e0
_LIT2: .word data_021a62f0
