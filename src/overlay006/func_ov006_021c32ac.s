; func_ov006_021c32ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cdf88
        .extern data_ov006_0225e068
        .extern func_02021660
        .extern func_020216b0
        .global func_ov006_021c32ac
        .arm
func_ov006_021c32ac:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x60]
    ldr r1, [r5, #0x5c]
    mov r0, r0, lsl #0x2
    add r0, r0, #0x1
    ldr r3, _LIT0
    add r2, r1, r0
    mov r1, #0x1c
    ldr r0, [r5]
    mla r4, r2, r1, r3
    mov r1, #0x5
    mov r2, #0x8
    ldr r6, _LIT1
    bl func_02021660
    ldr r1, [r5, #0x68]
    mov r5, r0
    cmp r1, #0x0
    beq .L_e08
    ldr r0, [r6]
    mov r6, #0xc9
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    orreq r6, r6, #0x20
    b .L_e0c
.L_e08:
    mov r6, #0x0
.L_e0c:
    ldrsh r2, [r4]
    mov r0, r5
    mov r1, #0x3
    add r2, r2, #0x14
    bl func_020216b0
    ldrsh r2, [r4, #0x2]
    mov r0, r5
    mov r1, #0x4
    add r2, r2, #0x14
    bl func_020216b0
    ldrsh r2, [r4, #0x8]
    mov r0, r5
    mov r1, #0x11
    bl func_020216b0
    ldrsh r2, [r4, #0xa]
    mov r0, r5
    mov r1, #0x12
    bl func_020216b0
    mov r0, r5
    mov r2, r6
    mov r1, #0x0
    bl func_020216b0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov006_021cdf88
_LIT1: .word data_ov006_0225e068
