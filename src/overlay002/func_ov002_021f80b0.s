; func_ov002_021f80b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern func_ov002_021d7c40
        .extern func_ov002_021ded30
        .global func_ov002_021f80b0
        .arm
func_ov002_021f80b0:
    stmdb sp!, {r3, lr}
    ldrh ip, [r0, #0x2]
    mov r1, ip, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_b8
    ldr r2, _LIT0
    ldr lr, [r2, #0x5b4]
    cmp lr, #0x0
    beq .L_34
    cmp lr, #0x1
    beq .L_74
    b .L_b8
.L_34:
    mov r1, ip, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r3, r1, lsl #0x4
    mov r1, ip, lsl #0x1a
    add r1, r3, r1, lsr #0x1b
    mov r2, #0x1
    mov r1, r2, lsl r1
    ldr r2, _LIT1
    eor r1, r1, r2, lsl r3
    bl func_ov002_021ded30
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, pc}
.L_74:
    mov r0, ip, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    and r3, r0, #0x1
    mul ip, r3, r1
    ldr r1, _LIT3
    ldr r1, [r1, ip]
    cmp r1, #0x0
    beq .L_a8
    mov r1, #0x0
    bl func_ov002_021d7c40
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_a8:
    add r0, lr, #0x1
    str r0, [r2, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_b8:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000ffff
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf178
