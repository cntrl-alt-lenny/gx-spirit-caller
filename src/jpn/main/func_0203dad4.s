; func_0203dad4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206df1c
        .extern func_0206e73c
        .global func_0203dad4
        .arm
func_0203dad4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0206df1c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    bl func_0206e73c
    cmp r0, #0x0
    beq .L_34
    mvn r1, #0x26
    cmp r0, r1
    bne .L_40
.L_34:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_40:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
