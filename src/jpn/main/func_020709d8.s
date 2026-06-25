; func_020709d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020917e8
        .extern func_020919a4
        .global func_020709d8
        .arm
func_020709d8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r1
    ldr r1, [r4, #0x44]
    mov r5, r0
    cmp r1, #0x0
    bne .L_68
    ldrb r0, [r4, #0x8]
    cmp r0, #0x4
    bne .L_68
    bl OS_DisableIrq
    mov r8, r0
    mov r7, #0x2
    mov r6, #0x0
    b .L_44
.L_38:
    mov r0, r6
    str r7, [r4, #0x4]
    bl func_020919a4
.L_44:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    bne .L_5c
    ldrb r0, [r4, #0x8]
    cmp r0, #0x4
    beq .L_38
.L_5c:
    mov r0, r8
    bl OS_RestoreIrq
    b .L_6c
.L_68:
    bl func_020917e8
.L_6c:
    ldr r0, [r4, #0x44]
    str r0, [r5]
    ldr r0, [r5]
    cmp r0, #0x0
    ldrne r0, [r4, #0x40]
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
