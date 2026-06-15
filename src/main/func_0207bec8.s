; func_0207bec8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a088c
        .extern func_0207ab68
        .extern func_0207b038
        .extern func_0209f0d8
        .global func_0207bec8
        .arm
func_0207bec8:
    stmdb sp!, {r4, lr}
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_8c8
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_8c8:
    add r1, r1, #0x2000
    ldr r1, [r1, #0x260]
    cmp r1, #0x1
    beq .L_8f8
    cmp r1, #0x3
    beq .L_918
    cmp r1, #0x4
    bne .L_908
    bl OS_RestoreIrq
    mov r0, #0x2
    ldmia sp!, {r4, lr}
    bx lr
.L_8f8:
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
.L_908:
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_918:
    ldr r0, _LIT1
    bl func_0209f0d8
    cmp r0, #0x2
    beq .L_93c
    cmp r0, #0x3
    beq .L_970
    cmp r0, #0x8
    beq .L_95c
    b .L_970
.L_93c:
    mov r0, #0x4
    bl func_0207b038
    ldr r0, _LIT0
    mov r1, #0x2
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_98c
.L_95c:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x4
    ldmia sp!, {r4, lr}
    bx lr
.L_970:
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, lr}
    bx lr
.L_98c:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word func_0207ab68
