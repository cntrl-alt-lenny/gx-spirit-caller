; func_ov011_021cf318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov011_021d3ecc
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_02018b60
        .extern func_02018b8c
        .extern func_020190f0
        .extern func_0201960c
        .extern func_02019648
        .extern func_0201b5cc
        .extern func_0201b5f0
        .extern func_0201be58
        .extern func_0201bf0c
        .extern func_0201c144
        .extern func_ov011_021c9db8
        .extern func_ov011_021ca320
        .extern func_ov011_021cdb14
        .extern func_ov011_021cdb78
        .extern func_ov011_021cf238
        .extern func_ov011_021cf294
        .extern func_ov011_021cf2e0
        .extern func_ov011_021cfa60
        .extern func_ov011_021d0e54
        .extern func_ov011_021d0ea8
        .extern func_ov011_021d0f38
        .extern func_ov011_021d0f64
        .extern func_ov011_021d1ed8
        .global func_ov011_021cf318
        .arm
func_ov011_021cf318:
    stmdb sp!, {r4, r5, r6, lr}
    mov r0, #0x6
    ldr r4, _LIT0
    bl func_0201c144
    mov r0, #0x0
    bl func_ov011_021c9db8
    ldr r0, _LIT1
    ldr r1, [r0, #0x2b0]
    bic r1, r1, #0x100
    str r1, [r0, #0x2b0]
    ldr r0, [r0, #0x294]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021d0f38
    cmp r0, #0x1
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    bne .L_138
    mov r0, r0, lsr #0x18
    bl func_ov011_021d0f64
    add r6, r0, #0x65
    bl func_ov011_021cdb14
    mov r5, r0
    mov r0, r6
    bl func_0201960c
    bl func_02018b60
    ldr r2, [r0, #0x1c]
    and r1, r6, #0xff
    bic r2, r2, #0xff
    orr r1, r2, r1
    str r1, [r0, #0x1c]
    bl func_020190f0
    mov r1, r0
    mov r0, r6
    bl func_ov011_021d1ed8
    mov r6, r0
    cmp r5, #0x0
    beq .L_b4
    mov r0, r5
    bl func_02019648
    bl func_ov011_021cf294
    mov r0, r5
    mov r1, #0x1
    bl func_ov011_021cdb78
    b .L_20c
.L_b4:
    mov r0, #0x0
    bl func_02019648
    mov r0, #0x5
    bl func_0201c144
    bl func_0201be58
    cmp r0, #0x0
    bne .L_dc
    bl func_0201bf0c
    cmp r0, #0x0
    beq .L_e4
.L_dc:
    bl func_ov011_021cf294
    b .L_20c
.L_e4:
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021cf2e0
    cmp r0, #0x0
    beq .L_11c
    bl func_ov011_021cfa60
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    orr r0, r0, #0x600000
    orr r0, r0, #0x100
    str r0, [r4, #0x274]
    b .L_20c
.L_11c:
    ldr r0, _LIT3
    .word 0xebff87a3
    bl GetSystemWork
    ldr r1, [r0, #0x8e8]
    orr r1, r1, #0x80000
    str r1, [r0, #0x8e8]
    b .L_20c
.L_138:
    mov r0, r0, lsr #0x18
    bl func_ov011_021d0e54
    mov r5, r0
    cmp r5, #0x65
    bne .L_180
    bl func_0201b5f0
    cmp r0, #0x0
    bne .L_180
    mov r0, #0x65
    bl func_0201960c
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021d0ea8
    bl func_02019648
    mov r0, #0x1
    bl func_0201b5cc
    b .L_204
.L_180:
    cmp r5, #0x65
    beq .L_1fc
    mov r0, r5
    bl func_02018b8c
    ldr r0, [r0, #0x8]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1f
    bne .L_1f0
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1c
    bne .L_1d8
    ldr r0, [r4, #0x21c]
    ldr r1, [r4, #0x220]
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    bl func_ov011_021ca320
    ldr r1, [r4, #0x268]
    mov r2, r0, lsl #0x1c
    bic r0, r1, #0x1e000
    orr r0, r0, r2, lsr #0xf
    str r0, [r4, #0x268]
.L_1d8:
    mov r0, r5
    bl func_02019648
    mov r0, r5
    mov r1, #0x1
    bl func_ov011_021cdb78
    b .L_204
.L_1f0:
    mov r0, #0x5
    bl func_0201c144
    b .L_204
.L_1fc:
    mov r0, #0x5
    bl func_0201c144
.L_204:
    bl func_ov011_021cf294
    mov r6, r0
.L_20c:
    bl func_02018b60
    ldr r0, [r0, #0x10]
    tst r0, #0x100
    bne .L_22c
    bl func_02018b60
    ldr r0, [r0, #0x10]
    tst r0, #0x200
    beq .L_240
.L_22c:
    mov r0, r5
    mov r2, r6
    mov r1, #0x0
    bl func_ov011_021cf238
    ldmia sp!, {r4, r5, r6, pc}
.L_240:
    bl func_02018b60
    ldr r1, [r0, #0x1c]
    bic r1, r1, #0xff
    str r1, [r0, #0x1c]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov011_021d3f5c
_LIT1: .word data_ov011_021d3f20
_LIT2: .word 0xe01fffff
_LIT3: .word data_ov011_021d3ecc
