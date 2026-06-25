; func_02053c34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa20
        .extern data_020ffa24
        .extern func_0205405c
        .extern func_020a6c60
        .global func_02053c34
        .arm
func_02053c34:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r6, r1
    mov r7, r0
    mov r5, r2
    bne .L_a0
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x104
    bl func_020a6c60
.L_a0:
    ldr r0, [r7]
    subs r4, r0, #0x1
    addmi sp, sp, #0x4
    ldmmiia sp!, {r4, r5, r6, r7, pc}
.L_b0:
    mov r0, r7
    mov r1, r4
    bl func_0205405c
    mov r1, r5
    blx r6
    subs r4, r4, #0x1
    bpl .L_b0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ffa20
_LIT1: .word data_020ffa24
