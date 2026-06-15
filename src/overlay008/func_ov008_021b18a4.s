; func_ov008_021b18a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020f8700
        .extern data_ov008_021b270c
        .extern func_020211c8
        .extern func_020212cc
        .extern func_0202147c
        .extern func_0202227c
        .extern func_ov008_021b1e20
        .global func_ov008_021b18a4
        .arm
func_ov008_021b18a4:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r3, [r1]
    ldr r2, [r3, #0x6c]
    cmp r2, r0
    ldmeqia sp!, {r3, pc}
    str r0, [r3, #0x6c]
    ldr r1, [r1]
    ldr r0, [r1, #0x6c]
    cmp r0, #0x0
    ldr r0, [r1, #0x4]
    beq .L_1594
    cmp r0, #0x0
    bne .L_1558
    ldr r0, _LIT1
    bl func_020211c8
    ldr r1, _LIT0
    ldr r2, [r1]
    str r0, [r2, #0x4]
    ldr r0, [r1]
    ldr r0, [r0, #0x4]
    bl func_0202147c
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    bl func_ov008_021b1e20
.L_1558:
    ldr r1, _LIT0
    mov r0, #0x29
    ldr r1, [r1]
    add r1, r1, #0x70
    bl func_0202227c
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x7
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldmia sp!, {r3, pc}
.L_1594:
    cmp r0, #0x0
    beq .L_15b0
    bl func_020212cc
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x4]
.L_15b0:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x6
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b270c
_LIT1: .word data_020f8700
