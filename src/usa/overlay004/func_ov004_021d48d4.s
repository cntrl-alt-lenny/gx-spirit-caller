; func_ov004_021d48d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220e2a0
        .extern data_ov004_02291388
        .extern func_02032638
        .extern func_02033438
        .extern func_ov004_021c9c80
        .extern func_ov004_021d86ac
        .global func_ov004_021d48d4
        .arm
func_ov004_021d48d4:
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
    mov r1, #0x15
    bl func_ov004_021c9c80
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x12
    bl func_ov004_021d86ac
.L_40:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xccc]
    bl func_02032638
    bl func_02033438
    mov r0, #0x22
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02291388
_LIT1: .word data_ov004_0220e2a0
