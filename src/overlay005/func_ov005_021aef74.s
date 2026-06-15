; func_ov005_021aef74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_02104f4c
        .extern func_02001d0c
        .extern func_02004f58
        .extern func_0208de4c
        .extern func_02094504
        .global func_ov005_021aef74
        .arm
func_ov005_021aef74:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r6, r0
    bl func_0208de4c
    ldr r1, [r6, #0x8]
    mov r4, r0
    cmp r1, #0x4
    mov r2, #0x0
    bhi .L_34
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_34:
    cmp r2, #0x0
    movne r0, #0xc
    moveq r0, #0x0
    mov r3, r0, lsl #0x10
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x4c0
    mov r5, r3, lsr #0x10
    bl func_02094504
    ldr r0, _LIT0
    mov r1, #0x13
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    beq .L_e8
    ldr r1, [r6, #0x8]
    mov lr, #0x1
    mov r2, lr, lsl r1
    mov r0, #0x0
    and r7, r2, #0x19
    mov r3, #0xc
    mov ip, #0xa
    mov r8, r0
    b .L_c0
.L_a0:
    add r2, r6, r0
    ldrsb r2, [r2, #0x48]
    cmp r2, #0x20
    bne .L_e8
    add r2, r5, #0x6
    mov r2, r2, lsl #0x10
    mov r5, r2, lsr #0x10
    add r0, r0, #0x1
.L_c0:
    mov r2, r8
    cmp r1, #0x4
    bhi .L_d4
    cmp r7, #0x0
    movne r2, lr
.L_d4:
    cmp r2, #0x0
    movne r2, ip
    moveq r2, r3
    cmp r0, r2, lsl #0x1
    blt .L_a0
.L_e8:
    mov r1, #0x4
    ldr r0, _LIT0
    str r1, [sp]
    mov ip, #0xc
    add r1, r6, #0x48
    add r2, r4, #0x40
    add r3, r5, #0x1
    str ip, [sp, #0x4]
    bl func_02004f58
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02102c90
_LIT1: .word data_02104f4c
