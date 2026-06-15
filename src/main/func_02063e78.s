; func_02063e78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061c5c
        .extern func_020643d8
        .global func_02063e78
        .arm
func_02063e78:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, [r0, #0xc]
    cmp r1, #0x1
    beq .L_200
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x4
    moveq r0, #0x0
    ldmfd sp!, {pc}
.L_200:
    mov r1, #0x0
    mov ip, #0x5
    mov r2, r1
    mov r3, r1
    str ip, [r0, #0xc]
    bl func_02061c5c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
