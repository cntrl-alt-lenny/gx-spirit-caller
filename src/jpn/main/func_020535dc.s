; func_020535dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053614
        .extern func_0205362c
        .global func_020535dc
        .arm
func_020535dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02053614
    cmp r0, #0x3
    bne .L_30
    mov r0, r4
    bl func_0205362c
    and r0, r0, #0x4
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_30:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
