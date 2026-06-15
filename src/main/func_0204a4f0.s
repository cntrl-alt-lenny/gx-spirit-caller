; func_0204a4f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff980
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204a174
        .extern func_0204a2ec
        .extern func_0204a4ec
        .extern func_0204a9b0
        .extern func_0204aaf4
        .extern func_0204b1a4
        .extern func_0204ca70
        .extern func_0204ce3c
        .extern func_0204cf7c
        .extern func_0204d284
        .extern func_0204d438
        .extern func_0204ed50
        .extern func_0204f0a8
        .extern func_020689b8
        .extern func_020689dc
        .extern func_02068a20
        .extern func_02068cb8
        .extern func_02068cc8
        .extern func_02068d24
        .extern func_020930b0
        .global func_0204a4f0
        .arm
func_0204a4f0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    cmp r1, #0x0
    beq .L_28
    cmp r1, #0x4
    beq .L_38
    add sp, sp, #0x4
    cmp r1, #0x5
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_28:
    mov r0, r2
    bl func_0204a4ec
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_38:
    mov r5, #0x0
    bl func_02068cb8
    cmp r0, #0x0
    ble .L_88
.L_48:
    mov r0, r6
    mov r1, r5
    bl func_02068cc8
    mov r4, r0
    bl func_0204b1a4
    cmp r0, #0x0
    bne .L_74
    mov r0, r6
    mov r1, r4
    bl func_02068d24
    sub r5, r5, #0x1
.L_74:
    mov r0, r6
    add r5, r5, #0x1
    bl func_02068cb8
    cmp r5, r0
    blt .L_48
.L_88:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x2
    beq .L_b0
    cmp r0, #0x3
    beq .L_1a8
    cmp r0, #0x5
    beq .L_224
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_b0:
    mov r0, r6
    mov r5, #0x0
    bl func_02068cb8
    cmp r0, #0x0
    ble .L_140
.L_c4:
    mov r0, r6
    mov r1, r5
    bl func_02068cc8
    mov r4, r0
    bl func_020498f0
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_12c
    bl func_020498f0
    mov r7, r0
    mov r0, r4
    bl func_020689dc
    ldr r1, [r7, #0x1c]
    cmp r1, r0
    bne .L_12c
    bl func_020498f0
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    beq .L_12c
    bl func_020498f0
    mov r7, r0
    mov r0, r4
    bl func_020689b8
    ldrh r1, [r7, #0x1a]
    cmp r1, r0
    beq .L_140
.L_12c:
    mov r0, r6
    add r5, r5, #0x1
    bl func_02068cb8
    cmp r5, r0
    blt .L_c4
.L_140:
    mov r0, r6
    bl func_02068cb8
    cmp r5, r0
    bge .L_180
    mov r0, #0x3
    bl func_020498dc
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x204]
    bl func_020498f0
    ldr r0, [r0, #0x204]
    bl func_0204f0a8
    bl func_0204aaf4
    add sp, sp, #0x4
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_180:
    bl func_020498f0
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0xec]
    add sp, sp, #0x4
    str r1, [r4, #0xf0]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1a8:
    mov r0, #0x1
    bl func_0204a2ec
    bl func_0204a174
    mov r0, r6
    bl func_02068cb8
    cmp r0, #0x0
    beq .L_1fc
    mov r0, #0x0
    mov r1, r0
    bl func_0204d284
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x4
    bl func_020498dc
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0xe8]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1fc:
    bl func_020498f0
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0xec]
    add sp, sp, #0x4
    str r1, [r4, #0xf0]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_224:
    mov r0, r6
    bl func_02068cb8
    cmp r0, #0x0
    beq .L_29c
    mov r4, #0x0
.L_238:
    mov r0, r6
    mov r1, r4
    bl func_02068cc8
    mov r5, r0
    bl func_020689dc
    mov r7, r0
    bl func_020498f0
    ldr r0, [r0, #0x1b8]
    cmp r7, r0
    bne .L_280
    mov r0, r5
    bl func_020689b8
    mov r7, r0
    bl func_020498f0
    add r0, r0, #0x100
    ldrh r0, [r0, #0xb4]
    cmp r7, r0
    beq .L_29c
.L_280:
    mov r0, r6
    mov r1, r5
    bl func_02068d24
    mov r0, r6
    bl func_02068cb8
    cmp r0, #0x0
    bne .L_238
.L_29c:
    mov r0, r6
    bl func_02068cb8
    cmp r0, #0x0
    beq .L_3a0
    mov r0, r6
    mov r1, #0x0
    bl func_02068cc8
    ldr r1, _LIT0
    mov r2, #0x0
    bl func_02068a20
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_36c
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    cmp r4, r0
    bne .L_36c
    mov r0, #0x0
    bl func_0204a2ec
    cmp r0, #0x0
    beq .L_320
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_36c
    bl func_0204ca70
    bl func_0204d438
    cmp r0, #0x0
    beq .L_36c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_320:
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    bl func_0204ce3c
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x4
    bl func_020498dc
    bl func_020498f0
    mov r1, r0
    mov r0, #0x0
    ldr r2, [r1, #0xf4]
    mov r1, r0
    bl func_0204cf7c
    bl func_0204d438
    add sp, sp, #0x4
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_36c:
    mov r0, #0x6
    bl func_020498dc
    mov r0, r6
    mov r1, #0x0
    bl func_02068cc8
    mov r2, r0
    mov r0, #0x0
    mov r1, r0
    bl func_0204ed50
    bl func_0204a9b0
    add sp, sp, #0x4
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_3a0:
    bl func_020498f0
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0xec]
    str r1, [r4, #0xf0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff980
