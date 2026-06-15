; func_0203db24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206df90
        .extern func_0206e7b0
        .global func_0203db24
        .arm
func_0203db24:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0206df90
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    bl func_0206e7b0
    cmp r0, #0x0
    beq .L_478
    mvn r1, #0x26
    cmp r0, r1
    bne .L_484
.L_478:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_484:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
