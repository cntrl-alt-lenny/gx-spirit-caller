; func_ov002_02229a40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d7268
        .extern func_ov002_021e286c
        .global func_ov002_02229a40
        .arm
func_ov002_02229a40:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r2, #0x1
    mov r3, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021d7268
    cmp r0, #0x0
    beq .L_180
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
.L_180:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
