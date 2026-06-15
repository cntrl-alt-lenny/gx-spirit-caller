; func_020186c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013aa0
        .extern func_02013b4c
        .extern func_02013c64
        .extern func_02013e4c
        .extern func_0201406c
        .extern func_020142b4
        .extern func_02014478
        .extern func_02014630
        .extern func_02014814
        .extern func_02014920
        .extern func_02014b28
        .extern func_02014bf4
        .extern func_02014c3c
        .extern func_02014e6c
        .extern func_02015190
        .extern func_020152ec
        .extern func_02015494
        .extern func_02015638
        .extern func_020157d4
        .extern func_02015974
        .extern func_02015b10
        .extern func_02015e00
        .extern func_02015f7c
        .extern func_020161ac
        .extern func_020162d0
        .extern func_02016400
        .extern func_0201660c
        .extern func_020167c0
        .extern func_020169d0
        .extern func_02016b60
        .extern func_02016cd8
        .extern func_02017018
        .extern func_020172a0
        .extern func_0201762c
        .extern func_02017888
        .extern func_02017a98
        .extern func_02017afc
        .extern func_02017be0
        .extern func_02017d18
        .extern func_02017df0
        .extern func_02017ea8
        .extern func_0201816c
        .extern func_020181d0
        .extern func_02018358
        .extern func_020186b0
        .global func_020186c8
        .arm
func_020186c8:
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
    bl func_02013aa0
    b .L_324
.L_118:
    mov r0, r6
    bl func_02013b4c
    b .L_324
.L_124:
    mov r0, r6
    bl func_02013c64
    b .L_324
.L_130:
    mov r0, r6
    bl func_02013e4c
    b .L_324
.L_13c:
    mov r0, r6
    bl func_0201406c
    b .L_324
.L_148:
    mov r0, r6
    bl func_020142b4
    b .L_324
.L_154:
    mov r0, r6
    bl func_02014478
    b .L_324
.L_160:
    mov r0, r6
    bl func_02014630
    b .L_324
.L_16c:
    mov r0, r6
    bl func_02014814
    b .L_324
.L_178:
    mov r0, r6
    bl func_02014920
    b .L_324
.L_184:
    mov r0, r6
    bl func_02014b28
    b .L_324
.L_190:
    mov r0, r6
    bl func_02014bf4
    b .L_324
.L_19c:
    mov r0, r6
    bl func_02014c3c
    b .L_324
.L_1a8:
    mov r0, r6
    bl func_02014e6c
    b .L_324
.L_1b4:
    mov r0, r6
    bl func_02015190
    b .L_324
.L_1c0:
    mov r0, r6
    bl func_020152ec
    b .L_324
.L_1cc:
    mov r0, r6
    bl func_02015494
    b .L_324
.L_1d8:
    mov r0, r6
    bl func_02015638
    b .L_324
.L_1e4:
    mov r0, r6
    bl func_020157d4
    b .L_324
.L_1f0:
    mov r0, r6
    bl func_02015974
    b .L_324
.L_1fc:
    mov r0, r6
    bl func_02015b10
    b .L_324
.L_208:
    mov r0, r6
    bl func_02015e00
    b .L_324
.L_214:
    mov r0, r6
    bl func_02015f7c
    b .L_324
.L_220:
    mov r0, r6
    bl func_020161ac
    b .L_324
.L_22c:
    mov r0, r6
    bl func_020162d0
    b .L_324
.L_238:
    mov r0, r6
    bl func_02016400
    b .L_324
.L_244:
    mov r0, r6
    bl func_0201660c
    b .L_324
.L_250:
    mov r0, r6
    bl func_020167c0
    b .L_324
.L_25c:
    mov r0, r6
    bl func_020169d0
    b .L_324
.L_268:
    mov r0, r6
    bl func_02016b60
    b .L_324
.L_274:
    mov r0, r6
    bl func_02016cd8
    b .L_324
.L_280:
    mov r0, r6
    bl func_02017018
    b .L_324
.L_28c:
    mov r0, r6
    bl func_020172a0
    b .L_324
.L_298:
    mov r0, r6
    bl func_0201762c
    b .L_324
.L_2a4:
    mov r0, r6
    bl func_02017888
    b .L_324
.L_2b0:
    mov r0, r6
    bl func_02017a98
    b .L_324
.L_2bc:
    mov r0, r6
    bl func_02017afc
    b .L_324
.L_2c8:
    mov r0, r6
    bl func_02017be0
    b .L_324
.L_2d4:
    mov r0, r6
    bl func_02017d18
    b .L_324
.L_2e0:
    mov r0, r6
    bl func_02017df0
    b .L_324
.L_2ec:
    mov r0, r6
    bl func_02017ea8
    b .L_324
.L_2f8:
    mov r0, r6
    bl func_0201816c
    b .L_324
.L_304:
    mov r0, r6
    bl func_020181d0
    b .L_324
.L_310:
    mov r0, r6
    bl func_02018358
    b .L_324
.L_31c:
    mov r0, r6
    bl func_020186b0
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
