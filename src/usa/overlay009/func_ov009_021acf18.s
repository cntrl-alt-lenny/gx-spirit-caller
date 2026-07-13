; func_ov009_021acf18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_ov009_021adaec
        .extern data_ov009_021adb20
        .extern func_020221e0
        .extern func_020221f8
        .extern func_0202b6f8
        .extern func_020371b8
        .extern func_ov009_021aa3c8
        .extern func_ov009_021ad0dc
        .extern func_ov009_021ad124
        .global func_ov009_021acf18
        .arm
func_ov009_021acf18:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov ip, #0x1
    ldr r3, [r5, #0x18]
    sub r0, ip, #0x2
    mov r4, #0x0
    str r0, [r5, #0x20]
    mov lr, r4
    str r4, [r5, #0x30]
    mov r1, #0xa
.L_1710:
    and r2, r3, #0xf
    cmp r2, #0xf
    bne .L_1738
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1738:
    mul r0, ip, r1
    mla r4, r2, ip, r4
    add lr, lr, #0x1
    mov ip, r0
    cmp lr, #0x8
    mov r3, r3, lsr #0x4
    blt .L_1710
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT0
    cmp r4, r0
    bne .L_17a8
    ldr r0, _LIT1
    ldr r0, [r0, #0x928]
    cmp r0, #0x2d
    bcc .L_17a8
    mov r0, #0x0
    bl func_020221f8
    orr r1, r0, #0x1
    mov r0, #0x0
    bl func_020221e0
    ldr r1, _LIT2
    mov r0, #0x1
    str r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.L_17a8:
    mov r0, r4
    bl func_0202b6f8
    str r0, [r5, #0x20]
    mov r0, #0x0
    str r0, [r5]
    ldr r1, [r5, #0x20]
    cmp r1, #0x0
    ble .L_1854
    mov r0, r5
    bl func_ov009_021ad0dc
    cmp r0, #0x0
    beq .L_1854
    ldr r1, [r5, #0x20]
    mov r0, r5
    bl func_ov009_021ad124
    ldr r1, _LIT1
    str r0, [r5]
    ldr r0, [r1, #0xa64]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0xd
    bne .L_1854
    ldr r0, _LIT3
    mov r2, #0x0
    ldrh r0, [r0, #0xe0]
    cmp r0, #0x0
    beq .L_1828
    cmp r0, #0x1
    beq .L_1830
    cmp r0, #0x2
    moveq r2, #0xf
    b .L_1834
.L_1828:
    mov r2, #0x4
    b .L_1834
.L_1830:
    mov r2, #0x9
.L_1834:
    ldr r1, [r5]
    rsb r0, r2, #0x64
    mul r3, r1, r0
    ldr r2, _LIT4
    mov r0, r3, lsr #0x1f
    smull r1, r3, r2, r3
    add r3, r0, r3, asr #0x5
    str r3, [r5]
.L_1854:
    ldr r0, _LIT5
    mov r2, #0x1
    mov r1, #0x2
    str r2, [r5, #0x28]
    bl func_ov009_021aa3c8
    mov r0, #0x98
    ldr r4, _LIT6
    mov r3, #0x1
    str r3, [r4]
    mov r2, #0x0
    sub r1, r0, #0x99
    str r2, [r4, #0x4]
    bl func_020371b8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x02a45120
_LIT1: .word data_02104e6c
_LIT2: .word data_02103fcc
_LIT3: .word data_0210586c
_LIT4: .word 0x51eb851f
_LIT5: .word data_ov009_021adaec
_LIT6: .word data_ov009_021adb20
