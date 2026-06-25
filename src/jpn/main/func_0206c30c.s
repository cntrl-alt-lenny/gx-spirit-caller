; func_0206c30c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ebf8
        .extern func_0206c140
        .extern func_0206c280
        .extern func_0206e51c
        .extern func_02094500
        .global func_0206c30c
        .arm
func_0206c30c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    bl func_0206c280
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
    bl func_02094500
    mov r0, r6
    mov r1, r7
    bl func_0206c140
    mov r0, r6
    bl func_0206e51c
.L_e4:
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219ebf8
