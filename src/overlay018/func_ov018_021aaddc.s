; func_ov018_021aaddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov018_021ad2e4
        .extern data_ov018_021ad2f0
        .extern data_ov018_021ad2fc
        .extern data_ov018_021ad308
        .extern data_ov018_021ad8a8
        .extern func_0200612c
        .extern func_02006164
        .extern func_02037208
        .global func_ov018_021aaddc
        .arm
func_ov018_021aaddc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    ldr r4, _LIT0
    bl func_02006164
    cmp r0, #0x0
    addeq sp, sp, #0x18
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_0200612c
    add r0, r4, #0x900
    ldrh r0, [r0, #0xb4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_148
    ldr r1, [r4, #0x4]
    add r0, sp, #0x8
    cmp r1, #0x0
    bne .L_70
    ldr r1, _LIT1
    mov r2, #0x4e
    ldr r1, [r1, #0x4]
    mov r3, r1, lsl #0x1d
    ldr r1, _LIT2
    mov r3, r3, lsr #0x1c
    ldrh r3, [r1, r3]
    add r1, r2, #0x14
    b .L_90
.L_70:
    ldr r1, _LIT1
    mov r2, #0x50
    ldr r1, [r1, #0x4]
    mov r3, r1, lsl #0x1d
    ldr r1, _LIT3
    mov r3, r3, lsr #0x1c
    ldrh r3, [r1, r3]
    add r1, r2, #0x11
.L_90:
    strh r2, [r0, #0x2]
    mov r2, r3, asr #0x1
    rsb r2, r2, #0x80
    strh r2, [r0]
    ldrsh r2, [r0]
    strh r1, [r0, #0x6]
    add r1, r2, r3
    strh r1, [r0, #0x4]
    ldr r1, [r4, #0x4]
    add r0, sp, #0x10
    cmp r1, #0x1
    bne .L_104
    ldr r1, _LIT1
    mov r2, #0x7e
    ldr r1, [r1, #0x4]
    strh r2, [r0, #0x2]
    mov r3, r1, lsl #0x1d
    ldr r1, _LIT4
    mov r3, r3, lsr #0x1c
    ldrh r3, [r1, r3]
    add r1, r2, #0x14
    strh r1, [r0, #0x6]
    mov r2, r3, asr #0x1
    rsb r2, r2, #0x80
    strh r2, [r0]
    ldrsh r2, [r0]
    add r1, r2, r3
    strh r1, [r0, #0x4]
    b .L_1a8
.L_104:
    ldr r1, _LIT1
    mov r2, #0x80
    ldr r1, [r1, #0x4]
    strh r2, [r0, #0x2]
    mov r3, r1, lsl #0x1d
    ldr r1, _LIT5
    mov r3, r3, lsr #0x1c
    ldrh r3, [r1, r3]
    add r1, r2, #0x11
    strh r1, [r0, #0x6]
    mov r2, r3, asr #0x1
    rsb r2, r2, #0x80
    strh r2, [r0]
    ldrsh r2, [r0]
    add r1, r2, r3
    strh r1, [r0, #0x4]
    b .L_1a8
.L_148:
    ldr r0, _LIT1
    mov r1, #0x1
    ldr r2, [r0, #0x4]
    sub r0, r1, #0x2
    mov r3, r2, lsl #0x1d
    ldr r2, _LIT4
    mov r3, r3, lsr #0x1c
    ldrh lr, [r2, r3]
    add ip, sp, #0x10
    mov r5, #0x4e
    mov r2, lr, asr #0x1
    rsb r2, r2, #0x80
    strh r2, [ip]
    ldrsh r3, [ip]
    add r2, r5, #0x14
    strh r5, [ip, #0x2]
    add r3, r3, lr
    strh r3, [ip, #0x4]
    strh r2, [ip, #0x6]
    str r1, [r4, #0x4]
    strh r0, [sp, #0x8]
    strh r0, [sp, #0xa]
    strh r0, [sp, #0xc]
    strh r0, [sp, #0xe]
.L_1a8:
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    add r3, sp, #0x8
    mov r5, #0x0
.L_1b8:
    ldrsh r0, [r3]
    cmp r1, r0
    blt .L_248
    ldrsh r0, [r3, #0x4]
    cmp r1, r0
    bgt .L_248
    ldrsh r0, [r3, #0x2]
    cmp r2, r0
    blt .L_248
    ldrsh r0, [r3, #0x6]
    cmp r2, r0
    bgt .L_248
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    cmp r0, r5
    mov r3, #0x1
    bne .L_228
    mov r0, #0x97
    sub r1, r0, #0x98
    bl func_02037208
    add r0, r4, #0x900
    mov r1, #0x0
    ldrh r2, [r0, #0xb4]
    str r1, [r4, #0x984]
    add sp, sp, #0x18
    orr r1, r2, #0x2
    strh r1, [r0, #0xb4]
    ldmia sp!, {r3, r4, r5, pc}
.L_228:
    mov r0, #0x38
    sub r1, r0, #0x39
    bl func_02037208
    mov r0, #0x0
    add sp, sp, #0x18
    str r5, [r4, #0x4]
    str r0, [r4, #0x984]
    ldmia sp!, {r3, r4, r5, pc}
.L_248:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r3, r3, #0x8
    blt .L_1b8
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov018_021ad8a8
_LIT1: .word data_02104f4c
_LIT2: .word data_ov018_021ad308
_LIT3: .word data_ov018_021ad2fc
_LIT4: .word data_ov018_021ad2f0
_LIT5: .word data_ov018_021ad2e4
