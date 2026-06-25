; func_02087634 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a477c
        .extern data_021a4788
        .extern func_0207cef4
        .extern func_0207cf0c
        .extern func_020876a8
        .extern func_020876e0
        .global func_02087634
        .arm
func_02087634:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_0207cef4
    movs r4, r0
    bne .L_d4
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_0207cef4
    mov r4, r0
    ldrb r1, [r4, #0x3d]
    cmp r5, r1
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, pc}
    bl func_020876a8
.L_d4:
    ldr r0, _LIT0
    mov r1, r4
    bl func_0207cf0c
    mov r0, r4
    strb r5, [r4, #0x3d]
    bl func_020876e0
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021a477c
_LIT1: .word data_021a4788
