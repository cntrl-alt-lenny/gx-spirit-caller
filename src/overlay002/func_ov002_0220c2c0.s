; func_ov002_0220c2c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02207b3c
        .extern func_ov002_022577dc
        .global func_ov002_0220c2c0
        .arm
func_ov002_0220c2c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_02207b3c
    cmp r0, #0x0
    beq .L_2a0
    mov r0, r4
    bl func_ov002_022577dc
    cmp r0, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
.L_2a0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
