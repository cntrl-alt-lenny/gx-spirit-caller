; func_ov021_021ab6c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021660
        .extern func_020216b0
        .extern func_020216bc
        .extern func_02037208
        .extern func_ov021_021ab150
        .extern func_ov021_021abcac
        .extern func_ov021_021abd78
        .global func_ov021_021ab6c0
        .arm
func_ov021_021ab6c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r1, [sl, #0x40]
    cmp r1, #0xf
    bne .L_59c
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_86c
.L_59c:
    cmp r1, #0x1e
    bne .L_630
    ldr r0, [sl, #0x48]
    ldr r1, [sl, #0x44]
    add r0, r0, r0, lsl #0x2
    add r2, r1, r0
    add r1, sl, r2, lsl #0x2
    mov r0, #0x1
    str r0, [r1, #0x9c]
    ldr r1, [sl, #0x18c]
    add r1, sl, r1, lsl #0x2
    str r2, [r1, #0x184]
    ldr r1, [sl, #0x18c]
    add r1, r1, #0x1
    str r1, [sl, #0x18c]
    cmp r1, #0x2
    bge .L_608
    ldr r0, [sl]
    mov r1, #0x3
    mov r2, #0x2
    bl func_02021660
    mov r1, #0xb
    mov r2, #0x1f
    bl func_020216b0
    mov r0, #0x1
    str r0, [sl, #0x3c]
    b .L_86c
.L_608:
    ldr r2, [sl, #0x184]
    ldr r1, [sl, #0x188]
    add r2, sl, r2, lsl #0x2
    add r1, sl, r1, lsl #0x2
    ldr r2, [r2, #0x74]
    ldr r1, [r1, #0x74]
    cmp r2, r1
    movne r0, #0x0
    str r0, [sl, #0x194]
    b .L_86c
.L_630:
    cmp r1, #0x2d
    bne .L_728
    ldr r0, [sl, #0x194]
    cmp r0, #0x0
    beq .L_728
    ldr r6, _LIT0
    mov r9, #0x0
    mvn r7, #0x37
    mov fp, #0x3
    mov r4, #0x5
    mov r5, #0x48
.L_65c:
    ldr r0, [sl]
    mov r1, fp
    add r2, r9, #0x3
    bl func_02021660
    add r2, sl, r9, lsl #0x2
    ldr r2, [r2, #0x184]
    mov r1, #0x3
    smull ip, r3, r6, r2
    mov ip, r2, lsr #0x1f
    add r3, ip, r3, asr #0x1
    smull r3, ip, r4, r3
    sub r3, r2, r3
    sub r3, r3, #0x2
    mul r2, r3, r5
    mov r8, r0
    bl func_020216b0
    add r0, sl, r9, lsl #0x2
    ldr r1, [r0, #0x184]
    smull r0, r2, r6, r1
    mov r0, r1, lsr #0x1f
    adds r2, r0, r2, asr #0x1
    moveq r2, #0x38
    movne r2, r7
    mov r0, r8
    mov r1, #0x4
    bl func_020216b0
    mov r0, r8
    mov r1, #0x5
    mov r2, #0x2
    bl func_020216b0
    mov r0, r8
    mov r1, #0x0
    mov r2, #0x1
    bl func_020216b0
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_65c
    ldr r1, [sl, #0x4c]
    mov r0, #0x4a
    add r1, r1, #0x1
    str r1, [sl, #0x4c]
    ldr r2, [sl, #0x190]
    sub r1, r0, #0x4b
    add r4, r2, #0x1
    mov r2, #0x0
    mov r3, #0x1
    str r4, [sl, #0x190]
    bl func_02037208
    mov r0, sl
    bl func_ov021_021abd78
    b .L_86c
.L_728:
    cmp r1, #0x3c
    ldreq r0, [sl, #0x194]
    cmpeq r0, #0x0
    bne .L_790
    mov r5, #0x0
    mov r4, #0x3
    mov r7, r5
    mov r6, r5
.L_748:
    add r0, sl, r5, lsl #0x2
    ldr r2, [r0, #0x184]
    ldr r0, [sl]
    mov r1, r4
    add r2, r2, #0x5
    bl func_02021660
    mov r1, r7
    mov r8, r0
    bl func_020216bc
    bic r2, r0, #0x2
    mov r0, r8
    mov r1, r6
    orr r2, r2, #0x80
    bl func_020216b0
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_748
    b .L_86c
.L_790:
    cmp r1, #0x5a
    bne .L_854
    ldr r0, [sl, #0x190]
    cmp r0, #0x5
    blt .L_7f0
    mov r8, #0x0
    mov r7, #0x3
    mov r5, r8
    mov r4, r8
.L_7b4:
    ldr r0, [sl]
    mov r1, r7
    add r2, r8, #0x5
    bl func_02021660
    mov r6, r0
    mov r1, r5
    bl func_020216bc
    orr r2, r0, #0x8
    mov r0, r6
    mov r1, r4
    bl func_020216b0
    add r8, r8, #0x1
    cmp r8, #0xa
    blt .L_7b4
    b .L_86c
.L_7f0:
    ldr r1, [sl, #0x184]
    ldr r0, [sl, #0x188]
    add r2, sl, r1, lsl #0x2
    add r0, sl, r0, lsl #0x2
    ldr r1, [r2, #0x74]
    ldr r0, [r0, #0x74]
    cmp r1, r0
    beq .L_824
    mov r1, #0x0
    str r1, [r2, #0x9c]
    ldr r0, [sl, #0x188]
    add r0, sl, r0, lsl #0x2
    str r1, [r0, #0x9c]
.L_824:
    ldr r0, [sl]
    mov r1, #0x3
    mov r2, #0x2
    bl func_02021660
    mov r1, #0xb
    mov r2, #0x1f
    bl func_020216b0
    mov r0, #0x0
    str r0, [sl, #0x18c]
    mov r0, #0x1
    str r0, [sl, #0x3c]
    b .L_86c
.L_854:
    cmp r1, #0xa5
    bne .L_86c
    mov r0, sl
    bl func_ov021_021ab150
    mov r0, #0x1
    str r0, [sl, #0x3c]
.L_86c:
    mov r0, sl
    bl func_ov021_021abcac
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x66666667
