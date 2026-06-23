; func_ov011_021cff20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_02018b14
        .extern func_0201b7bc
        .extern func_0201be58
        .extern func_0201bf0c
        .extern func_0201c144
        .extern func_ov000_021ab5ec
        .extern func_ov000_021ab660
        .extern func_ov011_021ca520
        .extern func_ov011_021cb154
        .extern func_ov011_021cc310
        .extern func_ov011_021cce78
        .extern func_ov011_021cd574
        .extern func_ov011_021cf1f4
        .extern func_ov011_021cf218
        .extern func_ov011_021cfa34
        .extern func_ov011_021cfb08
        .extern func_ov011_021cfe84
        .extern func_ov011_021cfed8
        .extern func_ov011_021d1a80
        .extern func_ov011_021d1c28
        .global func_ov011_021cff20
        .arm
func_ov011_021cff20:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2b0]
    mov r5, #0x0
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x18
    bne .L_2c
    cmp r0, #0x0
    beq .L_54
    b .L_2a8
.L_2c:
    cmp r0, #0x16
    bhi .L_2a8
    cmp r0, #0x14
    bcc .L_2a8
    beq .L_fc
    cmp r0, #0x15
    beq .L_228
    cmp r0, #0x16
    beq .L_240
    b .L_2a8
.L_54:
    bl func_0201b7bc
    ldr r0, [r4, #0x284]
    mov r0, r0, lsl #0x4
    movs r0, r0, lsr #0x18
    beq .L_80
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    orr r0, r0, #0x2c000
    str r0, [r4, #0x274]
    b .L_f0
.L_80:
    ldr r0, [r4, #0x278]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x2
    bne .L_b0
    bl func_ov011_021cf1f4
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    orr r0, r0, #0x28000
    str r0, [r4, #0x274]
    b .L_f0
.L_b0:
    mov r0, #0x5
    bl func_0201c144
    ldr r0, [r4, #0x264]
    cmp r0, #0x1
    bne .L_e8
    bl func_0201be58
    cmp r0, #0x0
    bne .L_dc
    bl func_0201bf0c
    cmp r0, #0x0
    beq .L_e8
.L_dc:
    mov r0, #0x1
    bl func_ov011_021cfed8
    b .L_f0
.L_e8:
    mov r0, #0x1
    bl func_ov011_021cfa34
.L_f0:
    bl func_ov011_021cb154
    bl func_ov011_021cd574
    b .L_2ac
.L_fc:
    ldr r0, [r4, #0x284]
    mov r1, r0, lsl #0x3
    movs r1, r1, lsr #0x1f
    beq .L_12c
    mov r0, r0, lsl #0x4
    movs r0, r0, lsr #0x18
    bne .L_12c
    bl func_ov011_021cf1f4
    ldr r0, [r4, #0x284]
    bic r0, r0, #0x10000000
    str r0, [r4, #0x284]
    b .L_21c
.L_12c:
    bl func_ov011_021cf218
    cmp r0, #0x0
    beq .L_21c
    ldr r0, [r4, #0x284]
    mov r0, r0, lsl #0x4
    movs r0, r0, lsr #0x18
    bne .L_21c
    bl func_02018b14
    cmp r0, #0x0
    beq .L_19c
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_174
    mov r0, #0x0
    mov r1, #0x10
    bl func_ov000_021ab660
.L_174:
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0xb
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0xb
    str r0, [r4, #0x274]
    b .L_21c
.L_19c:
    mov r0, #0x5
    bl func_0201c144
    bl func_0201be58
    cmp r0, #0x0
    bne .L_1bc
    bl func_0201bf0c
    cmp r0, #0x0
    beq .L_1d0
.L_1bc:
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    str r0, [r4, #0x274]
    b .L_21c
.L_1d0:
    ldr r0, [r4, #0x278]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x2
    bne .L_208
    bl func_ov011_021ca520
    bl func_ov011_021cc310
    ldr r0, [r4, #0x268]
    bic r0, r0, #0xf
    str r0, [r4, #0x268]
    bl func_ov011_021cce78
    ldr r0, [r4, #0x270]
    bic r0, r0, #0x10000000
    str r0, [r4, #0x270]
.L_208:
    mov r0, #0x1
    bl func_ov011_021cfa34
    ldr r0, [r4, #0x278]
    bic r0, r0, #0xf
    str r0, [r4, #0x278]
.L_21c:
    bl func_ov011_021cb154
    bl func_ov011_021cd574
    b .L_2ac
.L_228:
    bl func_ov000_021ab5ec
    cmp r0, #0x0
    movne r5, #0x1
    bl func_ov011_021cb154
    bl func_ov011_021cd574
    b .L_2ac
.L_240:
    bl func_ov000_021ab5ec
    cmp r0, #0x0
    beq .L_29c
    ldr r0, [r4, #0x284]
    mov r0, r0, lsl #0x3
    movs r0, r0, lsr #0x1f
    bne .L_264
    bl func_ov011_021cfe84
    bl func_ov011_021d1a80
.L_264:
    ldr r0, [r4, #0x284]
    orr r1, r0, #0x10000000
    mov r0, r1, lsl #0x4
    str r1, [r4, #0x284]
    movs r0, r0, lsr #0x18
    bne .L_29c
    bl func_ov011_021d1c28
    cmp r0, #0x0
    bne .L_29c
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    orr r0, r0, #0x28000
    str r0, [r4, #0x274]
.L_29c:
    bl func_ov011_021cb154
    bl func_ov011_021cd574
    b .L_2ac
.L_2a8:
    bl func_ov011_021cfb08
.L_2ac:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word 0xffe01fff
