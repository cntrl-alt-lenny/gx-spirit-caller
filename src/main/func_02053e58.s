; func_02053e58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb04
        .extern data_020ffb10
        .extern func_02053eb4
        .extern func_02054314
        .extern func_020a6d54
        .global func_02053e58
        .arm
func_02053e58:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r4, r1
    mov r5, r0
    bmi .L_7c
    ldr r0, [r5]
    cmp r4, r0
    blt .L_90
.L_7c:
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xca
    bl func_020a6d54
.L_90:
    mov r0, r5
    mov r1, r4
    bl func_02054314
    mov r0, r5
    mov r1, r4
    bl func_02053eb4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffb10
_LIT1: .word data_020ffb04
