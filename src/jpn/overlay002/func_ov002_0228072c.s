; func_ov002_0228072c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a0
        .extern data_ov002_022d008c
        .extern func_0202e274
        .extern func_ov002_021afff0
        .extern func_ov002_021c3c10
        .global func_ov002_0228072c
        .arm
func_ov002_0228072c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r5, r1
    cmp r5, r2
    beq .L_54
    ldr r1, _LIT1
    cmp r5, r1
    bne .L_5c
    and r1, r0, #0x1
    sub r0, r2, #0xd00
    mul r4, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r4]
    bl func_ov002_021afff0
    ldr r1, _LIT3
    add r1, r1, r4
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x260]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    b .L_114
.L_54:
    add r5, r2, #0xb4
    b .L_114
.L_5c:
    rsb r4, r0, #0x1
    mov r0, r4
    sub r5, r1, #0x81
    bl func_ov002_021c3c10
    cmp r0, #0x0
    beq .L_b8
    ldr r0, _LIT4
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT5
    ldr r0, [r0, r2]
    cmp r0, #0x0
    beq .L_b8
    bl func_ov002_021afff0
    ldr r1, _LIT4
    ldr r2, _LIT3
    and r3, r4, #0x1
    mla r1, r3, r1, r2
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    b .L_114
.L_b8:
    ldr r0, _LIT4
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT6
    ldr r0, [r0, r2]
    cmp r0, #0x0
    beq .L_114
    bl func_ov002_021afff0
    ldr r3, _LIT3
    ldr r1, _LIT4
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    mov r6, r0
    add r4, r1, #0x400
    ldr r0, [r4, r6, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e274
    cmp r0, #0x0
    ldreq r0, [r4, r6, lsl #0x2]
    moveq r0, r0, lsl #0x13
    moveq r5, r0, lsr #0x13
.L_114:
    ldr r1, _LIT7
    mov r0, r5
    str r5, [r1, #0xd44]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001568
_LIT1: .word 0x0000169d
_LIT2: .word data_ov002_022cf09c
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf098
_LIT6: .word data_ov002_022cf0a0
_LIT7: .word data_ov002_022d008c
