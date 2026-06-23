; func_ov004_021d5658 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02291388
        .extern func_02032638
        .extern func_02033438
        .extern func_ov004_021c9c80
        .extern func_ov004_021d7b14
        .extern func_ov004_021d86ac
        .global func_ov004_021d5658
        .arm
func_ov004_021d5658:
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
    mov r1, #0x16
    bl func_ov004_021c9c80
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x4
    bl func_ov004_021d86ac
.L_40:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    rsbs r0, r0, #0x1
    beq .L_94
    bl func_02032638
    bl func_02033438
    mov r0, #0x22
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    bl func_ov004_021d7b14
    ldmia sp!, {r4, pc}
.L_94:
    mov r0, #0x18
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02291388
