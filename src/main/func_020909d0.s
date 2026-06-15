; func_020909d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020937d0
        .extern func_020937e4
        .extern func_020947c8
        .global func_020909d0
        .arm
func_020909d0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    movs r6, r3
    mov r9, r0
    mov r8, r1
    mov r7, r2
    beq .L_28
    bl func_020937d0
    mov r5, r0
    b .L_30
.L_28:
    bl OS_DisableIrq
    mov r5, r0
.L_30:
    mov r0, r9
    mov r1, r8
    bl func_020947c8
    movs r4, r0
    bne .L_54
    cmp r7, #0x0
    beq .L_50
    blx r7
.L_50:
    strh r9, [r8, #0x4]
.L_54:
    cmp r6, #0x0
    beq .L_68
    mov r0, r5
    bl func_020937e4
    b .L_70
.L_68:
    mov r0, r5
    bl OS_RestoreIrq
.L_70:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
