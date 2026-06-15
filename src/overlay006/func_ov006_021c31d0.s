; func_ov006_021c31d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cde2c
        .extern func_02021660
        .extern func_020216b0
        .extern func_02022234
        .global func_ov006_021c31d0
        .arm
func_ov006_021c31d0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_d08
    mov r1, #0x4
    mov r2, #0x0
    bl func_02021660
    mov r1, #0x0
    mov r2, #0x1
    bl func_020216b0
    ldr r0, [r4, #0x8]
    mov r1, #0x4
    mov r2, #0x1
    bl func_02021660
    mov r1, #0x0
    mov r2, #0x1
    bl func_020216b0
.L_d08:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_d2c
    mov r1, #0x4
    mov r2, #0x0
    bl func_02021660
    mov r1, #0x0
    mov r2, #0x1
    bl func_020216b0
.L_d2c:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_d8c
    mov r1, #0x4
    mov r2, #0x0
    bl func_02021660
    ldr r2, [r4, #0x58]
    ldr r1, _LIT0
    mov r2, r2, lsl #0x2
    ldrsh r1, [r1, r2]
    cmp r1, #0x2
    bne .L_d70
    ldr r1, [r4, #0x64]
    cmp r1, #0x0
    moveq r4, #0x0
    movne r4, #0x1
    b .L_d74
.L_d70:
    mov r4, #0x2
.L_d74:
    ldr r2, _LIT1
    mov r1, #0x0
    bl func_020216b0
    mov r1, r4
    mov r0, #0x3
    bl func_02022234
.L_d8c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_021cde2c
_LIT1: .word 0x00000801
