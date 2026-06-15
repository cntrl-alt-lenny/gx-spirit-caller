; func_020754f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eee0
        .extern data_0219ef0c
        .extern data_021a0704
        .extern func_020705d4
        .extern func_020757e0
        .extern func_02075d44
        .extern func_02077b5c
        .extern func_02094688
        .global func_020754f4
        .arm
func_020754f4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    ldr r7, [r9, #0xc]
    ldr r4, [r7, #0x820]
    cmp r4, #0x0
    ldrne r8, [r4]
    moveq r8, #0x0
    bl func_02077b5c
    mov r1, r0, lsr #0x18
    strb r1, [r7, #0x54]
    mov r1, r0, lsr #0x10
    strb r1, [r7, #0x55]
    mov r1, r0, lsr #0x8
    strb r1, [r7, #0x56]
    strb r0, [r7, #0x57]
    add r0, r7, #0x58
    mov r1, #0x1c
    bl func_020757e0
    ldr r1, _LIT0
    add r0, r8, #0x9d
    ldr r1, [r1]
    blx r1
    movs r6, r0
    moveq r0, #0x9
    streqb r0, [r7, #0x455]
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    mov r0, #0x2
    add r5, r6, #0x5
    strb r0, [r6, #0x5]
    mov r3, #0x0
    strb r3, [r5, #0x1]
    strb r3, [r5, #0x2]
    mov r0, #0x46
    strb r0, [r5, #0x3]
    mov r0, #0x3
    strb r0, [r5, #0x4]
    add r0, r7, #0x54
    add r1, r5, #0x6
    mov r2, #0x20
    strb r3, [r5, #0x5]
    bl func_02094688
    mov r2, #0x20
    strb r2, [r5, #0x26]
    ldrb r0, [r7, #0x30]
    cmp r0, #0x0
    beq .L_780
    add r0, r7, #0x74
    add r1, r5, #0x27
    bl func_02094688
    mov r0, #0x1
    strb r0, [r7, #0x31]
    add r5, r5, #0x47
    b .L_7e0
.L_780:
    add r0, r5, #0x27
    mov r1, #0x1c
    bl func_020757e0
    ldr r0, _LIT1
    add r2, r5, #0x46
    ldr r3, [r0]
    add r1, r7, #0x74
    mov r0, r3, lsr #0x18
    strb r0, [r5, #0x43]
    mov r0, r3, lsr #0x10
    strb r0, [r5, #0x44]
    mov r0, r3, lsr #0x8
    strb r0, [r5, #0x45]
    add r5, r5, #0x47
    sub r0, r5, #0x20
    strb r3, [r2]
    mov r2, #0x20
    bl func_02094688
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r2, [r0]
    add r2, r2, #0x1
    str r2, [r0]
    strb r1, [r7, #0x31]
.L_7e0:
    ldrh r2, [r7, #0x32]
    mov r0, #0x0
    mov r2, r2, asr #0x8
    strb r2, [r5]
    ldrh r2, [r7, #0x32]
    strb r2, [r5, #0x1]
    strb r0, [r5, #0x2]
    ldrb r0, [r7, #0x31]
    add r5, r5, #0x3
    cmp r0, #0x0
    bne .L_894
    cmp r8, #0x0
    beq .L_878
    mov r0, #0xb
    add r2, r8, #0x6
    strb r0, [r5]
    mov r0, r2, asr #0x10
    strb r0, [r5, #0x1]
    mov r0, r2, asr #0x8
    strb r0, [r5, #0x2]
    add r1, r8, #0x3
    strb r2, [r5, #0x3]
    mov r0, r1, asr #0x10
    strb r0, [r5, #0x4]
    mov r0, r1, asr #0x8
    strb r0, [r5, #0x5]
    strb r1, [r5, #0x6]
    mov r0, r8, asr #0x10
    strb r0, [r5, #0x7]
    mov r0, r8, asr #0x8
    strb r0, [r5, #0x8]
    strb r8, [r5, #0x9]
    add r5, r5, #0xa
    ldr r0, [r4, #0x4]
    mov r1, r5
    mov r2, r8
    bl func_02094688
    add r5, r5, r8
.L_878:
    mov r0, #0xe
    strb r0, [r5]
    mov r1, #0x0
    strb r1, [r5, #0x1]
    strb r1, [r5, #0x2]
    strb r1, [r5, #0x3]
    add r5, r5, #0x4
.L_894:
    mov r0, #0x16
    sub r1, r5, r6
    sub r4, r1, #0x5
    strb r0, [r6]
    mov r0, #0x3
    strb r0, [r6, #0x1]
    mov r0, #0x0
    strb r0, [r6, #0x2]
    mov r0, r4, asr #0x8
    strb r0, [r6, #0x3]
    mov r0, r7
    mov r2, r4
    add r1, r6, #0x5
    strb r4, [r6, #0x4]
    bl func_02075d44
    mov r2, #0x0
    mov r0, r6
    mov r3, r2
    add r1, r4, #0x5
    str r9, [sp]
    bl func_020705d4
    ldr r1, _LIT2
    mov r0, r6
    ldr r1, [r1]
    blx r1
    ldrb r0, [r7, #0x31]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_0219eee0
_LIT1: .word data_021a0704
_LIT2: .word data_0219ef0c
