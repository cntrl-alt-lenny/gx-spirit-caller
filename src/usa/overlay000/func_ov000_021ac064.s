; func_ov000_021ac064 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020060f4
        .extern func_02006148
        .extern func_02006160
        .extern func_02006178
        .extern func_ov000_021abd84
        .extern func_ov000_021abde8
        .extern func_ov000_021abe98
        .extern func_ov000_021abedc
        .extern func_ov000_021abf0c
        .extern func_ov000_021abf70
        .extern func_ov000_021abfb8
        .global func_ov000_021ac064
        .arm
func_ov000_021ac064:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r1, [r6]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0xc]
    bic r1, r1, #0x3c000000
    orr r1, r1, #0x3c000000
    str r1, [r6, #0xc]
    bl func_ov000_021abd84
    ldr r2, [r6, #0xc]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x17
    and r1, r2, r1
    orr r0, r1, r0, lsr #0x6
    str r0, [r6, #0xc]
    bl func_02006178
    cmp r0, #0x0
    bne .L_68
    bl func_02006160
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
.L_68:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    mov r0, r6
    bl func_ov000_021abfb8
    ldr r1, [r6]
    mov r5, r0
    mov r0, r1, lsl #0x1a
    movs r0, r0, lsr #0x1c
    beq .L_a8
    cmp r0, #0x1
    beq .L_234
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_a8:
    mov r0, r6
    bl func_ov000_021abd84
    mov r4, r0
    bl func_02006148
    cmp r0, #0x0
    beq .L_138
    ldr r1, [r6, #0xc]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0x3c000000
    orr r0, r1, r0, lsr #0x2
    str r0, [r6, #0xc]
    mov r0, r0, lsl #0x2
    ldr r1, [r6, #0x10]
    mov r0, r0, asr #0x1c
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    bic r0, r0, #0x1f0
    str r0, [r6, #0x10]
    ldr r0, [r6, #0xc]
    mov r0, r0, lsl #0x2
    mov r0, r0, asr #0x1c
    cmp r0, #0x3
    bne .L_138
    ldr r1, [r6]
    ldr r0, _LIT1
    bic r1, r1, #0x3c
    orr r1, r1, #0x4
    str r1, [r6]
    ldr r1, [sp]
    ldr r2, [r6, #0xc]
    sub r1, r4, r1
    and r2, r2, r0
    mov r0, r1, lsl #0x17
    orr r0, r2, r0, lsr #0xf
    str r0, [r6, #0xc]
.L_138:
    ldr r0, [r6, #0x10]
    mov r0, r0, lsl #0x1c
    cmp r5, r0, asr #0x1c
    bne .L_20c
    bl func_02006178
    cmp r0, #0x0
    beq .L_168
    ldr r1, [r6, #0xc]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0x3c000000
    orr r0, r1, r0, lsr #0x2
    str r0, [r6, #0xc]
.L_168:
    ldr r0, [r6, #0x10]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1b
    tst r0, #0xf
    bne .L_1d8
    ldr r0, [r6, #0xc]
    mov r0, r0, lsl #0x2
    mov r0, r0, asr #0x1c
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_1d8
    b .L_1d8
    b .L_1ac
    b .L_1b8
    b .L_1d8
    b .L_1c4
    b .L_1d0
.L_1ac:
    mov r0, r6
    bl func_ov000_021abedc
    b .L_1d8
.L_1b8:
    mov r0, r6
    bl func_ov000_021abf70
    b .L_1d8
.L_1c4:
    mov r0, r6
    bl func_ov000_021abf0c
    b .L_1d8
.L_1d0:
    mov r0, r6
    bl func_ov000_021abe98
.L_1d8:
    ldr r1, [r6, #0x10]
    mov r0, r1, lsl #0x17
    mov r0, r0, lsr #0x1b
    cmp r0, #0x10
    biccs r0, r1, #0x1f0
    orrcs r0, r0, #0xd0
    strcs r0, [r6, #0x10]
    bcs .L_20c
    add r0, r0, #0x1
    bic r1, r1, #0x1f0
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x17
    str r0, [r6, #0x10]
.L_20c:
    mov r0, r6
    bl func_ov000_021abd84
    ldr r2, [r6, #0xc]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x17
    and r1, r2, r1
    orr r0, r1, r0, lsr #0x6
    add sp, sp, #0x8
    str r0, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
.L_234:
    bl func_02006160
    cmp r0, #0x0
    beq .L_250
    ldr r0, [r6]
    bic r0, r0, #0x3c
    str r0, [r6]
    b .L_2e8
.L_250:
    ldmia r6, {r0, r5}
    mov r1, r0, lsl #0x8
    ldr r0, [r6, #0xc]
    mov ip, r5, lsl #0x10
    mov r2, r1, lsr #0x17
    add r1, r2, ip, lsr #0x18
    mov r4, r0, lsl #0xf
    ldr r3, [sp]
    sub r0, r1, r4, asr #0x17
    cmp r3, r0
    bcs .L_298
    ldr r2, [r6, #0xc]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x17
    and r0, r2, r0
    orr r0, r0, r1, lsr #0x6
    str r0, [r6, #0xc]
    b .L_2e8
.L_298:
    mov r0, r5, lsl #0x18
    add r0, r2, r0, lsr #0x18
    sub r1, r0, ip, lsr #0x18
    mov r0, r5, lsl #0x8
    sub r1, r1, r0, lsr #0x18
    sub r0, r1, r4, asr #0x17
    cmp r3, r0
    ldr r2, [r6, #0xc]
    ldr r0, _LIT0
    bls .L_2d4
    mov r1, r1, lsl #0x17
    and r0, r2, r0
    orr r0, r0, r1, lsr #0x6
    str r0, [r6, #0xc]
    b .L_2e8
.L_2d4:
    add r1, r3, r4, asr #0x17
    and r2, r2, r0
    mov r0, r1, lsl #0x17
    orr r0, r2, r0, lsr #0x6
    str r0, [r6, #0xc]
.L_2e8:
    mov r0, r6
    bl func_ov000_021abde8
    mov r1, r0, lsl #0x10
    mov r0, #0x10000
    mov r1, r1, lsr #0x10
    ldr r2, [r6, #0x8]
    rsb r0, r0, #0x0
    and r2, r2, r0
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    str r0, [r6, #0x8]
    ldr r0, [r6, #0xc]
    bic r0, r0, #0x3c000000
    orr r0, r0, #0xc000000
    str r0, [r6, #0xc]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0xfc01ffff
_LIT1: .word 0xfffe00ff
