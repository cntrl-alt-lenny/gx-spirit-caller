; func_ov006_021c1bb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fb4e0
        .extern data_020fbd80
        .extern func_02021174
        .extern func_02021278
        .extern func_02021428
        .extern func_ov006_021c30c4
        .extern func_ov006_021c3278
        .extern func_ov006_021c4468
        .extern func_ov006_021c45b4
        .extern func_ov006_021c465c
        .global func_ov006_021c1bb4
        .arm
func_ov006_021c1bb4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x68]
    str r0, [r4, #0x6c]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bne .L_30
    ldr r0, _LIT0
    bl func_02021174
    str r0, [r4, #0x8]
    bl func_02021428
.L_30:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_48
    bl func_02021278
    mov r0, #0x0
    str r0, [r4, #0xc]
.L_48:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_60
    bl func_02021278
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_60:
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_7c
    ldr r0, _LIT1
    bl func_02021174
    str r0, [r4]
    bl func_02021428
.L_7c:
    mov r0, r4
    bl func_ov006_021c30c4
    mov r0, r4
    bl func_ov006_021c3278
    mov r0, r4
    bl func_ov006_021c4468
    mov r0, r4
    bl func_ov006_021c45b4
    mov r0, r4
    bl func_ov006_021c465c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_020fb4e0
_LIT1: .word data_020fbd80
