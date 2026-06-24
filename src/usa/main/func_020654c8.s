; func_020654c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e888
        .extern func_0205405c
        .extern func_020540cc
        .extern func_0206551c
        .global func_020654c8
        .arm
func_020654c8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    bl func_020540cc
    subs r5, r0, #0x1
    addmi sp, sp, #0x4
    ldmmiia sp!, {r4, r5, pc}
    ldr r4, _LIT0
.L_770:
    ldr r0, [r4]
    mov r1, r5
    bl func_0205405c
    bl func_0206551c
    subs r5, r5, #0x1
    bpl .L_770
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219e888
