; func_ov004_021db56c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_ov004_021c9cf4
        .extern func_ov004_021c9fc4
        .extern func_ov004_021da634
        .extern func_ov004_021da684
        .extern func_ov004_021da908
        .extern func_ov004_021daa68
        .extern func_ov004_021db31c
        .global func_ov004_021db56c
        .arm
func_ov004_021db56c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    ldr r1, [r4, #0x4c]
    ldr r0, [r4, #0x48]
    cmp r1, r0
    bne .L_b60
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_b60
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc90]
    cmp r0, #0x0
    beq .L_b5c
    bl func_ov004_021da908
    mov r0, #0x3
    bl func_ov004_021da634
    b .L_b60
.L_b5c:
    bl func_ov004_021daa68
.L_b60:
    bl func_ov004_021db31c
    add r0, r4, #0xf90
    mov r1, #0x2
    mov r2, #0x0
    mov r3, r2
    str r1, [sp]
    mov ip, #0x1f
    add r0, r0, #0x5000
    str ip, [sp, #0x4]
    bl func_ov004_021c9fc4
    bl func_ov004_021da684
    mov r1, #0x2
    str r1, [sp]
    ldr r2, [r4, #0xa0]
    add r0, r4, #0xf90
    str r2, [sp, #0x4]
    add r0, r0, #0x5000
    mov r2, #0xe4
    mov r3, #0x3
    bl func_ov004_021c9fc4
    add r0, r4, #0xef0
    add r1, r0, #0x5000
    ldr r0, _LIT2
    mov r2, #0x4
    ldr r3, _LIT3
    bl func_ov004_021c9cf4
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_02291388
_LIT2: .word 0x05000638
_LIT3: .word 0x00600100
