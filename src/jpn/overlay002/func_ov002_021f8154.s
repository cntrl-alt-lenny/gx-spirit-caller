; func_ov002_021f8154 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d90f0
        .extern func_ov002_021f600c
        .global func_ov002_021f8154
        .arm
func_ov002_021f8154:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021f600c
    cmp r0, #0x0
    beq .L_44
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_3c
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, #0x3
    bl func_ov002_021d90f0
.L_3c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_44:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
