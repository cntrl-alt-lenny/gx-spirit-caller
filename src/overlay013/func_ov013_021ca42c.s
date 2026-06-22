; func_ov013_021ca42c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_021040ac
        .extern data_ov013_021cbc3c
        .extern func_020018d4
        .extern func_02005800
        .extern func_0201c198
        .extern func_0202c0c0
        .extern func_0208c940
        .extern func_ov000_021ab4bc
        .extern func_ov000_021ace2c
        .extern func_ov000_021ace84
        .extern func_ov000_021acebc
        .extern func_ov000_021ad3e8
        .extern func_ov000_021adb70
        .extern func_ov000_021adc30
        .extern func_ov000_021add44
        .extern func_ov000_021aed18
        .extern func_ov000_021af338
        .extern func_ov000_021af368
        .extern func_ov000_021af3d0
        .extern func_ov002_021b1200
        .extern func_ov013_021c9d60
        .extern func_ov013_021ca15c
        .extern func_ov013_021ca2b8
        .global func_ov013_021ca42c
        .arm
func_ov013_021ca42c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r0, #0x0
    ldrh r3, [r2]
    add r1, r2, #0x1000
    sub ip, r2, #0x2
    and r3, r3, #0x43
    orr r3, r3, #0xe90
    orr r3, r3, #0x3000
    strh r3, [r2]
    ldrh r3, [r1]
    ldr r4, _LIT1
    and r3, r3, #0x43
    orr r3, r3, #0x84
    orr r3, r3, #0x2400
    strh r3, [r1]
    ldrh r3, [ip]
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    strh r3, [ip]
    ldrh r3, [r2]
    bic r3, r3, #0x3
    orr r3, r3, #0x3
    strh r3, [r2]
    ldrh r2, [r1]
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r1]
    bl func_ov013_021ca15c
    mov r0, #0x1
    mov r1, #0x2
    bl func_ov000_021ab4bc
    bl func_ov000_021acebc
    mov r0, #0x1
    bl func_ov000_021ace84
    mov r0, #0x1
    bl func_ov000_021aed18
    mov r0, #0x1
    bl func_ov000_021af3d0
    bl func_ov000_021ad3e8
    mov r0, #0x9
    bl func_ov000_021adc30
    bl func_ov000_021adb70
    mov r0, #0xc
    bl func_ov000_021af338
    mov r0, #0x120
    bl func_ov000_021af368
    mov r0, #0x1
    bl func_ov000_021ace2c
    ldr r2, _LIT2
    ldr r0, _LIT3
    ldrh r1, [r2]
    bic r1, r1, #0x3
    strh r1, [r2]
    ldrh r1, [r2, #0x2]
    bic r1, r1, #0x3
    orr r1, r1, #0x1
    strh r1, [r2, #0x2]
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    bne .L_288
    ldr r0, [r4, #0x168]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x1e
    bl func_ov013_021ca2b8
    ldr r0, _LIT4
    bl func_0202c0c0
    mov r1, #0x0
    bl func_ov000_021add44
.L_288:
    mov r0, #0xc0
    bl func_020018d4
    bl func_ov002_021b1200
    ldr r0, _LIT5
    bl func_02005800
    bl func_0208c940
    ldr r2, _LIT6
    mov r0, #0x2
    ldr r1, [r2]
    orr r1, r1, #0x10000
    str r1, [r2]
    .word 0xebffa0ae
    .word 0xebff9bad
    cmp r0, #0x0
    beq .L_2f0
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1e
    beq .L_2ec
    bl GetSystemWork
    ldr r1, [r0, #0x900]
    bic r1, r1, #0x600
    str r1, [r0, #0x900]
    b .L_2f0
.L_2ec:
    .word 0xebffa0a8
.L_2f0:
    mov r0, #0x3
    bl func_0201c198
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0400000a
_LIT1: .word data_ov013_021cbc3c
_LIT2: .word 0x0400000c
_LIT3: .word data_021040ac
_LIT4: .word 0x00000709
_LIT5: .word func_ov013_021c9d60
_LIT6: .word 0x04001000
