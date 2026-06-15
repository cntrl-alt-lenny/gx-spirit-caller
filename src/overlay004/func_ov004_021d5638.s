; func_ov004_021d5638 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_022915e8
        .extern func_0203268c
        .extern func_020334c0
        .extern func_ov004_021c9d60
        .extern func_ov004_021d3d2c
        .extern func_ov004_021d8798
        .global func_ov004_021d5638
        .arm
func_ov004_021d5638:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_86c
    mov r0, #0x0
    mov r1, #0x17
    bl func_ov004_021c9d60
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x0
    bl func_ov004_021d8798
.L_86c:
    bl func_0203268c
    bl func_020334c0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_0203268c
    ldr r0, [r0, #0xeb4]
    tst r0, #0x100
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_8b4
    mov r0, r4
    mov r1, #0x2
    bl func_ov004_021d3d2c
    bl func_0203268c
    ldr r1, [r0, #0xeb4]
    bic r1, r1, #0x100
    str r1, [r0, #0xeb4]
.L_8b4:
    mov r0, #0x0
    mov r1, #0x18
    bl func_ov004_021c9d60
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x2
    bl func_ov004_021d8798
    mov r0, #0x29
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_022915e8
