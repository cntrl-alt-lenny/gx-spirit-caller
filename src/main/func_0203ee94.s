; func_0203ee94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206df90
        .extern func_0206e7b0
        .global func_0203ee94
        .arm
func_0203ee94:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0206df90
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0xb
    ldmnefd sp!, {pc}
    bl func_0206e7b0
    cmp r0, #0x0
    beq .L_ac8
    mvn r1, #0x26
    cmp r0, r1
    bne .L_ad4
.L_ac8:
    add sp, sp, #0x4
    mov r0, #0x9
    ldmfd sp!, {pc}
.L_ad4:
    mov r0, #0xb
    add sp, sp, #0x4
    ldmfd sp!, {pc}
