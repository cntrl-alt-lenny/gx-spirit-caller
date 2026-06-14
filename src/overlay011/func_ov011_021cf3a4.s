; func_ov011_021cf3a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov011_021d0ffc
        .extern func_ov011_021d1028
        .global func_ov011_021cf3a4
        .arm
func_ov011_021cf3a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov011_021d0ffc
    cmp r0, #0x1
    bne .L_30
    mov r0, r4
    bl func_ov011_021d1028
    cmp r0, #0x1
    cmpne r0, #0x3
    bne .L_30
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_30:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
