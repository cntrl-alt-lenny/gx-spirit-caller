; func_ov004_021d544c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_0202c06c
        .extern func_02046a58
        .extern func_02046a74
        .extern func_ov004_021d3978
        .extern func_ov004_021d61cc
        .extern func_ov004_021d86ac
        .extern func_ov004_021d8be4
        .global func_ov004_021d544c
        .arm
func_ov004_021d544c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_264
    mov r0, #0xde
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x0
    bl func_ov004_021d86ac
    bl func_02046a58
    cmp r0, #0x0
    beq .L_264
    mov r0, #0x0
    bl func_ov004_021d61cc
.L_264:
    bl func_02046a74
    cmp r0, #0x2
    bge .L_28c
    mov r0, #0x27
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
.L_28c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x78]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    bl func_ov004_021d8be4
    mov r0, r4
    mov r1, #0x25
    mov r2, #0x78
    bl func_ov004_021d3978
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02291388
_LIT1: .word data_ov004_0220b2a0
