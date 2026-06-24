; func_0200a46c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_020c3f48
        .extern data_02104e6c
        .extern data_021066d4
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_02009730
        .extern func_0202bc30
        .global func_0200a46c
        .arm
func_0200a46c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r2, _LIT0
    mov r9, r0
    ldr r0, [r2, #0xc]
    mov r8, r1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp]
    ldr r3, [sp]
    ldr r0, _LIT1
    mov r1, r9
    mov r2, #0x20
    add r5, r3, #0xc
    bl Copy32
    cmp r8, #0x0
    beq .L_5c
    ldr r0, _LIT2
    mov r1, r8
    add r0, r0, #0x88
    add r0, r0, #0x1800
    mov r2, #0x20
    bl Copy32
.L_5c:
    ldr r0, [sp]
    add r6, r5, #0x1c
    ldr r0, [r0, #0x4]
    mov sl, #0x1
    cmp r0, #0x1
    bcc .L_1ec
.L_74:
    ldr r0, _LIT2
    mov r4, sl, asr #0x5
    add r0, r0, r4, lsl #0x2
    add r0, r0, #0x1000
    ldr r1, [r6, #0x10]
    ldr r2, [r0, #0x868]
    mov r1, r1, lsl #0x10
    and fp, sl, #0x1f
    mov r0, #0x1
    tst r2, r0, lsl fp
    mov r0, r1, lsr #0x10
    mov r7, #0x0
    addne r6, r6, #0x1c
    bne .L_1d8
    ldr r2, [r9, r4, lsl #0x2]
    mov r1, #0x1
    tst r2, r1, lsl fp
    addne r6, r6, #0x1c
    bne .L_1d8
    ldr r1, [r6, #0xc]
    cmp r1, #0x0
    bne .L_160
    cmp r0, #0xfa0
    blt .L_e8
    mov r1, r7
    bl func_0202bc30
    cmp r0, #0x0
    movne r7, #0x1
    b .L_160
.L_e8:
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_15c
    b .L_108
    b .L_110
    b .L_124
    b .L_138
    b .L_148
.L_108:
    mov r7, #0x1
    b .L_160
.L_110:
    ldr r0, _LIT2
    ldr r0, [r0, #0x928]
    cmp r0, #0x7
    movcs r7, #0x1
    b .L_160
.L_124:
    ldr r0, _LIT2
    ldr r0, [r0, #0x928]
    cmp r0, #0x18
    movcs r7, #0x1
    b .L_160
.L_138:
    bl func_02009730
    cmp r0, #0x1
    moveq r7, #0x1
    b .L_160
.L_148:
    ldr r0, _LIT2
    ldr r0, [r0, #0x928]
    cmp r0, #0x28
    movcs r7, #0x1
    b .L_160
.L_15c:
    mov r7, #0x1
.L_160:
    cmp r7, #0x1
    bne .L_1d4
    ldr r1, [r9, r4, lsl #0x2]
    mov r0, #0x1
    ldr r3, [r6, #0x4]
    orr r0, r1, r0, lsl fp
    str r0, [r9, r4, lsl #0x2]
    mov r0, #0x1
    mvn r0, r0, lsl fp
    ldr r1, [r8, r4, lsl #0x2]
    cmp r3, #0x0
    and r0, r1, r0
    str r0, [r8, r4, lsl #0x2]
    beq .L_1d4
    mov r2, #0x1
    mov r4, #0x1c
.L_1a0:
    mov r0, r3, asr #0x5
    ldr r7, [r9, r0, lsl #0x2]
    and r1, r3, #0x1f
    orr r7, r7, r2, lsl r1
    str r7, [r9, r0, lsl #0x2]
    mla r7, r3, r4, r5
    mvn r1, r2, lsl r1
    ldr r3, [r8, r0, lsl #0x2]
    and r1, r3, r1
    str r1, [r8, r0, lsl #0x2]
    ldr r3, [r7, #0x4]
    cmp r3, #0x0
    bne .L_1a0
.L_1d4:
    add r6, r6, #0x1c
.L_1d8:
    ldr r0, [sp]
    add sl, sl, #0x1
    ldr r0, [r0, #0x4]
    cmp sl, r0
    bls .L_74
.L_1ec:
    ldr r0, [sp]
    bl func_02006e00
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3f48
_LIT1: .word data_021066d4
_LIT2: .word data_02104e6c
