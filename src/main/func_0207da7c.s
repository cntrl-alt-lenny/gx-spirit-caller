; func_0207da7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207db44
        .extern func_0207db74
        .global func_0207da7c
        .arm
func_0207da7c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r0
    ands r1, r4, #0x1
    beq .L_1c
    bl func_0207db74
.L_1c:
    ands r0, r4, #0x2
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, r5
    bl func_0207db44
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
