; func_ov000_021adc64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov000_021c74e4
        .extern func_02001cb0
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001d64
        .extern func_02001da4
        .extern func_02001dbc
        .extern func_02001e74
        .extern func_0200527c
        .extern func_02005358
        .extern func_0201d460
        .extern func_0201d4dc
        .extern func_ov000_021adafc
        .extern func_ov000_021adc44
        .global func_ov000_021adc64
        .arm
func_ov000_021adc64:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    movs r9, r0
    mov r8, r1
    ldr r5, _LIT0
    beq .L_18c
    ldr r6, [r5, #0x264]
    mov r0, #0x8
    cmp r6, #0x0
    moveq r6, #0x4a0
    cmp r8, #0x0
    movne r7, #0x5
    str r9, [r5, #0x250]
    moveq r7, #0x0
    bl func_0201d4dc
    mov r4, r0
    add r0, r5, #0x1ac
    mov r1, #0x1c
    mov r2, #0x6
    bl func_02001cec
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    add r0, r5, #0x1ac
    mov r1, #0x0
    mov r2, #0xe
    bl func_02001d64
    mov r1, r7
    add r0, r5, #0x1ac
    bl func_02001da4
    bl func_ov000_021adafc
    ldr r0, [r5, #0x26c]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1e
    beq .L_a0
    cmp r0, #0x1
    beq .L_100
    b .L_16c
.L_a0:
    add r0, r5, #0x1ac
    mov r1, #0xf
    mov r2, #0x5
    bl func_02001cb0
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r7, _LIT2
    mov r1, r9
    add r0, r5, #0x1ac
    add r2, r6, r4
    mov r3, #0x5
    str r7, [sp, #0x8]
    bl func_02001dbc
    mov r0, #0x8
    bl func_0201d460
    add r0, r0, #0x82
    add r1, r0, #0x400
    mov r2, r6, asr #0x5
    add r0, r5, #0x1ac
    mov r3, #0x0
    bl func_02001e74
    b .L_16c
.L_100:
    add r0, r5, #0x1ac
    mov r1, #0xf
    mov r2, #0x5
    bl func_02001cb0
    mov r0, r9
    mov r1, #0xc
    mov r2, #0xe0
    bl func_ov000_021adc44
    mov r1, #0x3
    str r1, [sp]
    mov r1, #0xc
    str r1, [sp, #0x4]
    ldr r2, _LIT3
    mov r3, r0
    str r2, [sp, #0x8]
    mov r1, r9
    add r2, r6, r4
    add r0, r5, #0x1ac
    bl func_02001dbc
    mov r0, #0x8
    bl func_0201d460
    add r0, r0, #0x184
    add r1, r0, #0x400
    mov r2, r6, asr #0x5
    add r0, r5, #0x1ac
    mov r3, #0x0
    bl func_02001e74
.L_16c:
    ldr r0, [r5, #0x270]
    cmp r8, #0x0
    orrne r0, r0, #0x800
    strne r0, [r5, #0x270]
    biceq r0, r0, #0x800
    add sp, sp, #0xc
    streq r0, [r5, #0x270]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_18c:
    bl func_ov000_021adafc
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov000_021c74e4
_LIT1: .word data_02104e6c
_LIT2: .word func_0200527c
_LIT3: .word func_02005358
