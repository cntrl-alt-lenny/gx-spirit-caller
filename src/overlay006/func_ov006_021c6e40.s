; func_ov006_021c6e40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov006_021ce19c
        .extern data_ov006_021ce1b0
        .extern func_02021660
        .extern func_020216b0
        .extern func_020a978c
        .extern func_ov006_021c7110
        .extern func_ov006_021c71e0
        .extern func_ov006_021c72c8
        .global func_ov006_021c6e40
        .arm
func_ov006_021c6e40:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r1, r0
    cmpeq r2, #0x0
    beq .L_294
    mov r0, r4
    str r1, [r4, #0x38]
    bl func_ov006_021c7110
    mov r0, r4
    bl func_ov006_021c72c8
    mov r0, r4
    mov r1, #0x0
    bl func_ov006_021c71e0
    ldr r0, [r4]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #0x38]
    mov r2, #0x1
    cmp r1, #0x0
    movne r5, #0x1
    moveq r5, #0x0
    mov r1, #0x3
    bl func_02021660
    mov r2, r5
    mov r1, #0x0
    bl func_020216b0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_294
    ldr r0, [r4]
    mov r1, #0x3
    mov r2, #0x2
    bl func_02021660
    mov r1, #0x2
    mov r2, #0x0
    mov r5, r0
    bl func_020216b0
    ldr r2, _LIT0
    mov r0, r5
    mov r1, #0x0
    bl func_020216b0
    ldr r0, _LIT1
    ldr r2, [r4, #0x38]
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    ldreq r1, _LIT2
    add r0, r4, #0x58
    ldrne r1, _LIT3
    bl func_020a978c
.L_294:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000201
_LIT1: .word data_021040ac
_LIT2: .word data_ov006_021ce19c
_LIT3: .word data_ov006_021ce1b0
