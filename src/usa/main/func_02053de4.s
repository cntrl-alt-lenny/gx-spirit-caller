; func_02053de4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa24
        .extern data_020ffa30
        .extern func_02053e40
        .extern func_020542a0
        .extern func_020a6c60
        .global func_02053de4
        .arm
func_02053de4:
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
    bl func_020a6c60
.L_90:
    mov r0, r5
    mov r1, r4
    bl func_020542a0
    mov r0, r5
    mov r1, r4
    bl func_02053e40
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffa30
_LIT1: .word data_020ffa24
