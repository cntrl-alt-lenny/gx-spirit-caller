; func_ov012_021cafa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov012_021cc028
        .extern data_ov012_021cc5c0
        .extern data_ov012_021cc5fc
        .extern func_020060f4
        .extern func_02006160
        .extern func_020371b8
        .extern func_ov012_021ca28c
        .extern func_ov012_021cae64
        .global func_ov012_021cafa8
        .arm
func_ov012_021cafa8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    ldr r4, _LIT0
    ldr ip, _LIT1
    add r3, sp, #0x8
    mov r2, #0xc
.L_120:
    ldrb r1, [ip]
    ldrb r0, [ip, #0x1]
    add ip, ip, #0x2
    strb r1, [r3]
    strb r0, [r3, #0x1]
    add r3, r3, #0x2
    subs r2, r2, #0x1
    bne .L_120
    bl func_02006160
    cmp r0, #0x0
    beq .L_220
    bl func_ov012_021cae64
    cmp r0, #0x0
    bne .L_220
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr r3, [sp, #0x4]
    ldr r0, [r4, #0x148]
    ldr r2, [sp]
    ldr r1, [r4, #0x14c]
    add r0, r3, r0, asr #0xc
    add r1, r2, r1, asr #0xc
    str r0, [sp, #0x4]
    str r1, [sp]
    bl func_ov012_021ca28c
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
    bne .L_20c
    mov r0, #0x53
    sub r1, r0, #0x54
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_20c:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_220:
    ldr r0, _LIT3
    ldrh r3, [r0, #0x54]
    tst r3, #0xf0
    beq .L_2f8
    ldr r1, [r4, #0x160]
    mov r0, r1, lsl #0x1c
    movs r2, r0, lsr #0x1c
    bne .L_250
    bic r0, r1, #0xf
    orr r0, r0, #0x1
    str r0, [r4, #0x160]
    b .L_2dc
.L_250:
    tst r3, #0x40
    beq .L_274
    add r0, sp, #0x4
    ldrb r0, [r0, r2, lsl #0x2]
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    str r0, [r4, #0x160]
    b .L_2dc
.L_274:
    tst r3, #0x80
    beq .L_298
    add r0, sp, #0x5
    ldrb r0, [r0, r2, lsl #0x2]
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    str r0, [r4, #0x160]
    b .L_2dc
.L_298:
    tst r3, #0x10
    beq .L_2bc
    add r0, sp, #0x6
    ldrb r0, [r0, r2, lsl #0x2]
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    str r0, [r4, #0x160]
    b .L_2dc
.L_2bc:
    tst r3, #0x20
    beq .L_2dc
    add r0, sp, #0x7
    ldrb r0, [r0, r2, lsl #0x2]
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    str r0, [r4, #0x160]
.L_2dc:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_2f8:
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
    bne .L_37c
    mov r0, #0x53
    sub r1, r0, #0x54
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_37c:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov012_021cc5fc
_LIT1: .word data_ov012_021cc028
_LIT2: .word data_ov012_021cc5c0
_LIT3: .word data_02104acc
