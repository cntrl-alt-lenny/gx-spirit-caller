; func_ov006_021c694c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fb760
        .extern func_02021174
        .extern func_02021278
        .extern func_02021428
        .extern func_02022228
        .extern func_0202c8f4
        .extern func_0202c96c
        .extern func_ov006_021c6a28
        .global func_ov006_021c694c
        .arm
func_ov006_021c694c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x8]
    mov r0, #0x1
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_a4
    ldr r1, _LIT0
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe00
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0xf00
    strh r0, [r1, #0x2]
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_88
    ldr r0, _LIT1
    bl func_02021174
    str r0, [r4]
    bl func_02021428
    ldr r1, [r4, #0x4]
    mov r0, r4
    mov r2, #0x1
    bl func_ov006_021c6a28
.L_88:
    add r1, r4, #0x18
    mov r0, #0x29
    bl func_02022228
    mov r0, #0x2
    mov r1, #0x3
    bl func_0202c8f4
    b .L_bc
.L_a4:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_bc
    bl func_02021278
    mov r0, #0x0
    str r0, [r4]
.L_bc:
    ldr r0, [r4, #0x8]
    bl func_0202c96c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0400000c
_LIT1: .word data_020fb760
