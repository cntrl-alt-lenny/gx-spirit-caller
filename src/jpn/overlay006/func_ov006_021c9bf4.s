; func_ov006_021c9bf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_021ce9e0
        .extern data_ov006_021ce9e4
        .extern data_ov006_021cea0c
        .extern data_ov006_021cea2c
        .extern data_ov006_0224f328
        .extern func_ov006_021b6e18
        .extern func_ov006_021b9b98
        .extern func_ov006_021c7f5c
        .extern func_ov006_021c9b48
        .global func_ov006_021c9bf4
        .arm
func_ov006_021c9bf4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r4, [r6, #0x78]
    ldr r3, [r6, #0x74]
    mla r5, r4, r2, r1
    sub r3, r3, #0x15
    cmp r3, #0x8
    addls pc, pc, r3, lsl #0x2
    b .L_218
    b .L_f4
    b .L_13c
    b .L_158
    b .L_164
    b .L_170
    b .L_18c
    b .L_1a8
    b .L_1c4
    b .L_1e0
.L_f4:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1d
    ldrne r1, _LIT2
    ldrnesb r1, [r1, r5]
    bne .L_130
    ldr r2, _LIT3
    ldr r1, _LIT4
    ldrb r2, [r2, r5, lsl #0x1]
    ldrb r1, [r1, r5, lsl #0x1]
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
.L_130:
    bl func_ov006_021b9b98
    mov r4, r0
    b .L_1e8
.L_13c:
    bl func_ov006_021c9b48
    mov r2, r0
    mov r0, r6
    mov r1, #0x3
    bl func_ov006_021c7f5c
    mov r4, r0
    b .L_1e8
.L_158:
    ldr r0, _LIT5
    ldrsb r4, [r0, r5]
    b .L_1e8
.L_164:
    ldr r0, _LIT6
    ldrsb r4, [r0, r5]
    b .L_1e8
.L_170:
    bl func_ov006_021c9b48
    mov r2, r0
    mov r0, r6
    mov r1, #0x5
    bl func_ov006_021c7f5c
    mov r4, r0
    b .L_1e8
.L_18c:
    bl func_ov006_021c9b48
    mov r2, r0
    mov r0, r6
    mov r1, #0x6
    bl func_ov006_021c7f5c
    mov r4, r0
    b .L_1e8
.L_1a8:
    bl func_ov006_021c9b48
    mov r2, r0
    mov r0, r6
    mov r1, #0x7
    bl func_ov006_021c7f5c
    mov r4, r0
    b .L_1e8
.L_1c4:
    bl func_ov006_021c9b48
    mov r2, r0
    mov r0, r6
    mov r1, #0x9
    bl func_ov006_021c7f5c
    mov r4, r0
    b .L_1e8
.L_1e0:
    ldr r0, _LIT7
    ldrsb r4, [r0, r5]
.L_1e8:
    cmp r4, #0x0
    blt .L_210
    ldr r1, [r6, #0x4c]
    ldr r3, [r6, #0x50]
    ldr r0, _LIT1
    mov r2, r4
    bl func_ov006_021b6e18
    cmp r0, #0x0
    mvnlt r4, #0x0
    b .L_224
.L_210:
    mvn r4, #0x0
    b .L_224
.L_218:
    mov r0, r6
    bl func_ov006_021c9b48
    mov r4, r0
.L_224:
    mov r0, r5, asr #0x4
    add r0, r5, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    add r2, r6, r0, lsl #0x2
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldr r2, [r2, #0x64]
    mov r1, #0x1
    tst r2, r1, lsl r0
    subne r4, r1, #0x2
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov006_0224f328
_LIT2: .word data_ov006_021ce9e4+0xc
_LIT3: .word data_ov006_021cea2c+0x1
_LIT4: .word data_ov006_021cea2c
_LIT5: .word data_ov006_021cea0c
_LIT6: .word data_ov006_021ce9e4
_LIT7: .word data_ov006_021ce9e0
