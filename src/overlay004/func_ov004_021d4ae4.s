; func_ov004_021d4ae4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_022915e8
        .extern func_0202c0c0
        .extern func_0203268c
        .extern func_ov004_021d3d2c
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .global func_ov004_021d4ae4
        .arm
func_ov004_021d4ae4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_3c
    ldr r0, _LIT0
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT1
    mov r2, #0x0
    bl func_ov004_021d8798
.L_3c:
    bl func_0203268c
    ldr r0, [r0, #0xeb4]
    tst r0, #0x200
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_0203268c
    ldr r0, [r0, #0xeb4]
    tst r0, #0x100
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    moveq r0, #0x12
    streq r0, [r4, #0x30]
    beq .L_a0
    mov r0, r4
    mov r1, #0x2
    bl func_ov004_021d3d2c
    bl func_0203268c
    ldr r2, [r0, #0xeb4]
    mov r1, #0x12
    bic r2, r2, #0x100
    str r2, [r0, #0xeb4]
    str r1, [r4, #0x30]
.L_a0:
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldr r0, _LIT1
    bl func_ov004_021d8cd0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000066a
_LIT1: .word data_ov004_022915e8
