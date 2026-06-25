; func_020291b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202946c
        .extern func_02029a34
        .extern func_02029f20
        .global func_020291b0
        .arm
func_020291b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r1, r4, #0x100
    ldrh r2, [r1, #0x9a]
    mov r1, r2, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_a38
    mov r1, r2, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_a38
    mov r1, r2, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_a10
    mov r0, r2, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_a04
    mov r0, r2, lsl #0x19
    movs r0, r0, lsr #0x1f
    bne .L_a14
.L_a04:
    mov r0, r4
    bl func_0202946c
    b .L_a14
.L_a10:
    bl func_02029a34
.L_a14:
    add r0, r4, #0x100
    ldrh r0, [r0, #0x9a]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    ldrne r0, [r4, #0x188]
    cmpne r0, #0x0
    beq .L_a38
    mov r0, r4
    bl func_02029f20
.L_a38:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
