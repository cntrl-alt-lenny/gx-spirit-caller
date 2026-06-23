; func_ov004_021d7478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov004_0220b2a0
        .extern func_ov004_021c9fc4
        .extern func_ov004_021d6f70
        .extern func_ov004_021d702c
        .global func_ov004_021d7478
        .arm
func_ov004_021d7478:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    ldr r5, _LIT0
    mov r4, #0x0
    ldr r0, [r5, #0x54]
    cmp r0, #0x5
    beq .L_2c
    cmp r0, #0x6
    beq .L_40
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2c:
    ldr r0, [r5, #0x58]
    cmp r0, #0x0
    rsblt r0, r0, #0x0
    rsb r4, r0, #0x100
    b .L_8c
.L_40:
    ldr r0, [r5, #0x60]
    cmp r0, #0x0
    bne .L_8c
    ldr r1, [r5, #0x90]
    cmp r1, #0x4
    bge .L_78
    mov r0, #0x23
    mul r0, r1, r0
    add r1, r0, #0x8
    mov r0, #0x4
    mov r2, #0xc6
    mov r3, #0x20
    bl func_ov004_021d702c
    b .L_8c
.L_78:
    mov r0, #0x18
    mov r3, r0
    mov r1, #0x96
    mov r2, #0x9e
    bl func_ov004_021d702c
.L_8c:
    cmp r4, #0xc0
    addge sp, sp, #0x1c
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    rsb r0, r4, #0x5
    rsb r6, r4, #0x27
    str r0, [sp, #0xc]
    add r0, r6, #0x30
    str r0, [sp, #0x10]
    add r0, r6, #0x40
    str r0, [sp, #0x14]
    add r0, r5, #0x3000
    rsb fp, r4, #0xb6
    mov r9, #0x0
    mov r7, #0xa
    mov r8, #0x9
    add r4, r5, #0xf90
    str r0, [sp, #0x18]
.L_d0:
    mov r0, #0x80
    str r0, [sp]
    mov r0, r6
    mov r1, r7
    mov r2, r9
    mov r3, #0x2
    bl func_ov004_021d6f70
    mov r0, #0x80
    str r0, [sp]
    mov r0, r6
    add r1, r7, #0x10
    add r2, r9, #0x5
    mov r3, #0x3
    bl func_ov004_021d6f70
    add r0, r5, r9, lsl #0x2
    add r0, r0, #0x3000
    cmp r9, #0x0
    ldr r1, [r0, #0xc94]
    movgt r0, #0x1
    movle r0, #0x0
    add r0, r9, r0
    mov r0, r0, lsl #0x1
    add r0, r0, #0x12
    add sl, r1, r0
    cmp r9, #0x1
    bne .L_14c
    cmp r1, #0x0
    ldreq r0, _LIT1
    movne sl, #0x14
    ldreq r0, [r0, #0x34]
    addeq sl, r0, #0x15
.L_14c:
    mov r0, #0x2
    stmia sp, {r0, sl}
    add r0, r5, r9, lsl #0x2
    add r0, r0, #0xa4
    add r0, r0, #0x3c00
    str r0, [sp, #0x8]
    ldr r2, [sp, #0x8]
    add r0, r4, #0x5000
    ldr r2, [r2, #0x14]
    mov r1, #0x2
    add ip, r2, r2, lsr #0x1f
    ldr r2, [sp, #0x10]
    add r3, r7, #0xd
    sub r2, r2, ip, asr #0x1
    bl func_ov004_021c9fc4
    mov r0, #0x2
    stmia sp, {r0, sl}
    ldr r0, [sp, #0x8]
    add r3, r7, #0xd
    ldr r1, [r0, #0x14]
    add r0, r4, #0x5000
    add r2, r1, r1, lsr #0x1f
    ldr r1, [sp, #0x14]
    add r2, r1, r2, asr #0x1
    mov r1, #0x2
    bl func_ov004_021c9fc4
    ldr r0, [r5, #0x90]
    cmp r9, r0
    bne .L_214
    ldr r0, [r5, #0x9c]
    cmp r0, #0x0
    beq .L_214
    cmp r0, #0x0
    mov r0, #0x2
    mov r1, #0x2
    str r0, [sp]
    bge .L_1fc
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r2, [sp, #0xc]
    add r0, r4, #0x5000
    mov r3, r8
    bl func_ov004_021c9fc4
    b .L_214
.L_1fc:
    mov r0, #0xf
    str r0, [sp, #0x4]
    add r0, r4, #0x5000
    mov r2, fp
    mov r3, r8
    bl func_ov004_021c9fc4
.L_214:
    cmp r9, #0x3
    bne .L_274
    ldr r0, [sp, #0x18]
    ldr r0, [r0, #0xcc8]
    cmp r0, #0x0
    beq .L_274
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0x10
    str r0, [sp, #0x4]
    ldr r2, [sp, #0xc]
    add r0, r4, #0x5000
    mov r1, #0x2
    mov r3, r8
    bl func_ov004_021c9fc4
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0x10
    str r0, [sp, #0x4]
    add r0, r4, #0x5000
    mov r1, #0x2
    mov r2, fp
    mov r3, r8
    bl func_ov004_021c9fc4
.L_274:
    add r7, r7, #0x23
    add r8, r8, #0x23
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_d0
    ldr r0, [r5, #0x90]
    cmp r0, #0x4
    bne .L_2c4
    ldr r0, [r5, #0x9c]
    cmp r0, #0x0
    beq .L_2c4
    add r0, r5, #0xf90
    mov r1, #0x2
    str r1, [sp]
    mov r4, #0x11
    add r0, r0, #0x5000
    mov r2, #0x19
    mov r3, #0x97
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
.L_2c4:
    mov r4, #0x80
    mov r0, r6
    mov r1, #0x9c
    mov r2, #0x4
    mov r3, #0x2
    str r4, [sp]
    bl func_ov004_021d6f70
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_02103fcc
