; func_02018694 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013a6c
        .extern func_02013b18
        .extern func_02013c30
        .extern func_02013e18
        .extern func_02014038
        .extern func_02014280
        .extern func_02014444
        .extern func_020145fc
        .extern func_020147e0
        .extern func_020148ec
        .extern func_02014af4
        .extern func_02014bc0
        .extern func_02014c08
        .extern func_02014e38
        .extern func_0201515c
        .extern func_020152b8
        .extern func_02015460
        .extern func_02015604
        .extern func_020157a0
        .extern func_02015940
        .extern func_02015adc
        .extern func_02015dcc
        .extern func_02015f48
        .extern func_02016178
        .extern func_0201629c
        .extern func_020163cc
        .extern func_020165d8
        .extern func_0201678c
        .extern func_0201699c
        .extern func_02016b2c
        .extern func_02016ca4
        .extern func_02016fe4
        .extern func_0201726c
        .extern func_020175f8
        .extern func_02017854
        .extern func_02017a64
        .extern func_02017ac8
        .extern func_02017bac
        .extern func_02017ce4
        .extern func_02017dbc
        .extern func_02017e74
        .extern func_02018138
        .extern func_0201819c
        .extern func_02018324
        .extern func_0201867c
        .global func_02018694
        .arm
func_02018694:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8e0]
    ldr r5, [r4, #0x918]
    orr r0, r0, #0x4
    str r0, [r4, #0x8e0]
    mov r0, #0xa
    str r0, [r4, #0x918]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_334
.L_38:
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x4
    str r0, [r4, #0x8e0]
    ldr r0, [r4, #0x91c]
    cmp r0, #0x2d
    addls pc, pc, r0, lsl #0x2
    b .L_324
    b .L_324
    b .L_10c
    b .L_118
    b .L_124
    b .L_130
    b .L_13c
    b .L_148
    b .L_154
    b .L_160
    b .L_16c
    b .L_178
    b .L_184
    b .L_190
    b .L_19c
    b .L_1a8
    b .L_1b4
    b .L_1c0
    b .L_1cc
    b .L_1d8
    b .L_1e4
    b .L_1f0
    b .L_1fc
    b .L_208
    b .L_214
    b .L_220
    b .L_22c
    b .L_238
    b .L_244
    b .L_250
    b .L_25c
    b .L_268
    b .L_274
    b .L_280
    b .L_28c
    b .L_298
    b .L_2a4
    b .L_2b0
    b .L_2bc
    b .L_2c8
    b .L_2d4
    b .L_2e0
    b .L_2ec
    b .L_2f8
    b .L_304
    b .L_310
    b .L_31c
.L_10c:
    mov r0, r6
    bl func_02013a6c
    b .L_324
.L_118:
    mov r0, r6
    bl func_02013b18
    b .L_324
.L_124:
    mov r0, r6
    bl func_02013c30
    b .L_324
.L_130:
    mov r0, r6
    bl func_02013e18
    b .L_324
.L_13c:
    mov r0, r6
    bl func_02014038
    b .L_324
.L_148:
    mov r0, r6
    bl func_02014280
    b .L_324
.L_154:
    mov r0, r6
    bl func_02014444
    b .L_324
.L_160:
    mov r0, r6
    bl func_020145fc
    b .L_324
.L_16c:
    mov r0, r6
    bl func_020147e0
    b .L_324
.L_178:
    mov r0, r6
    bl func_020148ec
    b .L_324
.L_184:
    mov r0, r6
    bl func_02014af4
    b .L_324
.L_190:
    mov r0, r6
    bl func_02014bc0
    b .L_324
.L_19c:
    mov r0, r6
    bl func_02014c08
    b .L_324
.L_1a8:
    mov r0, r6
    bl func_02014e38
    b .L_324
.L_1b4:
    mov r0, r6
    bl func_0201515c
    b .L_324
.L_1c0:
    mov r0, r6
    bl func_020152b8
    b .L_324
.L_1cc:
    mov r0, r6
    bl func_02015460
    b .L_324
.L_1d8:
    mov r0, r6
    bl func_02015604
    b .L_324
.L_1e4:
    mov r0, r6
    bl func_020157a0
    b .L_324
.L_1f0:
    mov r0, r6
    bl func_02015940
    b .L_324
.L_1fc:
    mov r0, r6
    bl func_02015adc
    b .L_324
.L_208:
    mov r0, r6
    bl func_02015dcc
    b .L_324
.L_214:
    mov r0, r6
    bl func_02015f48
    b .L_324
.L_220:
    mov r0, r6
    bl func_02016178
    b .L_324
.L_22c:
    mov r0, r6
    bl func_0201629c
    b .L_324
.L_238:
    mov r0, r6
    bl func_020163cc
    b .L_324
.L_244:
    mov r0, r6
    bl func_020165d8
    b .L_324
.L_250:
    mov r0, r6
    bl func_0201678c
    b .L_324
.L_25c:
    mov r0, r6
    bl func_0201699c
    b .L_324
.L_268:
    mov r0, r6
    bl func_02016b2c
    b .L_324
.L_274:
    mov r0, r6
    bl func_02016ca4
    b .L_324
.L_280:
    mov r0, r6
    bl func_02016fe4
    b .L_324
.L_28c:
    mov r0, r6
    bl func_0201726c
    b .L_324
.L_298:
    mov r0, r6
    bl func_020175f8
    b .L_324
.L_2a4:
    mov r0, r6
    bl func_02017854
    b .L_324
.L_2b0:
    mov r0, r6
    bl func_02017a64
    b .L_324
.L_2bc:
    mov r0, r6
    bl func_02017ac8
    b .L_324
.L_2c8:
    mov r0, r6
    bl func_02017bac
    b .L_324
.L_2d4:
    mov r0, r6
    bl func_02017ce4
    b .L_324
.L_2e0:
    mov r0, r6
    bl func_02017dbc
    b .L_324
.L_2ec:
    mov r0, r6
    bl func_02017e74
    b .L_324
.L_2f8:
    mov r0, r6
    bl func_02018138
    b .L_324
.L_304:
    mov r0, r6
    bl func_0201819c
    b .L_324
.L_310:
    mov r0, r6
    bl func_02018324
    b .L_324
.L_31c:
    mov r0, r6
    bl func_0201867c
.L_324:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_38
.L_334:
    ldr r0, [r4, #0x918]
    cmp r0, #0x0
    bne .L_354
    ldr r0, [r4, #0x818]
    cmp r0, #0x0
    ldrne r0, [r4, #0x900]
    orrne r0, r0, #0x10000000
    strne r0, [r4, #0x900]
.L_354:
    ldr r0, [r4, #0x918]
    cmp r0, #0xa
    streq r5, [r4, #0x918]
    ldmia sp!, {r4, r5, r6, pc}
