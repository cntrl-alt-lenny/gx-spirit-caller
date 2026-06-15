; func_ov004_021d5318 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_0202c0c0
        .extern func_ov004_021ce1bc
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .global func_ov004_021d5318
        .arm
func_ov004_021d5318:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_55c
    ldr r0, _LIT0
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT1
    mov r2, #0x0
    bl func_ov004_021d8798
    ldr r1, _LIT2
    ldr r0, [r1, #0x4c]
    cmp r0, #0x0
    mvneq r0, #0x0
    streq r0, [r1, #0x88]
.L_55c:
    ldr r0, [r4, #0x3c]
    cmp r0, #0x78
    bcs .L_578
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_578:
    ldr r0, _LIT1
    bl func_ov004_021d8cd0
    mov r0, #0x0
    bl func_ov004_021ce1bc
    mov r0, #0x18
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000066e
_LIT1: .word data_ov004_022915e8
_LIT2: .word data_ov004_0220b500
_LIT3: .word data_02104bac
