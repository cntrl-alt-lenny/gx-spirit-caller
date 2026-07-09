; func_ov002_022460f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cabbc
        .extern data_ov002_022cd314
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_0229cc78
        .extern func_ov002_0229cca8
        .global func_ov002_022460f0
        .arm
func_ov002_022460f0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r1, #0x0
    ldr r2, _LIT0
    strh r1, [r4]
    ldr r3, [r2, #0x5d4]
    cmp r3, #0x0
    beq .L_3c4
    ldrb r3, [r2, #0x5dc]
    ldr r2, [r2, #0x5fc]
    str r2, [sp]
    cmp r3, #0x21
    addls pc, pc, r3, lsl #0x2
    b .L_3ac
    b .L_3ac
    b .L_c4
    b .L_d0
    b .L_dc
    b .L_dc
    b .L_10c
    b .L_13c
    b .L_13c
    b .L_13c
    b .L_13c
    b .L_13c
    b .L_2b0
    b .L_2bc
    b .L_264
    b .L_270
    b .L_27c
    b .L_2c8
    b .L_3ac
    b .L_20c
    b .L_24c
    b .L_258
    b .L_3ac
    b .L_2a4
    b .L_e8
    b .L_2f0
    b .L_2fc
    b .L_3ac
    b .L_324
    b .L_370
    b .L_37c
    b .L_3a4
    b .L_13c
    b .L_13c
    b .L_13c
.L_c4:
    mov r1, #0x3e
    bl func_ov002_0229cc78
    b .L_3ac
.L_d0:
    mov r1, #0x3f
    bl func_ov002_0229cc78
    b .L_3ac
.L_dc:
    mov r1, #0x40
    bl func_ov002_0229cc78
    b .L_3ac
.L_e8:
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldr r2, [r2, #0xcec]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    beq .L_3ac
    mov r1, #0x110
    bl func_ov002_0229cc78
    b .L_3ac
.L_10c:
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldr r2, [r2, #0xcec]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    beq .L_130
    mov r1, #0xfb
    bl func_ov002_0229cc78
    b .L_3ac
.L_130:
    mov r1, #0x43
    bl func_ov002_0229cc78
    b .L_3ac
.L_13c:
    cmp r3, #0x1f
    add r0, sp, #0x0
    bgt .L_188
    cmp r3, #0x1f
    bge .L_1cc
    cmp r3, #0xa
    addls pc, pc, r3, lsl #0x2
    b .L_1d0
    b .L_1d0
    b .L_1d0
    b .L_1d0
    b .L_1d0
    b .L_1d0
    b .L_1d0
    b .L_1a4
    b .L_1ac
    b .L_1b4
    b .L_1bc
    b .L_1c4
.L_188:
    cmp r3, #0x20
    bgt .L_198
    moveq r1, #0xab
    b .L_1d0
.L_198:
    cmp r3, #0x21
    moveq r1, #0xad
    b .L_1d0
.L_1a4:
    mov r1, #0xfc
    b .L_1d0
.L_1ac:
    mov r1, #0xfe
    b .L_1d0
.L_1b4:
    mov r1, #0x100
    b .L_1d0
.L_1bc:
    mov r1, #0xaf
    b .L_1d0
.L_1c4:
    mov r1, #0x9f
    b .L_1d0
.L_1cc:
    mov r1, #0xa9
.L_1d0:
    ldr r3, [r0]
    ldr r0, _LIT2
    mov r2, r3, lsl #0xf
    ldr ip, [r0, #0x4]
    mov r0, r2, lsr #0x1f
    mov r3, r3, lsl #0x16
    eor r2, ip, #0x1
    eor r0, r0, r3, lsr #0x1f
    cmp r2, r0
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, r4
    add r1, r1, r2
    bl func_ov002_0229cc78
    b .L_3ac
.L_20c:
    cmp r2, #0x0
    beq .L_240
    ldr r0, _LIT2
    ldr r2, _LIT3
    ldr r0, [r0, #0x4]
    ldr r2, [r2]
    eor r0, r0, #0x1
    cmp r2, r0
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xb6
    bl func_ov002_0229cc78
    b .L_3ac
.L_240:
    mov r1, #0x9a
    bl func_ov002_0229cc78
    b .L_3ac
.L_24c:
    mov r1, #0xb5
    bl func_ov002_0229cc78
    b .L_3ac
.L_258:
    mov r1, #0xb1
    bl func_ov002_0229cc78
    b .L_3ac
.L_264:
    ldr r1, _LIT4
    bl func_ov002_0229cc78
    b .L_3ac
.L_270:
    ldr r1, _LIT5
    bl func_ov002_0229cc78
    b .L_3ac
.L_27c:
    ldr r0, _LIT2
    mov r2, r2, lsl #0xa
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r0, r2, lsr #0x1f
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xb9
    bl func_ov002_0229cc78
    b .L_3ac
.L_2a4:
    mov r1, #0xb8
    bl func_ov002_0229cc78
    b .L_3ac
.L_2b0:
    mov r1, #0xb2
    bl func_ov002_0229cc78
    b .L_3ac
.L_2bc:
    mov r1, #0xb3
    bl func_ov002_0229cc78
    b .L_3ac
.L_2c8:
    ldr r0, _LIT2
    mov r2, r2, lsl #0xf
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r0, r2, lsr #0x1f
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xbd
    bl func_ov002_0229cc78
    b .L_3ac
.L_2f0:
    mov r1, #0xc4
    bl func_ov002_0229cc78
    b .L_3ac
.L_2fc:
    ldr r0, _LIT2
    mov r2, r2, lsl #0x16
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r0, r2, lsr #0x1f
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xc5
    bl func_ov002_0229cc78
    b .L_3ac
.L_324:
    mov r1, r2, lsl #0x10
    movs r1, r1, lsr #0x1f
    beq .L_33c
    ldr r1, _LIT6
    bl func_ov002_0229cc78
    b .L_3ac
.L_33c:
    mov r1, r2, lsl #0x9
    mov r1, r1, lsr #0x1c
    cmp r1, #0xb
    beq .L_358
    cmp r1, #0xe
    beq .L_364
    b .L_3ac
.L_358:
    mov r1, #0xc7
    bl func_ov002_0229cc78
    b .L_3ac
.L_364:
    mov r1, #0x10c
    bl func_ov002_0229cc78
    b .L_3ac
.L_370:
    mov r1, #0xc8
    bl func_ov002_0229cc78
    b .L_3ac
.L_37c:
    ldr r0, _LIT2
    mov r2, r2, lsl #0x16
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r0, r2, lsr #0x1f
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xc9
    bl func_ov002_0229cc78
    b .L_3ac
.L_3a4:
    mov r1, #0xcb
    bl func_ov002_0229cc78
.L_3ac:
    ldrh r0, [r4]
    cmp r0, #0x0
    beq .L_3c4
    ldr r1, _LIT7
    mov r0, r4
    bl func_ov002_0229cca8
.L_3c4:
    ldr r1, _LIT8
    mov r0, r4
    bl func_ov002_0229cca8
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd65c
_LIT3: .word data_ov002_022cd314
_LIT4: .word 0x0000010a
_LIT5: .word 0x00000105
_LIT6: .word 0x0000010b
_LIT7: .word data_ov002_022cabbc
_LIT8: .word 0x0000010d
