; func_ov002_02200084 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4098
        .extern func_ov002_02203930
        .global func_ov002_02200084
        .arm
func_ov002_02200084:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r2, r3, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x2
    bne .L_6f4
    ldrh r2, [r0]
    mov r0, r3, lsl #0x1f
    mov r1, r3, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b4098
    ldmia sp!, {r3, pc}
.L_6f4:
    bl func_ov002_02203930
    ldmia sp!, {r3, pc}
