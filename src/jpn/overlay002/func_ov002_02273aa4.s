; func_ov002_02273aa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021d792c
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_022715b8
        .extern func_ov002_022719c4
        .extern func_ov002_022903f0
        .global func_ov002_02273aa4
        .arm
func_ov002_02273aa4:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_f4
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x18
    beq .L_34
    cmp r1, #0x1
    beq .L_a0
    b .L_ec
.L_34:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_64
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_74
.L_64:
    mov r1, #0xeb
    bl func_ov002_021ae320
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_74:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, pc}
.L_a0:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_c0
    ldr r1, _LIT4
    ldr r0, [r1, #0xd70]
    ldr r1, [r1, #0xd78]
    bl func_ov002_021d792c
    b .L_ec
.L_c0:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    sub r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, pc}
.L_ec:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_f4:
    bl func_ov002_022719c4
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_022715b8
_LIT3: .word data_ov002_022cd238
_LIT4: .word data_ov002_022d008c
