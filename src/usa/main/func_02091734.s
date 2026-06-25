; func_02091734 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a62f0
        .extern data_021a6300
        .extern func_02091ea0
        .extern func_02091fd4
        .global func_02091734
        .arm
func_02091734:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r2, _LIT0
    mov r6, r0
    mov r5, r1
    ldr r8, [r2, #0x8]
    mov r7, #0x0
    bl OS_DisableIrq
    mov r4, r0
    b .L_2c
.L_24:
    mov r7, r8
    ldr r8, [r8, #0x68]
.L_2c:
    cmp r8, #0x0
    beq .L_3c
    cmp r8, r6
    bne .L_24
.L_3c:
    cmp r8, #0x0
    beq .L_50
    ldr r0, _LIT1
    cmp r8, r0
    bne .L_64
.L_50:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_64:
    ldr r0, [r8, #0x70]
    cmp r0, r5
    beq .L_98
    cmp r7, #0x0
    ldreq r1, [r6, #0x68]
    ldreq r0, _LIT0
    streq r1, [r0, #0x8]
    ldrne r0, [r6, #0x68]
    strne r0, [r7, #0x68]
    mov r0, r6
    str r5, [r6, #0x70]
    bl func_02091fd4
    bl func_02091ea0
.L_98:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a62f0
_LIT1: .word data_021a6300
