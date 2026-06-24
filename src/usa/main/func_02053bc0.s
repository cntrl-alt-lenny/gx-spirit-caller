; func_02053bc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa20
        .extern data_020ffa24
        .extern func_0205405c
        .extern func_020a6c60
        .global func_02053bc0
        .arm
func_02053bc0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r7, r1
    mov r8, r0
    mov r6, r2
    bne .L_28
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6c60
.L_28:
    ldr r0, [r8]
    subs r5, r0, #0x1
    bmi .L_60
.L_34:
    mov r0, r8
    mov r1, r5
    bl func_0205405c
    mov r1, r6
    mov r4, r0
    blx r7
    cmp r0, #0x0
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    subs r5, r5, #0x1
    bpl .L_34
.L_60:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020ffa20
_LIT1: .word data_020ffa24
_LIT2: .word 0x00000121
