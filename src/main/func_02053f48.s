; func_02053f48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb04
        .extern data_020ffb30
        .extern func_02053b38
        .extern func_02053fc4
        .extern func_020a6d54
        .extern func_020b3870
        .global func_02053f48
        .arm
func_02053f48:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    movs r4, r2
    mov r6, r0
    mov r5, r1
    bne .L_178
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xb7
    bl func_020a6d54
.L_178:
    add r0, sp, #0x8
    str r4, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r6, #0x14]
    ldr r2, [r6]
    ldr r3, [r6, #0x8]
    mov r0, r5
    bl func_02053b38
    ldr r2, [r6, #0x14]
    ldr r1, [r6, #0x8]
    sub r0, r0, r2
    bl func_020b3870
    mov r2, r0
    mov r0, r6
    mov r1, r5
    bl func_02053fc4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ffb30
_LIT1: .word data_020ffb04
