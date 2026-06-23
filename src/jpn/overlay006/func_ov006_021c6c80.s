; func_ov006_021c6c80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fd960
        .extern func_02021174
        .extern func_02021278
        .extern func_02021428
        .extern func_02022228
        .extern func_ov006_021c6d34
        .extern func_ov006_021c6e94
        .extern func_ov006_021c6eec
        .extern func_ov006_021c7004
        .extern func_ov006_021c70d4
        .extern func_ov006_021c71bc
        .extern func_ov006_021c73d4
        .global func_ov006_021c6c80
        .arm
func_ov006_021c6c80:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x3c]
    cmp r1, #0x0
    beq .L_198
    bl func_ov006_021c6eec
    mov r0, r4
    bl func_ov006_021c7004
    mov r0, r4
    bl func_ov006_021c71bc
    mov r0, r4
    mov r1, #0x0
    bl func_ov006_021c70d4
    mov r0, r4
    mov r1, #0x1
    bl func_ov006_021c6e94
    mov r0, r4
    bl func_ov006_021c73d4
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_188
    ldr r0, _LIT0
    bl func_02021174
    str r0, [r4]
    bl func_02021428
    ldr r1, [r4, #0x38]
    mov r0, r4
    mov r2, #0x1
    bl func_ov006_021c6d34
.L_188:
    add r1, r4, #0x58
    mov r0, #0x0
    bl func_02022228
    b .L_1bc
.L_198:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_1b0
    bl func_02021278
    mov r0, #0x0
    str r0, [r4]
.L_1b0:
    mov r0, r4
    mov r1, #0x0
    bl func_ov006_021c6e94
.L_1bc:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_020fd960
