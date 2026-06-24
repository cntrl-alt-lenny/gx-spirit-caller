; func_02089d10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02088f20
        .extern func_02088f3c
        .extern func_02089308
        .extern func_02089aec
        .extern func_02089e78
        .global func_02089d10
        .arm
func_02089d10:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_02088f3c
    movs r4, r0
    bne .L_188
    cmp r5, #0x0
    moveq r2, #0x0
    beq .L_154
    bl func_02089308
    mov r2, r0
.L_154:
    ldr r1, _LIT0
    mov r0, r7
    mov r3, r7
    str r6, [sp]
    bl func_02089e78
    mov r4, r0
    cmp r5, #0x0
    beq .L_188
    cmp r4, #0x0
    beq .L_188
    mov r0, r7
    mov r1, r4
    bl func_02088f20
.L_188:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_02089aec
