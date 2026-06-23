; func_ov006_021c51ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fdab0
        .extern data_020fdca0
        .extern data_ov006_0225daf4
        .extern func_02021174
        .extern func_02021428
        .extern func_ov006_021c5bb4
        .extern func_ov006_021c5bf4
        .extern func_ov006_021c5e38
        .extern func_ov006_021c6348
        .extern func_ov006_021c6590
        .extern func_ov006_021c668c
        .extern func_ov006_021c6734
        .global func_ov006_021c51ac
        .arm
func_ov006_021c51ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r2, #0x0
    str r2, [r4, #0x50]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_4c
    ldr r0, _LIT0
    ldr r1, [r0, #0xc]
    str r1, [r0, #0x6c]
    ldr r1, [r0, #0x10]
    str r1, [r0, #0x8c]
    ldr r1, [r0, #0x14]
    str r1, [r0, #0x90]
    ldr r1, [r0, #0x18]
    str r1, [r0, #0x94]
    ldr r1, [r0, #0x1c]
    str r1, [r0, #0x98]
    b .L_80
.L_4c:
    str r2, [r4, #0x4c]
    str r2, [r4, #0x6c]
    ldr r0, _LIT0
    str r2, [r4, #0x70]
    ldr r0, [r0, #0x24c]
    str r0, [r4, #0x74]
    ldr r1, [r4, #0x78]
    cmp r0, #0x6
    movgt r2, #0x1
    and r0, r2, #0x1
    bic r1, r1, #0x1
    orr r0, r1, r0
    str r0, [r4, #0x78]
.L_80:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_9c
    ldr r0, _LIT1
    bl func_02021174
    str r0, [r4, #0x4]
    bl func_02021428
.L_9c:
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_b8
    ldr r0, _LIT2
    bl func_02021174
    str r0, [r4]
    bl func_02021428
.L_b8:
    mov r0, r4
    bl func_ov006_021c5bb4
    mov r0, r4
    bl func_ov006_021c5bf4
    mov r0, r4
    bl func_ov006_021c5e38
    mov r0, r4
    bl func_ov006_021c6348
    mov r0, r4
    bl func_ov006_021c6590
    mov r0, r4
    bl func_ov006_021c668c
    mov r0, r4
    bl func_ov006_021c6734
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_0225daf4
_LIT1: .word data_020fdab0
_LIT2: .word data_020fdca0
