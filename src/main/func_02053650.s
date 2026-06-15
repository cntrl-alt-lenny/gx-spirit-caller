; func_02053650 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053688
        .extern func_020536a0
        .global func_02053650
        .arm
func_02053650:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02053688
    cmp r0, #0x3
    bne .L_30
    mov r0, r4
    bl func_020536a0
    and r0, r0, #0x4
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_30:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
