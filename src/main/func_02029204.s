; func_02029204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020294c0
        .extern func_02029a88
        .extern func_02029f74
        .global func_02029204
        .arm
func_02029204:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r1, r4, #0x100
    ldrh r2, [r1, #0x9a]
    mov r1, r2, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_a80
    mov r1, r2, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_a80
    mov r1, r2, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_a58
    mov r0, r2, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_a4c
    mov r0, r2, lsl #0x19
    movs r0, r0, lsr #0x1f
    bne .L_a5c
.L_a4c:
    mov r0, r4
    bl func_020294c0
    b .L_a5c
.L_a58:
    bl func_02029a88
.L_a5c:
    add r0, r4, #0x100
    ldrh r0, [r0, #0x9a]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    ldrne r0, [r4, #0x188]
    cmpne r0, #0x0
    beq .L_a80
    mov r0, r4
    bl func_02029f74
.L_a80:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
