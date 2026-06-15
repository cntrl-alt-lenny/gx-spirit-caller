; func_02089df8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02089008
        .extern func_02089024
        .extern func_020893f0
        .extern func_02089bd4
        .extern func_02089f60
        .global func_02089df8
        .arm
func_02089df8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_02089024
    movs r4, r0
    bne .L_1ec
    cmp r5, #0x0
    moveq r2, #0x0
    beq .L_1b8
    bl func_020893f0
    mov r2, r0
.L_1b8:
    ldr r1, _LIT0
    mov r0, r7
    mov r3, r7
    str r6, [sp]
    bl func_02089f60
    mov r4, r0
    cmp r5, #0x0
    beq .L_1ec
    cmp r4, #0x0
    beq .L_1ec
    mov r0, r7
    mov r1, r4
    bl func_02089008
.L_1ec:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_02089bd4
