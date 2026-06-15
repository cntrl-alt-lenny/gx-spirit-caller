; func_020a3e34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a98f8
        .extern func_020a3ed8
        .global func_020a3e34
        .arm
func_020a3e34:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, r1
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r6, r0
    ldr r1, [r1]
    ldrb r1, [r1, #0x50d]
    cmp r1, #0x0
    beq .L_3ac
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_3ac:
    mov r0, r5
    mov r2, r4
    mov r1, #0x8
    bl func_020a3ed8
    cmp r0, #0x0
    bne .L_3d8
    mov r0, r6
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_3d8:
    ldr r2, _LIT0
    mov r0, r6
    ldr r1, [r2]
    mov r3, #0x8
    strh r4, [r1, #0x10]
    ldr r1, [r2]
    add r1, r1, #0x500
    strh r5, [r1]
    ldr r1, [r2]
    add r1, r1, #0x500
    strh r3, [r1, #0x2]
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a98f8
