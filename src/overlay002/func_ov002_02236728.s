; func_ov002_02236728 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf184
        .extern func_ov002_021b00d0
        .extern func_ov002_021e16a4
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .global func_ov002_02236728
        .arm
func_ov002_02236728:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_9e4
    cmp r0, #0x7f
    beq .L_95c
    cmp r0, #0x80
    bne .L_9f0
    bl func_ov002_021e2b3c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_95c:
    ldr r2, [r1, #0x5ac]
    add r0, r2, #0x1
    str r0, [r1, #0x5ac]
    cmp r2, #0x2
    movge r0, #0x7e
    ldmgeia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    bl func_ov002_021b00d0
    ldrh r2, [r4, #0x2]
    mov r4, r0
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    ldr r2, _LIT3
    and r3, r0, #0x1
    mla r1, r3, r1, r2
    add r1, r1, r4, lsl #0x2
    ldr r1, [r1, #0x3a0]
    mov r2, #0x0
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r3, #0x1
    bl func_ov002_021e16a4
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_9e4:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_9f0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf184
_LIT3: .word data_ov002_022cf16c
