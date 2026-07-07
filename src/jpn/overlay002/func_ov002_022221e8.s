; func_ov002_022221e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b98d4
        .extern func_ov002_021d7178
        .extern func_ov002_021e277c
        .extern func_ov002_0223de04
        .global func_ov002_022221e8
        .arm
func_ov002_022221e8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x6]
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x18
    beq .L_bc
    sub r1, r1, #0x1
    bl func_ov002_0223de04
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021b98d4
    movs ip, r0
    bmi .L_88
    ldrh r0, [r4, #0x2]
    ldr r3, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    ldr r3, [r1, ip, lsl #0x2]
    mov r2, #0x1
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    bl func_ov002_021d7178
.L_88:
    ldrh r2, [r4, #0x6]
    mov r0, #0x80
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r1, #0xff
    add r1, r1, #0xff00
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    strh r1, [r4, #0x6]
    ldmia sp!, {r4, pc}
.L_bc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
