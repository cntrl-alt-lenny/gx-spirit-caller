; func_020453fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dac8
        .extern data_0219dacc
        .extern func_02094688
        .global func_020453fc
        .arm
func_020453fc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr ip, _LIT0
    mov r4, r2
    mov r7, r3
    mov r5, r1
    ldr r2, [sp, #0x18]
    ldr r3, [ip]
    mov r1, r7
    mov r8, r0
    blx r3
    movs r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r5, #0x0
    beq .L_64
    mov r0, r5
    mov r1, r6
    mov r2, r7
    bl func_02094688
    ldr r1, _LIT1
    mov r0, r8
    ldr r3, [r1]
    mov r1, r5
    mov r2, r4
    blx r3
.L_64:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219dacc
_LIT1: .word data_0219dac8
