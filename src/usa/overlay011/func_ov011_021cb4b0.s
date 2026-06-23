; func_ov011_021cb4b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov011_021d2ec4
        .extern data_ov011_021d2ee4
        .extern data_ov011_021d2ef4
        .extern data_ov011_021d2f08
        .extern data_ov011_021d3008
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern data_ov011_021d3fdc
        .extern data_ov011_021d3fe0
        .extern data_ov011_021d3fe4
        .extern data_ov011_021d4000
        .extern data_ov011_021d4008
        .extern data_ov011_021d400c
        .extern data_ov011_021d4010
        .extern data_ov011_021d4014
        .extern data_ov011_021d401c
        .extern data_ov011_021d4020
        .extern data_ov011_021d4024
        .extern data_ov011_021d4028
        .extern data_ov011_021d4030
        .extern data_ov011_021d4040
        .extern data_ov011_021d4060
        .extern data_ov011_021d4094
        .extern data_ov011_021d4098
        .extern data_ov011_021d40a0
        .extern data_ov011_021d40a8
        .extern data_ov011_021d40b0
        .extern data_ov011_021d40c0
        .extern func_020018b4
        .extern func_020057e4
        .extern func_02013980
        .extern func_02018b60
        .extern func_02018e98
        .extern func_02019150
        .extern func_0201b6a4
        .extern func_0201e78c
        .extern func_0201ef3c
        .extern func_0202ada4
        .extern func_0202c01c
        .extern func_0208c858
        .extern func_ov000_021ab60c
        .extern func_ov000_021ac398
        .extern func_ov000_021ac428
        .extern func_ov000_021ac450
        .extern func_ov000_021acddc
        .extern func_ov000_021ada90
        .extern func_ov000_021aec2c
        .extern func_ov000_021af3ec
        .extern func_ov011_021c9cc0
        .extern func_ov011_021c9fcc
        .extern func_ov011_021ca244
        .extern func_ov011_021ca520
        .extern func_ov011_021ca59c
        .extern func_ov011_021cace0
        .extern func_ov011_021cb43c
        .extern func_ov011_021cbb44
        .extern func_ov011_021cc404
        .extern func_ov011_021ccf60
        .extern func_ov011_021cd210
        .extern func_ov011_021ce0cc
        .extern func_ov011_021ce260
        .extern func_ov011_021ce270
        .extern func_ov011_021d0b58
        .extern func_ov011_021d0b74
        .extern func_ov011_021d0d94
        .extern func_ov011_021d0ec8
        .extern func_ov011_021d1104
        .extern func_ov011_021d2b74
        .global func_ov011_021cb4b0
        .arm
func_ov011_021cb4b0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x70
    ldr r5, _LIT0
    ldr r7, _LIT1
    ldrh r0, [r5]
    sub r8, r5, #0x2
    add r6, sp, #0x30
    and r0, r0, #0x43
    orr r0, r0, #0xc90
    orr r0, r0, #0xf000
    strh r0, [r5]
    ldrh r4, [r8]
    ldmia r7!, {r0, r1, r2, r3}
    bic r4, r4, #0x3
    orr r4, r4, #0x2
    strh r4, [r8]
    ldrh r8, [r5]
    ldr r4, _LIT2
    bic r8, r8, #0x3
    orr r8, r8, #0x3
    strh r8, [r5]
    ldrh r8, [r5, #0x4]
    bic r8, r8, #0x3
    orr r8, r8, #0x2
    strh r8, [r5, #0x4]
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7, {r0, r1, r2, r3}
    stmia r6, {r0, r1, r2, r3}
    bl func_0201e78c
    mov r3, #0x0
    str r3, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    add r1, sp, #0x30
    str r1, [sp, #0x8]
    mov r0, #0x40
    str r3, [sp, #0xc]
    str r0, [sp, #0x10]
    ldr r1, _LIT3
    ldr r0, _LIT4
    str r1, [sp, #0x14]
    ldr r1, _LIT5
    ldr r2, _LIT6
    bl func_0201ef3c
    bl func_0201e78c
    mov r0, #0x40
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    add r1, sp, #0x40
    str r1, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x20
    str r0, [sp, #0x10]
    ldr r1, _LIT7
    ldr r0, _LIT8
    str r1, [sp, #0x14]
    ldr r1, _LIT9
    ldr r2, _LIT10
    mov r3, #0x2000
    bl func_0201ef3c
    bl func_0201e78c
    mov r2, #0x60
    str r2, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    add r1, sp, #0x50
    str r1, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    str r2, [sp, #0x10]
    ldr r1, _LIT11
    ldr r0, _LIT12
    str r1, [sp, #0x14]
    ldr r1, _LIT13
    ldr r2, _LIT14
    mov r3, #0x4000
    bl func_0201ef3c
    bl func_0201e78c
    mov r0, #0x160
    str r0, [sp]
    mov r1, #0x1
    str r1, [sp, #0x4]
    add r0, sp, #0x60
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x40
    str r0, [sp, #0x10]
    ldr r5, _LIT15
    ldr r0, _LIT16
    ldr r1, _LIT17
    ldr r2, _LIT18
    ldr r3, _LIT19
    str r5, [sp, #0x14]
    bl func_0201ef3c
    ldr r0, _LIT20
    add r5, sp, #0x20
    ldmia r0, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    bl func_0201e78c
    mov r0, #0x40
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, r5
    str r1, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x20
    str r0, [sp, #0x10]
    ldr r1, _LIT21
    ldr r0, _LIT22
    str r1, [sp, #0x14]
    ldr r1, _LIT23
    ldr r2, _LIT24
    ldr r3, _LIT25
    bl func_0201ef3c
    bl func_02013980
    mov r2, r0
    mov r0, #0x0
    mov r1, #0x42
    bl func_ov000_021af3ec
    bl func_ov000_021acddc
    mov r0, #0x1
    bl func_ov000_021aec2c
    bl func_ov000_021ada90
    bl func_ov011_021ca244
    mov r0, #0x80
    bl func_020018b4
    ldr r0, _LIT26
    bl func_0202ada4
    .word 0xebff968e
    ldr r0, _LIT27
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c01c
    ldr sl, _LIT28
    ldr r8, _LIT29
    ldr r7, _LIT30
    ldr r6, _LIT31
    ldr r5, _LIT32
    mov r9, #0x0
.L_254:
    add r0, r8, r9, lsl #0x2
    ldrh r1, [r0, #0x2]
    mov r3, r9, lsl #0x2
    add r0, r7, r9, lsl #0x2
    str r1, [sp]
    ldrh r1, [r7, r3]
    ldrh r2, [r0, #0x2]
    ldrh r3, [r8, r3]
    mov r0, sl
    bl func_ov000_021ac398
    mov r0, sl
    mov r1, r6
    bl func_ov000_021ac450
    add r0, r5, r9, lsl #0x1
    ldrb r2, [r0, #0x1]
    ldrb r1, [r5, r9, lsl #0x1]
    mov r0, sl
    bl func_ov000_021ac428
    ldr r1, [sl, #0x8]
    and r0, r9, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [sl, #0x8]
    add r0, r4, r9, lsl #0x2
    add r9, r9, #0x1
    str sl, [r0, #0x1c8]
    cmp r9, #0x5
    add sl, sl, #0x14
    bcc .L_254
    add r0, r4, #0x2a0
    bl func_ov011_021d2b74
    bl func_ov011_021d0b58
    mov r5, #0x0
.L_2d8:
    bl func_ov011_021d0b74
    add r5, r5, #0x1
    cmp r5, #0xa
    blt .L_2d8
    mov r0, #0x0
    mov r1, r0
    bl func_ov011_021d0d94
    mov r7, #0x1
    mov r5, #0x0
    mov r6, r7
    mov r8, r5
.L_304:
    mov r0, r7
    mov r1, r6
    bl func_ov011_021d0d94
    mov r0, r7
    mov r1, r5
    bl func_ov011_021d1104
    sub r0, r7, #0x1
    mov r0, r0, lsl #0x8
    add r1, r0, #0x1880
    mov r0, r7
    mov r2, r8
    add r1, r1, #0xc000
    bl func_ov011_021d0ec8
    add r7, r7, #0x1
    cmp r7, #0xa
    blt .L_304
    ldr r0, _LIT33
    bl func_020057e4
    bl func_0208c858
    ldr r2, _LIT34
    mov r0, #0x0
    ldr r1, [r2]
    orr r1, r1, #0x10000
    str r1, [r2]
    .word 0xebff9bc9
    ldr r1, _LIT35
    ldr r5, [r4, #0x284]
    ldr r3, [r1, #0x48]
    ldr r2, [r4, #0x280]
    mov r0, #0x0
    mov r2, r2, lsl #0x9
    bic r5, r5, #0xff00000
    mov r3, r3, lsl #0x18
    orr r3, r5, r3, lsr #0x4
    str r3, [r4, #0x284]
    str r0, [r1, #0x48]
    movs r1, r2, lsr #0x1f
    beq .L_3f0
    ldr r1, [r4, #0x268]
    str r0, [r4, #0x288]
    bic r0, r1, #0x1e0
    orr r1, r0, #0x20
    mov r0, #0x1
    str r1, [r4, #0x268]
    bl func_ov011_021ce260
    bl func_ov011_021ca59c
    ldr r2, [r4, #0x274]
    ldr r0, _LIT36
    ldr r1, _LIT37
    and r0, r2, r0
    str r0, [r4, #0x274]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x2]
    b .L_520
.L_3f0:
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_02018e98
    mov r0, #0x0
    bl func_02019150
    ldr r1, [r4, #0x268]
    mov r0, r0, lsl #0x1c
    bic r1, r1, #0x1e00
    orr r1, r1, r0, lsr #0x13
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x1c
    bic r1, r1, #0x1e0
    mov r0, r0, lsl #0x1c
    orr r1, r1, r0, lsr #0x17
    ldr r2, [sp, #0x1c]
    mvn r0, #0x0
    str r1, [r4, #0x268]
    cmp r2, r0
    bne .L_480
    mov r5, #0x0
    mov r0, #0x19000
    str r0, [r4, #0x200]
    str r5, [r4, #0x1fc]
    add r0, r4, #0x1fc
    add r3, r4, #0x208
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    mov r0, r5
    mov r1, r5
    bl func_ov011_021ce270
    ldr r1, [r4, #0x280]
    mov r0, r5
    orr r1, r1, #0x200
    str r1, [r4, #0x280]
    bl func_ov011_021cace0
    b .L_520
.L_480:
    ldr r0, [r4, #0x270]
    ldr r1, [sp, #0x18]
    bic r0, r0, #0xff
    str r2, [r4, #0x21c]
    str r1, [r4, #0x220]
    str r0, [r4, #0x270]
    bl func_02018b60
    ldr r0, [r0, #0x1c]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_500
    bl func_02018b60
    ldr r0, [r0, #0x1c]
    mov r0, r0, lsl #0x18
    mov r5, r0, lsr #0x18
    mov r0, r5
    bl func_0201b6a4
    cmp r0, #0x0
    beq .L_4f0
    add r1, sp, #0x1c
    add r2, sp, #0x18
    mov r0, r5
    bl func_ov011_021cd210
    ldr r1, [r4, #0x270]
    and r0, r0, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r4, #0x270]
.L_4f0:
    bl func_02018b60
    ldr r1, [r0, #0x1c]
    bic r1, r1, #0xff
    str r1, [r0, #0x1c]
.L_500:
    ldr r0, [sp, #0x1c]
    ldr r1, [sp, #0x18]
    bl func_ov011_021cbb44
    mov r0, #0x1
    mov r1, r0
    mov r2, r0
    bl func_ov011_021ce0cc
    bl func_ov011_021ca520
.L_520:
    bl func_ov011_021c9cc0
    bl func_ov011_021ccf60
    bl func_ov011_021cb43c
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_54c
    mov r0, #0x0
    mov r1, #0x10
    bl func_ov000_021ab60c
.L_54c:
    mov r0, #0x1
    add sp, sp, #0x70
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x0400000a
_LIT1: .word data_ov011_021d3008
_LIT2: .word data_ov011_021d3f5c
_LIT3: .word data_ov011_021d4098
_LIT4: .word data_ov011_021d4008
_LIT5: .word data_ov011_021d401c
_LIT6: .word data_ov011_021d4030
_LIT7: .word data_ov011_021d40a0
_LIT8: .word data_ov011_021d400c
_LIT9: .word data_ov011_021d4020
_LIT10: .word data_ov011_021d4040
_LIT11: .word data_ov011_021d40a8
_LIT12: .word data_ov011_021d4010
_LIT13: .word data_ov011_021d4024
_LIT14: .word data_ov011_021d4060
_LIT15: .word data_ov011_021d40b0
_LIT16: .word data_ov011_021d4014
_LIT17: .word data_ov011_021d4028
_LIT18: .word data_ov011_021d4094
_LIT19: .word 0x0000dd80
_LIT20: .word data_ov011_021d2ee4
_LIT21: .word data_ov011_021d4000
_LIT22: .word data_ov011_021d3fdc
_LIT23: .word data_ov011_021d3fe0
_LIT24: .word data_ov011_021d3fe4
_LIT25: .word 0x0001d680
_LIT26: .word data_ov011_021d3f20
_LIT27: .word data_02104e6c
_LIT28: .word data_ov011_021d40c0
_LIT29: .word data_ov011_021d2f08
_LIT30: .word data_ov011_021d2ef4
_LIT31: .word func_ov011_021cc404
_LIT32: .word data_ov011_021d2ec4
_LIT33: .word func_ov011_021c9fcc
_LIT34: .word 0x04001000
_LIT35: .word data_02103fcc
_LIT36: .word 0xffe01fff
_LIT37: .word 0x0400000c
