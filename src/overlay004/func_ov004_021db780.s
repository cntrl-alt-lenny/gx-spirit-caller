; func_ov004_021db780 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_ov004_021c9dd4
        .extern func_ov004_021ca0a4
        .extern func_ov004_021da848
        .extern func_ov004_021da898
        .extern func_ov004_021dab1c
        .extern func_ov004_021dac7c
        .extern func_ov004_021db530
        .global func_ov004_021db780
        .arm
func_ov004_021db780:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    ldr r1, [r4, #0x4c]
    ldr r0, [r4, #0x48]
    cmp r1, r0
    bne .L_c10
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_c10
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc90]
    cmp r0, #0x0
    beq .L_c0c
    bl func_ov004_021dab1c
    mov r0, #0x3
    bl func_ov004_021da848
    b .L_c10
.L_c0c:
    bl func_ov004_021dac7c
.L_c10:
    bl func_ov004_021db530
    add r0, r4, #0xf90
    mov r1, #0x2
    mov r2, #0x0
    mov r3, r2
    str r1, [sp]
    mov ip, #0x1f
    add r0, r0, #0x5000
    str ip, [sp, #0x4]
    bl func_ov004_021ca0a4
    bl func_ov004_021da898
    mov r1, #0x2
    str r1, [sp]
    ldr r2, [r4, #0xa0]
    add r0, r4, #0xf90
    str r2, [sp, #0x4]
    add r0, r0, #0x5000
    mov r2, #0xe4
    mov r3, #0x3
    bl func_ov004_021ca0a4
    add r0, r4, #0xef0
    add r1, r0, #0x5000
    ldr r0, _LIT2
    mov r2, #0x4
    ldr r3, _LIT3
    bl func_ov004_021c9dd4
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_022915e8
_LIT2: .word 0x05000638
_LIT3: .word 0x00600100
