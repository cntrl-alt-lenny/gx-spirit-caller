; func_0205261c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3ec
        .extern func_02052160
        .extern func_02052218
        .global func_0205261c
        .arm
func_0205261c:
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
    beq .L_2cc
    bl func_02052218
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_2cc:
    bl func_02052160
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219e3ec
