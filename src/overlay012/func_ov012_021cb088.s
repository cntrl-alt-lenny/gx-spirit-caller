; func_ov012_021cb088 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov012_021cc108
        .extern data_ov012_021cc6a0
        .extern data_ov012_021cc6dc
        .extern func_02006110
        .extern func_0200617c
        .extern func_02037208
        .extern func_ov012_021ca36c
        .extern func_ov012_021caf44
        .global func_ov012_021cb088
        .arm
func_ov012_021cb088:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    ldr r4, _LIT0
    ldr ip, _LIT1
    add r3, sp, #0x8
    mov r2, #0xc
.L_18:
    ldrb r1, [ip]
    ldrb r0, [ip, #0x1]
    add ip, ip, #0x2
    strb r1, [r3]
    strb r0, [r3, #0x1]
    add r3, r3, #0x2
    subs r2, r2, #0x1
    bne .L_18
    bl func_0200617c
    cmp r0, #0x0
    beq .L_118
    bl func_ov012_021caf44
    cmp r0, #0x0
    bne .L_118
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r3, [sp, #0x4]
    ldr r0, [r4, #0x148]
    ldr r2, [sp]
    ldr r1, [r4, #0x14c]
    add r0, r3, r0, asr #0xc
    add r1, r2, r1, asr #0xc
    str r0, [sp, #0x4]
    str r1, [sp]
    bl func_ov012_021ca36c
    ldr r1, [r4, #0x160]
    mov r1, r1, lsl #0x1c
    movs r1, r1, lsr #0x1c
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, pc}
    cmp r1, r0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x168]
    ldr r2, [r4, #0x164]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r2, r2, #0xff
    orr r2, r2, #0x1
    str r2, [r4, #0x164]
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r1, r1, r0, lsr #0x8
    ldr r0, _LIT2
    str r1, [r4, #0x168]
    ldr r0, [r0, #0x19c]
    mov r2, #0x0
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    mov r3, #0x1
    bne .L_104
    mov r0, #0x53
    sub r1, r0, #0x54
    bl func_02037208
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_104:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_118:
    ldr r0, _LIT3
    ldrh r3, [r0, #0x54]
    tst r3, #0xf0
    beq .L_1f0
    ldr r1, [r4, #0x160]
    mov r0, r1, lsl #0x1c
    movs r2, r0, lsr #0x1c
    bne .L_148
    bic r0, r1, #0xf
    orr r0, r0, #0x1
    str r0, [r4, #0x160]
    b .L_1d4
.L_148:
    tst r3, #0x40
    beq .L_16c
    add r0, sp, #0x4
    ldrb r0, [r0, r2, lsl #0x2]
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    str r0, [r4, #0x160]
    b .L_1d4
.L_16c:
    tst r3, #0x80
    beq .L_190
    add r0, sp, #0x5
    ldrb r0, [r0, r2, lsl #0x2]
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    str r0, [r4, #0x160]
    b .L_1d4
.L_190:
    tst r3, #0x10
    beq .L_1b4
    add r0, sp, #0x6
    ldrb r0, [r0, r2, lsl #0x2]
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    str r0, [r4, #0x160]
    b .L_1d4
.L_1b4:
    tst r3, #0x20
    beq .L_1d4
    add r0, sp, #0x7
    ldrb r0, [r0, r2, lsl #0x2]
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    str r0, [r4, #0x160]
.L_1d4:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_1f0:
    tst r3, #0x1
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1c
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, pc}
    ldr r1, [r4, #0x168]
    ldr r2, [r4, #0x164]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r2, r2, #0xff
    orr r2, r2, #0x1
    str r2, [r4, #0x164]
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r1, r1, r0, lsr #0x8
    ldr r0, _LIT2
    str r1, [r4, #0x168]
    ldr r0, [r0, #0x19c]
    mov r2, #0x0
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    mov r3, #0x1
    bne .L_274
    mov r0, #0x53
    sub r1, r0, #0x54
    bl func_02037208
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_274:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov012_021cc6dc
_LIT1: .word data_ov012_021cc108
_LIT2: .word data_ov012_021cc6a0
_LIT3: .word data_02104bac
