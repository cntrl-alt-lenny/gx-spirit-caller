; func_ov011_021cffe4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .extern func_02018b48
        .extern func_0201b7fc
        .extern func_0201be98
        .extern func_0201bf4c
        .extern func_0201c198
        .extern func_ov000_021ab6cc
        .extern func_ov000_021ab740
        .extern func_ov011_021ca600
        .extern func_ov011_021cb218
        .extern func_ov011_021cc3d4
        .extern func_ov011_021ccf3c
        .extern func_ov011_021cd638
        .extern func_ov011_021cf2b8
        .extern func_ov011_021cf2dc
        .extern func_ov011_021cfaf8
        .extern func_ov011_021cfbcc
        .extern func_ov011_021cff48
        .extern func_ov011_021cff9c
        .extern func_ov011_021d1b70
        .extern func_ov011_021d1d18
        .global func_ov011_021cffe4
        .arm
func_ov011_021cffe4:
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
    bl func_0201b7fc
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
    bl func_ov011_021cf2b8
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    orr r0, r0, #0x28000
    str r0, [r4, #0x274]
    b .L_f0
.L_b0:
    mov r0, #0x5
    bl func_0201c198
    ldr r0, [r4, #0x264]
    cmp r0, #0x1
    bne .L_e8
    bl func_0201be98
    cmp r0, #0x0
    bne .L_dc
    bl func_0201bf4c
    cmp r0, #0x0
    beq .L_e8
.L_dc:
    mov r0, #0x1
    bl func_ov011_021cff9c
    b .L_f0
.L_e8:
    mov r0, #0x1
    bl func_ov011_021cfaf8
.L_f0:
    bl func_ov011_021cb218
    bl func_ov011_021cd638
    b .L_2ac
.L_fc:
    ldr r0, [r4, #0x284]
    mov r1, r0, lsl #0x3
    movs r1, r1, lsr #0x1f
    beq .L_12c
    mov r0, r0, lsl #0x4
    movs r0, r0, lsr #0x18
    bne .L_12c
    bl func_ov011_021cf2b8
    ldr r0, [r4, #0x284]
    bic r0, r0, #0x10000000
    str r0, [r4, #0x284]
    b .L_21c
.L_12c:
    bl func_ov011_021cf2dc
    cmp r0, #0x0
    beq .L_21c
    ldr r0, [r4, #0x284]
    mov r0, r0, lsl #0x4
    movs r0, r0, lsr #0x18
    bne .L_21c
    bl func_02018b48
    cmp r0, #0x0
    beq .L_19c
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_174
    mov r0, #0x0
    mov r1, #0x10
    bl func_ov000_021ab740
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
    bl func_0201c198
    bl func_0201be98
    cmp r0, #0x0
    bne .L_1bc
    bl func_0201bf4c
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
    bl func_ov011_021ca600
    bl func_ov011_021cc3d4
    ldr r0, [r4, #0x268]
    bic r0, r0, #0xf
    str r0, [r4, #0x268]
    bl func_ov011_021ccf3c
    ldr r0, [r4, #0x270]
    bic r0, r0, #0x10000000
    str r0, [r4, #0x270]
.L_208:
    mov r0, #0x1
    bl func_ov011_021cfaf8
    ldr r0, [r4, #0x278]
    bic r0, r0, #0xf
    str r0, [r4, #0x278]
.L_21c:
    bl func_ov011_021cb218
    bl func_ov011_021cd638
    b .L_2ac
.L_228:
    bl func_ov000_021ab6cc
    cmp r0, #0x0
    movne r5, #0x1
    bl func_ov011_021cb218
    bl func_ov011_021cd638
    b .L_2ac
.L_240:
    bl func_ov000_021ab6cc
    cmp r0, #0x0
    beq .L_29c
    ldr r0, [r4, #0x284]
    mov r0, r0, lsl #0x3
    movs r0, r0, lsr #0x1f
    bne .L_264
    bl func_ov011_021cff48
    bl func_ov011_021d1b70
.L_264:
    ldr r0, [r4, #0x284]
    orr r1, r0, #0x10000000
    mov r0, r1, lsl #0x4
    str r1, [r4, #0x284]
    movs r0, r0, lsr #0x18
    bne .L_29c
    bl func_ov011_021d1d18
    cmp r0, #0x0
    bne .L_29c
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    orr r0, r0, #0x28000
    str r0, [r4, #0x274]
.L_29c:
    bl func_ov011_021cb218
    bl func_ov011_021cd638
    b .L_2ac
.L_2a8:
    bl func_ov011_021cfbcc
.L_2ac:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d403c
_LIT2: .word 0xffe01fff
