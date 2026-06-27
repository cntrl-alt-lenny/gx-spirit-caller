; func_ov002_02296dac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_02291050
        .global func_ov002_02296dac
        .arm
func_ov002_02296dac:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r3, r2, lsl #0x12
    movs r3, r3, lsr #0x1e
    bne .L_1c
    bl func_ov002_02291050
    ldmia sp!, {r3, pc}
.L_1c:
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r1, #0x1
    mla lr, r1, r0, r2
    mov r2, #0x0
    mov ip, r2
    add r3, lr, #0x30
.L_40:
    ldr r0, [r3]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_74
    add r1, lr, ip
    ldrh r0, [r1, #0x38]
    cmp r0, #0x0
    bne .L_74
    ldr r0, [r1, #0x40]
    mov r0, r0, lsr #0x8
    tst r0, #0x1
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
.L_74:
    add r2, r2, #0x1
    cmp r2, #0x5
    add r3, r3, #0x14
    add ip, ip, #0x14
    blt .L_40
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
