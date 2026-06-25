; func_02001520 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b80
        .extern data_02103fcc
        .extern func_02000c4c
        .extern func_02000cc4
        .extern func_02000d4c
        .extern func_02000e34
        .extern func_02000e70
        .extern func_02000f84
        .extern func_0200127c
        .extern func_02001448
        .extern func_0200973c
        .extern func_0200a250
        .extern func_02018b3c
        .extern func_02018e54
        .extern func_0201912c
        .extern func_0201a2f8
        .global func_02001520
        .arm
func_02001520:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_368
    blx r0
    cmp r0, #0x0
    beq .L_360
    ldr r0, [r4, #0xb64]
    cmp r0, #0x38
    addls pc, pc, r0, lsl #0x2
    b .L_35c
    b .L_35c
    b .L_35c
    b .L_118
    b .L_35c
    b .L_170
    b .L_35c
    b .L_168
    b .L_35c
    b .L_188
    b .L_35c
    b .L_1a4
    b .L_35c
    b .L_1b4
    b .L_35c
    b .L_1c4
    b .L_35c
    b .L_1d4
    b .L_35c
    b .L_1e4
    b .L_35c
    b .L_1f4
    b .L_35c
    b .L_204
    b .L_35c
    b .L_214
    b .L_35c
    b .L_224
    b .L_35c
    b .L_234
    b .L_35c
    b .L_244
    b .L_35c
    b .L_254
    b .L_35c
    b .L_264
    b .L_35c
    b .L_2cc
    b .L_35c
    b .L_2c4
    b .L_35c
    b .L_35c
    b .L_35c
    b .L_2d4
    b .L_35c
    b .L_2f4
    b .L_35c
    b .L_2e4
    b .L_35c
    b .L_310
    b .L_35c
    b .L_320
    b .L_35c
    b .L_330
    b .L_35c
    b .L_340
    b .L_35c
    b .L_350
.L_118:
    bl func_02000e70
    mov r1, r4
    ldr r0, _LIT0
    ldr r3, [r1, #0x38]
    ldr r2, _LIT2
    str r3, [r0, #0x4]
    mov r3, r3, asr #0x1f
    str r3, [r0, #0x8]
    str r2, [r0, #0xc]
    ldr r3, _LIT3
    ldr r2, _LIT4
    str r3, [r0, #0x10]
    str r2, [r0, #0x14]
    mov r2, #0x0
    str r2, [r0, #0x18]
    str r2, [r1, #0x3c]
    str r2, [r1, #0x40]
    str r2, [r1, #0x44]
    str r2, [r1, #0x48]
    b .L_35c
.L_168:
    bl func_0200127c
    b .L_35c
.L_170:
    bl func_0200127c
    cmp r0, #0x0
    beq .L_35c
    bl func_02000f84
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_188:
    bl func_02001448
    cmp r0, #0x0
    beq .L_35c
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_1a4:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_1b4:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_1c4:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_1d4:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_1e4:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_1f4:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_204:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_214:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_224:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_234:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_244:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_254:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_264:
    mov r0, #0x21
    bl func_0200973c
    mov r0, #0x1
    bl func_02018b3c
    mov r0, #0x7
    bl func_0200a250
    mov r0, #0xa
    bl func_0200a250
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    mov r0, #0x0
    mov r1, #0xd8000
    mov r2, #0xe4000
    bl func_02018e54
    mov r0, #0x2
    bl func_0201912c
    bl func_02000cc4
    mov r0, #0x25
    str r0, [r4, #0xb64]
    b .L_35c
.L_2c4:
    bl func_02000e34
    b .L_35c
.L_2cc:
    bl func_02000e34
    b .L_35c
.L_2d4:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_2e4:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_2f4:
    mov r0, r4
    ldr r0, [r0, #0x3c]
    bl func_0201a2f8
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_310:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_320:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_330:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_340:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_35c
.L_350:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
.L_35c:
    bl func_02000f84
.L_360:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_368:
    ldr r0, [r4, #0xb64]
    bl func_02000c4c
    ldr r1, _LIT0
    str r0, [r1]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02102b80
_LIT1: .word data_02103fcc
_LIT2: .word 0x6c078965
_LIT3: .word 0x5d588b65
_LIT4: .word 0x00269ec3
