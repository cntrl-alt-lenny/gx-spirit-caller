; func_0206c380 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ecd8
        .extern func_0206c1b4
        .extern func_0206c2f4
        .extern func_0206e590
        .extern func_020945f4
        .global func_0206c380
        .arm
func_0206c380:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    bl func_0206c2f4
    mov r4, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r5, r0
    ldr r1, [r1]
    mov r0, r4
    ldr r1, [r1, #0x18]
    blx r1
    movs r6, r0
    beq .L_e4
    mov r2, r4
    mov r1, #0x0
    bl func_020945f4
    mov r0, r6
    mov r1, r7
    bl func_0206c1b4
    mov r0, r6
    bl func_0206e590
.L_e4:
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219ecd8
