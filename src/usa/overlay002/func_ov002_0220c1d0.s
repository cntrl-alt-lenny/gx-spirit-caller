; func_ov002_0220c1d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02207a4c
        .extern func_ov002_022576f4
        .global func_ov002_0220c1d0
        .arm
func_ov002_0220c1d0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_02207a4c
    cmp r0, #0x0
    beq .L_2a0
    mov r0, r4
    bl func_ov002_022576f4
    cmp r0, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
.L_2a0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
