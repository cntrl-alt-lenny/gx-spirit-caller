; func_ov004_021d5238 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_0202c06c
        .extern func_ov004_021ce0dc
        .extern func_ov004_021d86ac
        .extern func_ov004_021d8be4
        .global func_ov004_021d5238
        .arm
func_ov004_021d5238:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_50
    ldr r0, _LIT0
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT1
    mov r2, #0x0
    bl func_ov004_021d86ac
    ldr r1, _LIT2
    ldr r0, [r1, #0x4c]
    cmp r0, #0x0
    mvneq r0, #0x0
    streq r0, [r1, #0x88]
.L_50:
    ldr r0, [r4, #0x3c]
    cmp r0, #0x78
    bcs .L_6c
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_6c:
    ldr r0, _LIT1
    bl func_ov004_021d8be4
    mov r0, #0x0
    bl func_ov004_021ce0dc
    mov r0, #0x18
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000066e
_LIT1: .word data_ov004_02291388
_LIT2: .word data_ov004_0220b2a0
_LIT3: .word data_02104acc
