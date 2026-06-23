; func_ov004_021d5558 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02291388
        .extern func_02032638
        .extern func_02033470
        .extern func_ov004_021c9c80
        .extern func_ov004_021d3c4c
        .extern func_ov004_021d86ac
        .global func_ov004_021d5558
        .arm
func_ov004_021d5558:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_40
    mov r0, #0x0
    mov r1, #0x17
    bl func_ov004_021c9c80
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x0
    bl func_ov004_021d86ac
.L_40:
    bl func_02032638
    bl func_02033470
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02032638
    ldr r0, [r0, #0xeac]
    tst r0, #0x100
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_88
    mov r0, r4
    mov r1, #0x2
    bl func_ov004_021d3c4c
    bl func_02032638
    ldr r1, [r0, #0xeac]
    bic r1, r1, #0x100
    str r1, [r0, #0xeac]
.L_88:
    mov r0, #0x0
    mov r1, #0x18
    bl func_ov004_021c9c80
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x2
    bl func_ov004_021d86ac
    mov r0, #0x29
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02291388
