; func_ov011_021d191c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3394
        .extern data_ov011_021d3594
        .extern data_ov011_021d35ac
        .extern data_ov011_021d403c
        .extern func_ov011_021ca400
        .extern func_ov011_021cb218
        .extern func_ov011_021cbc08
        .extern func_ov011_021cbc1c
        .extern func_ov011_021ccfcc
        .extern func_ov011_021cd940
        .extern func_ov011_021ceffc
        .extern func_ov011_021d0e88
        .extern func_ov011_021d1080
        .extern func_ov011_021d18b4
        .global func_ov011_021d191c
        .arm
func_ov011_021d191c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    cmp r0, #0x7d
    ldr r5, _LIT0
    blt .L_138
    ldr r2, _LIT1
    sub r1, r0, #0x7d
    mov r0, #0x6
    mla r4, r1, r0, r2
    ldrsh r0, [r4, #0x2]
    ldrsh r1, [r4, #0x4]
    mov r0, r0, lsl #0xc
    mov r1, r1, lsl #0xc
    bl func_ov011_021cbc08
    ldr r0, [r5, #0x240]
    ldr r1, [r5, #0x280]
    bic r0, r0, #0x7
    orr r3, r1, #0x200
    ldr r7, [r5, #0x268]
    orr r2, r0, #0x3
    ldrsb r6, [r4, #0x1]
    bic r1, r7, #0x1e000
    str r3, [r5, #0x280]
    mov r0, r6, lsl #0x1c
    orr r6, r1, r0, lsr #0xf
    ldrsh r0, [r4, #0x2]
    ldrsh r1, [r4, #0x4]
    str r6, [r5, #0x268]
    str r2, [r5, #0x240]
    bl func_ov011_021ca400
    ldr r2, [r5, #0x268]
    ldr r1, [r5, #0x280]
    bic r2, r2, #0x1e000
    mov r0, r0, lsl #0x1c
    orr r2, r2, r0, lsr #0xf
    bic r0, r1, #0x100
    str r2, [r5, #0x268]
    str r0, [r5, #0x280]
    bl func_ov011_021cbc1c
    bl func_ov011_021cb218
    ldrsh r2, [r4, #0x2]
    ldrsh r1, [r4, #0x4]
    add r0, sp, #0x8
    mov r2, r2, lsl #0xc
    mov r1, r1, lsl #0xc
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    bl func_ov011_021cd940
    bl func_ov011_021ceffc
    bl func_ov011_021ccfcc
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_138:
    cmp r0, #0x66
    blt .L_1e4
    sub r0, r0, #0x65
    sub ip, r0, #0x1
    ldr r4, _LIT2
    ldr r1, [r5, #0x258]
    add r6, r4, ip, lsl #0x1
    ldrsb r2, [r6, #0x1]
    bic r3, r1, #0x3fc00
    add r1, sp, #0x4
    add r2, r2, #0xf
    mov r2, r2, lsl #0x18
    orr r3, r3, r2, lsr #0xe
    add r2, sp, #0x0
    str r3, [r5, #0x258]
    mov r7, ip, lsl #0x1
    bl func_ov011_021d18b4
    ldr r0, [sp, #0x4]
    ldr r1, [sp]
    bl func_ov011_021cbc08
    ldr r0, [sp, #0x4]
    ldr r1, [sp]
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    bl func_ov011_021ca400
    ldrsb r2, [r6, #0x1]
    ldrsb r1, [r4, r7]
    ldr r3, _LIT3
    sub r2, r2, #0x1
    sub r4, r1, #0x1
    mov r1, #0x72
    mla r1, r4, r1, r3
    ldr ip, [r5, #0x270]
    ldrb r1, [r2, r1]
    ldr r6, [r5, #0x268]
    bic r2, ip, #0xff
    and r0, r0, #0xff
    orr r3, r2, r0
    bic r2, r6, #0x1e000
    mov r0, r1, lsl #0x1c
    orr r0, r2, r0, lsr #0xf
    str r3, [r5, #0x270]
    b .L_240
.L_1e4:
    bl func_ov011_021d0e88
    ldr r1, [r5, #0x258]
    mov r0, r0, lsl #0x18
    bic r1, r1, #0x3fc00
    orr r3, r1, r0, lsr #0xe
    mov r0, r3, lsl #0xe
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsr #0x18
    str r3, [r5, #0x258]
    bl func_ov011_021d1080
    ldr r0, [sp, #0x4]
    ldr r1, [sp]
    bl func_ov011_021cbc08
    ldr r0, [sp, #0x4]
    ldr r1, [sp]
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    bl func_ov011_021ca400
    ldr r1, [r5, #0x268]
    mov r0, r0, lsl #0x1c
    bic r1, r1, #0x1e000
    orr r0, r1, r0, lsr #0xf
.L_240:
    str r0, [r5, #0x268]
    ldr r1, [r5, #0x280]
    ldr r0, [r5, #0x240]
    orr r1, r1, #0x200
    bic r0, r0, #0x7
    orr r0, r0, #0x3
    str r1, [r5, #0x280]
    str r0, [r5, #0x240]
    bl func_ov011_021cbc1c
    ldr r0, [r5, #0x280]
    bic r0, r0, #0x100
    str r0, [r5, #0x280]
    bl func_ov011_021cb218
    bl func_ov011_021ceffc
    bl func_ov011_021ccfcc
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov011_021d403c
_LIT1: .word data_ov011_021d3594
_LIT2: .word data_ov011_021d35ac
_LIT3: .word data_ov011_021d3394
