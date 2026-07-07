; func_ov002_0223fb20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae434
        .extern func_ov002_0223d9e0
        .extern func_ov002_0226afe0
        .global func_ov002_0223fb20
        .arm
func_ov002_0223fb20:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x0
    beq .L_28
    cmp r1, #0x1
    beq .L_90
    b .L_ec
.L_28:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_54
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_74
.L_54:
    ldr r1, _LIT3
    mov r3, #0x0
    str r3, [sp]
    mov r4, #0xf
    add r2, r1, #0x1
    mov r0, #0x67
    str r4, [sp, #0x4]
    bl func_ov002_021ae434
.L_74:
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_90:
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT2
    ldr r1, [r1, #0xd44]
    mov r2, r2, lsl #0x1f
    eor r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_0223d9e0
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT2
    ldrh r1, [r4]
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, [r0, #0xd44]
    rsb r0, r3, #0x1
    bl func_ov002_0226afe0
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_ec:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x00000196
