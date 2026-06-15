; func_02053eb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb04
        .extern data_020ffb10
        .extern func_020540d0
        .extern func_020a6d54
        .extern func_020a7388
        .global func_02053eb4
        .arm
func_02053eb4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r7, r1
    mov r4, r0
    bmi .L_d8
    ldr r0, [r4]
    cmp r7, r0
    blt .L_ec
.L_d8:
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xc0
    bl func_020a6d54
.L_ec:
    ldr r0, [r4]
    sub r6, r0, #0x1
    cmp r7, r6
    bge .L_130
    mov r0, r4
    mov r1, r7
    bl func_020540d0
    mov r5, r0
    mov r0, r4
    add r1, r7, #0x1
    bl func_020540d0
    mov r1, r0
    ldr r3, [r4, #0x8]
    sub r0, r6, r7
    mul r2, r3, r0
    mov r0, r5
    bl func_020a7388
.L_130:
    ldr r0, [r4]
    sub r0, r0, #0x1
    str r0, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ffb10
_LIT1: .word data_020ffb04
