; func_0205bdb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100ad8
        .extern data_02100ae8
        .extern func_020453b4
        .extern func_02054e54
        .extern func_02054e70
        .extern func_020a6d54
        .global func_0205bdb8
        .arm
func_0205bdb8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r1
    ldr r1, [r5]
    ldr r2, [r0]
    cmp r1, #0x3
    bne .L_f6c
    ldr r0, [r2, #0x210]
    ldr r4, [r5, #0x4]
    sub r0, r0, #0x1
    str r0, [r2, #0x210]
    ldr r0, [r2, #0x210]
    cmp r0, #0x0
    bge .L_f38
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xb6
    bl func_020a6d54
.L_f38:
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_02054e54
    ldr r0, [r4, #0x4]
    bl func_02054e70
    ldr r0, [r4, #0x18]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x8]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_f6c:
    ldr r0, [r5, #0x4]
    bl func_020453b4
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x4]
    bl func_020453b4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02100ae8
_LIT1: .word data_02100ad8
