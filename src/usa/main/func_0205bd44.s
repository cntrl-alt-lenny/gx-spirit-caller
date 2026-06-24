; func_0205bd44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021009f8
        .extern data_02100a08
        .extern func_02045364
        .extern func_02054de0
        .extern func_02054dfc
        .extern func_020a6c60
        .global func_0205bd44
        .arm
func_0205bd44:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r1
    ldr r1, [r5]
    ldr r2, [r0]
    cmp r1, #0x3
    bne .L_80
    ldr r0, [r2, #0x210]
    ldr r4, [r5, #0x4]
    sub r0, r0, #0x1
    str r0, [r2, #0x210]
    ldr r0, [r2, #0x210]
    cmp r0, #0x0
    bge .L_4c
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xb6
    bl func_020a6c60
.L_4c:
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_02054de0
    ldr r0, [r4, #0x4]
    bl func_02054dfc
    ldr r0, [r4, #0x18]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x8]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_80:
    ldr r0, [r5, #0x4]
    bl func_02045364
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x4]
    bl func_02045364
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02100a08
_LIT1: .word data_021009f8
