; func_020525a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e30c
        .extern func_020520ec
        .extern func_020521a4
        .global func_020525a8
        .arm
func_020525a8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr ip, _LIT0
    ldr ip, [ip]
    cmp ip, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    cmp r3, #0x0
    beq .L_48
    bl func_020521a4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_48:
    bl func_020520ec
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219e30c
