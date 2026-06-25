; func_02020598 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c66fc
        .extern data_02191e60
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_020204fc
        .global func_02020598
        .arm
func_02020598:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_24
    bl func_0201f148
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
.L_24:
    ldr r0, _LIT0
    ldr r3, [r0, #0x38]
    cmp r3, #0x0
    beq .L_44
    ldrh r1, [r4, #0x8]
    ldrh r2, [r4, #0xa]
    ldr r0, _LIT1
    blx r3
.L_44:
    ldr r0, _LIT0
    ldrh r3, [r4, #0xa]
    ldrh r1, [r0, #0x8]
    ldrh ip, [r4, #0x8]
    cmp r1, r3
    bls .L_74
    sub r1, ip, #0x1
    mov r2, #0x1
    mov r1, r2, lsl r1
    strh r3, [r0, #0x8]
    strh r1, [r0, #0x6]
    b .L_8c
.L_74:
    bne .L_8c
    ldrh r3, [r0, #0x6]
    sub r1, ip, #0x1
    mov r2, #0x1
    orr r1, r3, r2, lsl r1
    strh r1, [r0, #0x6]
.L_8c:
    add r0, ip, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020204fc
    cmp r0, #0x18
    bne .L_b0
    mov r0, #0x7
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
.L_b0:
    cmp r0, #0x2
    ldmeqia sp!, {r4, pc}
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c66fc
