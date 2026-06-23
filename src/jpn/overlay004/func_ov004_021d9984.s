; func_ov004_021d9984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern func_ov004_021c9fc4
        .global func_ov004_021d9984
        .arm
func_ov004_021d9984:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r8, _LIT0
    mov r9, #0x0
    mov sl, #0x58
    add r4, r8, #0xf90
    mov r6, r9
    mov r7, #0x1
    mov r5, #0x2
    mov fp, #0x2e
.L_244:
    ldr r0, [r8, #0x234]
    cmp r0, #0x0
    beq .L_260
    ldr r0, [r8, #0x22c]
    cmp r0, r9
    moveq r0, r7
    beq .L_264
.L_260:
    mov r0, r6
.L_264:
    mov r1, r5
    mov r2, fp
    mov r3, sl
    str r5, [sp]
    add ip, r0, #0x12
    add r0, r4, #0x5000
    str ip, [sp, #0x4]
    bl func_ov004_021c9fc4
    add r9, r9, #0x1
    cmp r9, #0x2
    add sl, sl, #0x1a
    blt .L_244
    ldr r0, [r8, #0x54]
    cmp r0, #0x4
    cmpne r0, #0x2
    beq .L_3ac
    ldr r2, [r8, #0x22c]
    ldr r0, [r8, #0x224]
    cmp r2, #0x1
    movge r2, #0x1
    cmp r0, #0x0
    beq .L_2f8
    bics r0, r0, #0x1b
    beq .L_328
    mov r0, #0x1a
    mul r1, r2, r0
    add r0, r8, #0xf90
    mov r2, #0x1
    str r2, [sp]
    mov r4, #0x16
    add r0, r0, #0x5000
    add r3, r1, #0x58
    mov r1, #0x2
    mov r2, #0xe
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
    b .L_328
.L_2f8:
    mov r0, #0x1a
    mul r1, r2, r0
    add r0, r8, #0xf90
    mov r2, #0x1
    str r2, [sp]
    mov r4, #0x18
    add r0, r0, #0x5000
    add r3, r1, #0x5a
    mov r1, #0x2
    mov r2, #0xe
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
.L_328:
    ldr r2, [r8, #0x230]
    ldr r0, [r8, #0x228]
    cmp r2, #0x1
    movge r2, #0x1
    cmp r0, #0x0
    beq .L_37c
    bics r0, r0, #0x1b
    beq .L_3ac
    mov r0, #0x1a
    mul r1, r2, r0
    add r0, r8, #0xf90
    mov r2, #0x1
    str r2, [sp]
    mov r4, #0x17
    add r0, r0, #0x5000
    add r3, r1, #0x58
    mov r1, #0x2
    mov r2, #0xd2
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
    b .L_3ac
.L_37c:
    mov r0, #0x1a
    mul r1, r2, r0
    add r0, r8, #0xf90
    mov r2, #0x1
    str r2, [sp]
    mov r4, #0x19
    add r0, r0, #0x5000
    add r3, r1, #0x5a
    mov r1, #0x2
    mov r2, #0xd7
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
.L_3ac:
    mov r1, #0x2
    str r1, [sp]
    add r0, r8, #0xf90
    ldr r4, [r8, #0xa0]
    add r0, r0, #0x5000
    mov r2, #0xe4
    mov r3, #0x3
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b2a0
