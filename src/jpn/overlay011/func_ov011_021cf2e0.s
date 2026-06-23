; func_ov011_021cf2e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov011_021d0f38
        .extern func_ov011_021d0f64
        .global func_ov011_021cf2e0
        .arm
func_ov011_021cf2e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov011_021d0f38
    cmp r0, #0x1
    bne .L_d8
    mov r0, r4
    bl func_ov011_021d0f64
    cmp r0, #0x1
    cmpne r0, #0x3
    bne .L_d8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_d8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
