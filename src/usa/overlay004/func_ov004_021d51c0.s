; func_ov004_021d51c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02291388
        .extern func_0202c06c
        .extern func_02032638
        .extern func_02033768
        .extern func_ov004_021d3e64
        .extern func_ov004_021d86ac
        .global func_ov004_021d51c0
        .arm
func_ov004_021d51c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_4d8
    ldr r0, _LIT0
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT1
    mov r2, #0x3
    bl func_ov004_021d86ac
    mov r0, #0x0
    str r0, [r4, #0x258]
.L_4d8:
    ldr r0, [r4, #0x258]
    cmp r0, #0x0
    bne .L_4f8
    bl func_02032638
    add r1, r4, #0x200
    ldrsb r1, [r1, #0x60]
    bl func_02033768
    str r0, [r4, #0x258]
.L_4f8:
    mov r0, r4
    bl func_ov004_021d3e64
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000066d
_LIT1: .word data_ov004_02291388
