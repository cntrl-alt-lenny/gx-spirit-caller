; func_ov002_022ac1c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cdb98
        .extern data_ov002_022d19bc
        .extern func_0202b778
        .extern func_020a9698
        .extern func_ov002_021afa10
        .extern func_ov002_021afae4
        .extern func_ov002_0229ef78
        .extern func_ov002_0229f894
        .extern func_ov002_022a03a0
        .extern func_ov002_022a15a0
        .extern func_ov002_022abf84
        .extern func_ov002_022ac8b0
        .extern func_ov002_022aea24
        .global func_ov002_022ac1c0
        .arm
func_ov002_022ac1c0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x108
    mov r4, r1
    mov r5, r0
    cmp r4, #0x5
    bge .L_58
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x4]
    ldr r1, [r1]
    eor r0, r0, #0x1
    cmp r1, r0
    sub r0, r4, #0x1
    mov r0, r0, lsl #0x1
    moveq r1, #0x1
    add r0, r0, #0x46
    movne r1, #0x0
    add r0, r0, #0x200
    add r0, r0, r1
    bl func_0202b778
    mov r2, r0
    b .L_100
.L_58:
    bne .L_6c
    ldr r0, _LIT2
    bl func_0202b778
    mov r2, r0
    b .L_100
.L_6c:
    cmp r4, #0x8
    blt .L_a4
    cmp r4, #0x26
    bgt .L_a4
    mov r0, #0x250
    bl func_0202b778
    mov r6, r0
    bl func_ov002_021afa10
    mov r2, r0
    add r0, sp, #0x8
    mov r1, r6
    bl func_020a9698
    add r2, sp, #0x8
    b .L_100
.L_a4:
    cmp r4, #0x29
    blt .L_dc
    cmp r4, #0x47
    bgt .L_dc
    ldr r0, _LIT3
    bl func_0202b778
    mov r6, r0
    bl func_ov002_021afa10
    mov r2, r0
    add r0, sp, #0x8
    mov r1, r6
    bl func_020a9698
    add r2, sp, #0x8
    b .L_100
.L_dc:
    cmp r4, #0x48
    bne .L_f4
    ldr r0, _LIT4
    bl func_0202b778
    mov r2, r0
    b .L_100
.L_f4:
    ldr r0, _LIT5
    bl func_0202b778
    mov r2, r0
.L_100:
    mov r0, r5
    rsb r1, r4, #0x0
    mov r3, #0x0
    bl func_ov002_0229f894
    mov r0, r5
    bl func_ov002_022abf84
    mov r0, #0x0
    str r0, [r5, #0x28]
    bl func_ov002_021afae4
    str r0, [r5, #0x24]
    mov r1, #0x0
    str r1, [r5, #0x60]
    mov r0, r5
    str r1, [r5, #0x64]
    bl func_ov002_022a03a0
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_022ac8b0
    cmp r4, #0x5
    bgt .L_18c
    ldr r1, _LIT6
    add r0, r5, #0x198
    str r1, [sp]
    mov r4, #0x0
    mov r1, #0xe
    mov r2, #0x10
    mov r3, #0x1
    str r4, [sp, #0x4]
    bl func_ov002_0229ef78
    mov r1, #0x1
    mov r0, r4
    str r1, [r5, #0x194]
    str r0, [r5, #0x1c]
    str r0, [r5, #0x14]
    b .L_254
.L_18c:
    bl func_ov002_021afa10
    cmp r0, #0x1
    bgt .L_1a0
    cmp r4, #0x48
    bne .L_220
.L_1a0:
    ldr r1, _LIT7
    add r0, r5, #0x1b8
    str r1, [sp]
    mov r4, #0x0
    mov r1, #0xa
    mov r2, #0x10
    mov r3, #0xe
    str r4, [sp, #0x4]
    bl func_ov002_0229ef78
    ldr r1, _LIT6
    add r0, r5, #0x1d8
    str r1, [sp]
    mov r1, #0xa
    mov r2, #0x10
    mov r3, #0xd
    str r4, [sp, #0x4]
    bl func_ov002_0229ef78
    ldr r1, _LIT8
    add r0, r5, #0x198
    str r1, [sp]
    mov r1, #0x12
    mov r2, #0x10
    mov r3, #0xb
    str r4, [sp, #0x4]
    bl func_ov002_0229ef78
    mov r1, r4
    str r1, [r5, #0x1d8]
    str r1, [r5, #0x1f0]
    mov r0, #0x3
    str r0, [r5, #0x194]
    str r1, [r5, #0x14]
    b .L_254
.L_220:
    ldr r1, _LIT6
    add r0, r5, #0x198
    str r1, [sp]
    mov r4, #0x0
    mov r1, #0xe
    mov r2, #0x10
    mov r3, #0xa
    str r4, [sp, #0x4]
    bl func_ov002_0229ef78
    mov r0, #0x1
    str r0, [r5, #0x194]
    mov r0, r4
    str r0, [r5, #0x14]
.L_254:
    bl func_ov002_021afae4
    cmp r0, #0x6
    ble .L_2dc
    ldrb r0, [r5, #0x21c]
    cmp r0, #0x1
    beq .L_27c
    mov r0, #0x1
    strb r0, [r5, #0x21c]
    sub r0, r0, #0x2
    str r0, [r5, #0x214]
.L_27c:
    mov r0, r5
    bl func_ov002_022a15a0
    mov r1, #0x20
    str r1, [r5, #0x1fc]
    add r0, r0, #0x69
    str r0, [r5, #0x200]
    mov r0, #0x16
    str r0, [r5, #0x220]
    mov r0, #0x18
    str r0, [r5, #0x224]
    str r0, [r5, #0x228]
    mov r0, #0x90
    str r0, [r5, #0x22c]
    mov r0, #0x6
    str r0, [r5, #0x240]
    mov r0, #0x1
    strb r0, [r5, #0x230]
    bl func_ov002_021afae4
    mov r1, #0x0
    str r1, [r5, #0x238]
    sub r0, r0, #0x6
    str r0, [r5, #0x23c]
    sub r0, r1, #0x1
    str r0, [r5, #0x214]
.L_2dc:
    ldr r0, _LIT9
    bl func_ov002_022aea24
    add sp, sp, #0x108
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022cdb98
_LIT2: .word 0x0000024e
_LIT3: .word 0x00000251
_LIT4: .word 0x00000252
_LIT5: .word 0x0000024f
_LIT6: .word 0x0000ac40
_LIT7: .word 0x0000a040
_LIT8: .word 0x0000b840
_LIT9: .word data_ov002_022d19bc
