; func_ov008_021b21c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020f8400
        .extern data_ov008_021b25ec
        .extern func_02021174
        .extern func_02021278
        .extern func_02021428
        .extern func_02022228
        .extern func_0202c8f4
        .extern func_0202c96c
        .extern func_ov008_021b2144
        .global func_ov008_021b21c0
        .arm
func_ov008_021b21c0:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r3, [r1]
    ldr r2, [r3, #0x6c]
    cmp r2, r0
    ldmeqia sp!, {r3, pc}
    str r0, [r3, #0x6c]
    ldr r1, [r1]
    ldr r0, [r1, #0x6c]
    cmp r0, #0x0
    ldr r0, [r1, #0x4]
    beq .L_90
    cmp r0, #0x0
    bne .L_6c
    ldr r0, _LIT1
    bl func_02021174
    ldr r1, _LIT0
    ldr r2, [r1]
    str r0, [r2, #0x4]
    ldr r0, [r1]
    ldr r0, [r0, #0x4]
    bl func_02021428
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    ldr r0, [r0, #0xc]
    bl func_ov008_021b2144
.L_6c:
    ldr r1, _LIT0
    mov r0, #0x29
    ldr r1, [r1]
    add r1, r1, #0x70
    bl func_02022228
    mov r0, #0x1
    mov r1, #0x2
    bl func_0202c8f4
    b .L_ac
.L_90:
    cmp r0, #0x0
    beq .L_ac
    bl func_02021278
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x4]
.L_ac:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x6c]
    bl func_0202c96c
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b25ec
_LIT1: .word data_020f8400
