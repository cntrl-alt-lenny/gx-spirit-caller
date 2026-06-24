; func_0200127c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern func_02000cc4
        .extern func_02000d4c
        .extern func_02000fc8
        .global func_0200127c
        .arm
func_0200127c:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    bl func_02000fc8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    mov r0, r4
    ldr r1, [r0, #0x3c]
    cmp r1, #0x15
    bgt .L_54
    bge .L_180
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_1b8
    b .L_1b8
    b .L_60
    b .L_70
    b .L_d4
    b .L_1c0
    b .L_e4
    b .L_11c
.L_54:
    cmp r1, #0x17
    beq .L_19c
    b .L_1b8
.L_60:
    bl func_02000cc4
    mov r0, #0x3
    str r0, [r4, #0xb64]
    b .L_1c0
.L_70:
    ldr r0, [r0, #0x40]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_1c0
    b .L_1c0
    b .L_94
    b .L_a4
    b .L_b4
    b .L_c4
.L_94:
    bl func_02000cc4
    mov r0, #0x9
    str r0, [r4, #0xb64]
    b .L_1c0
.L_a4:
    bl func_02000cc4
    mov r0, #0xf
    str r0, [r4, #0xb64]
    b .L_1c0
.L_b4:
    bl func_02000cc4
    mov r0, #0x13
    str r0, [r4, #0xb64]
    b .L_1c0
.L_c4:
    bl func_02000cc4
    mov r0, #0x11
    str r0, [r4, #0xb64]
    b .L_1c0
.L_d4:
    bl func_02000cc4
    mov r0, #0x2f
    str r0, [r4, #0xb64]
    b .L_1c0
.L_e4:
    ldr r0, [r0, #0x40]
    cmp r0, #0x1
    beq .L_fc
    cmp r0, #0x2
    beq .L_10c
    b .L_1c0
.L_fc:
    bl func_02000cc4
    mov r0, #0x31
    str r0, [r4, #0xb64]
    b .L_1c0
.L_10c:
    bl func_02000cc4
    mov r0, #0x1d
    str r0, [r4, #0xb64]
    b .L_1c0
.L_11c:
    ldr r0, [r0, #0x40]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_1c0
    b .L_1c0
    b .L_140
    b .L_150
    b .L_160
    b .L_170
.L_140:
    bl func_02000cc4
    mov r0, #0x15
    str r0, [r4, #0xb64]
    b .L_1c0
.L_150:
    bl func_02000cc4
    mov r0, #0x35
    str r0, [r4, #0xb64]
    b .L_1c0
.L_160:
    bl func_02000cc4
    mov r0, #0x2d
    str r0, [r4, #0xb64]
    b .L_1c0
.L_170:
    bl func_02000cc4
    mov r0, #0x37
    str r0, [r4, #0xb64]
    b .L_1c0
.L_180:
    bl func_02000cc4
    mov r1, #0x7
    str r1, [r4, #0xb64]
    mov r0, r4
    mov r1, #0x0
    str r1, [r0, #0x3c]
    b .L_1c0
.L_19c:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x3c]
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_1c0
.L_1b8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_1c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02103fcc
