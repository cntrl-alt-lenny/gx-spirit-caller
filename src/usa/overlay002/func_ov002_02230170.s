; func_ov002_02230170 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021e0f5c
        .extern func_ov002_0226ae48
        .global func_ov002_02230170
        .arm
func_ov002_02230170:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0xc]
    cmp r1, #0x1
    beq .L_b0
    cmp r1, #0x2
    beq .L_c8
    b .L_e4
.L_b0:
    ldrh r0, [r0, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e0f5c
    b .L_e4
.L_c8:
    ldrh r0, [r0, #0x2]
    mov r1, #0x1
    mov r2, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226ae48
.L_e4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
