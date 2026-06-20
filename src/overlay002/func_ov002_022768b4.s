; func_ov002_022768b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_ov002_021b1570
        .extern func_ov002_021e7418
        .extern func_ov002_02244fe4
        .global func_ov002_022768b4
        .arm
func_ov002_022768b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    ldr r1, [r2, #0x18]
    mov r3, r1, lsl #0x18
    mov r3, r3, lsr #0x18
    cmp r3, #0x3
    beq .L_34
    cmp r3, #0x4
    beq .L_12c
    cmp r3, #0x7
    beq .L_2a4
    b .L_2d0
.L_34:
    ldr r3, _LIT1
    ldr r3, [r3, #0x480]
    cmp r3, #0x1
    ble .L_5c
    bic r0, r1, #0xff
    orr r0, r0, #0x8
    str r0, [r2, #0x18]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_5c:
    ldr r6, [r2]
    ldr r3, _LIT2
    mov r4, r6, lsl #0x1f
    mov r5, r4, lsr #0x1f
    ldr r4, _LIT3
    and r7, r5, #0x1
    mla r5, r7, r3, r4
    mov r3, r6, lsl #0x1b
    mov r4, r3, lsr #0x1c
    mov r3, #0x14
    mla r3, r4, r3, r5
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    bic r1, r1, #0xff00
    bic r1, r1, #0xff0000
    ldr r5, _LIT4
    str r1, [r2, #0x18]
    ldr r4, [r5]
    ldr r1, _LIT5
    mov r3, r4, lsl #0x18
    mov r3, r3, lsr #0x18
    add r3, r3, #0x1
    bic r4, r4, #0xff
    and r3, r3, #0xff
    orr r3, r4, r3
    str r3, [r5]
    ldr r3, [r1, #0xd0c]
    cmp r3, #0x0
    beq .L_12c
    ldr r3, [r1, #0xcec]
    ldr r1, _LIT6
    ldr r1, [r1, r3, lsl #0x2]
    cmp r1, #0x2
    bne .L_12c
    mov r0, #0x16
    sub r1, r0, #0x17
    mov r3, #0x1c
    bl func_ov002_021b1570
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldrh r2, [r1, #0x16]
    mov r0, #0x0
    bic r2, r2, #0x1
    strh r2, [r1, #0x16]
    ldrh r2, [r1, #0x16]
    bic r2, r2, #0x40
    strh r2, [r1, #0x16]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_12c:
    ldr r1, _LIT1
    mov r3, #0x0
    ldr r5, _LIT0
    str r3, [r1, #0x5d4]
    ldr r1, [r5]
    ldr r4, [sp]
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1b
    mov r1, r1, lsr #0x1c
    bic r4, r4, #0x200
    mov r2, r2, lsl #0x1f
    orr r2, r4, r2, lsr #0x16
    bic r2, r2, #0x3c00
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x12
    mov r2, r1, lsl #0x16
    mov r7, r2, lsr #0x1f
    mov r2, r1, lsl #0x12
    mov r6, r2, lsr #0x1c
    ldr r8, _LIT3
    ldr lr, _LIT2
    and r2, r7, #0x1
    mov r4, #0x14
    mla r8, r2, lr, r8
    mul r7, r6, r4
    add r6, r8, #0x30
    ldr r7, [r6, r7]
    sub r2, r4, #0x214
    mov r6, r7, lsl #0x2
    mov r6, r6, lsr #0x18
    ldr ip, _LIT7
    mov r7, r7, lsl #0x12
    mov r6, r6, lsl #0x1
    add r6, r6, r7, lsr #0x1f
    and r2, r1, r2
    and r1, r6, ip
    orr r1, r2, r1
    mov r2, r1, lsl #0x16
    mov r7, r2, lsr #0x1f
    mov r2, r1, lsl #0x12
    mov r6, r2, lsr #0x1c
    and ip, r7, #0x1
    ldr r8, _LIT8
    ldrh r2, [r5, #0x4]
    mul r7, r6, r4
    mla r5, ip, lr, r8
    ldrh r6, [r7, r5]
    bic r7, r1, #0x8000
    and r5, r2, #0x10
    mov r1, r6, lsl #0x1f
    orr r1, r7, r1, lsr #0x10
    mov r6, r1, lsl #0x16
    mov r6, r6, lsr #0x1f
    mov ip, r1, lsl #0x12
    cmp r5, #0x0
    mov r0, r0, lsl #0x10
    ldr r7, _LIT9
    mov ip, ip, lsr #0x1c
    and r8, r6, #0x1
    mul r6, ip, r4
    mla r4, r8, lr, r7
    ldrh r4, [r6, r4]
    bic r6, r1, #0x4000
    movgt r3, #0x1
    mov r1, r4, lsl #0x1f
    orr r1, r6, r1, lsr #0x11
    str r1, [sp]
    and r1, r2, #0x1
    ldr r4, [sp]
    cmp r1, #0x0
    ldr r1, _LIT0
    bic r4, r4, #0x10000
    mov r2, r3, lsl #0x1f
    orr r2, r4, r2, lsr #0xf
    str r2, [sp]
    movgt r4, #0x1
    ldr r2, [sp]
    ldrb r1, [r1, #0x9]
    movle r4, #0x0
    bic r3, r2, #0x20000
    mov r2, r4, lsl #0x1f
    orr r2, r3, r2, lsr #0xe
    bic r2, r2, #0xc0000
    mov r1, r1, lsl #0x1e
    orr r1, r2, r1, lsr #0xc
    mov r0, r0, lsr #0x10
    str r1, [sp]
    bl func_ov002_02244fe4
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #0xff
    orr r1, r1, #0x7
    str r1, [r0, #0x18]
.L_2a4:
    bl func_ov002_021e7418
    cmp r0, #0x0
    bne .L_2c4
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #0xff
    orr r1, r1, #0x8
    str r1, [r0, #0x18]
.L_2c4:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_2d0:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022ce288
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022cd318
_LIT5: .word data_ov002_022d016c
_LIT6: .word data_ov002_022cd744
_LIT7: .word 0x000001ff
_LIT8: .word data_ov002_022cf1a4
_LIT9: .word data_ov002_022cf1a2
