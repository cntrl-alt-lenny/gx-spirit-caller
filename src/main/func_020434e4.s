; func_020434e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020febf8
        .extern data_020fec28
        .extern data_0219da64
        .extern data_0219da68
        .extern data_021aa460
        .extern func_0209bb60
        .extern func_0209bc20
        .extern func_0209bea0
        .extern func_020aaddc
        .extern func_020aadf8
        .extern func_020aaf40
        .extern func_020ace00
        .global func_020434e4
        .arm
func_020434e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x40
    mov r6, r0
    bl func_020aaddc
    mov r4, r0
    ldr r0, _LIT0
    bl func_020aaddc
    cmp r4, r0
    bne .L_4fc
    ldrsb r0, [r6, #0x7]
    cmp r0, #0x20
    bne .L_4fc
    ldrsb r0, [r6, #0xb]
    cmp r0, #0x20
    bne .L_4fc
    ldrsb r0, [r6, #0x10]
    cmp r0, #0x20
    bne .L_4fc
    ldrsb r0, [r6, #0x13]
    cmp r0, #0x3a
    bne .L_4fc
    ldrsb r0, [r6, #0x16]
    cmp r0, #0x3a
    bne .L_4fc
    ldrsb r0, [r6, #0x19]
    cmp r0, #0x20
    bne .L_4fc
    add r0, sp, #0x0
    bl func_0209bc20
    cmp r0, #0x0
    bne .L_4fc
    add r0, sp, #0x10
    bl func_0209bb60
    cmp r0, #0x0
    bne .L_4fc
    add r0, sp, #0x0
    add r1, sp, #0x10
    bl func_0209bea0
    mov r4, r0
    mov r5, r1
    mvn r0, #0x0
    cmp r5, r0
    cmpeq r4, r0
    beq .L_4fc
    add r0, sp, #0x1c
    mov r1, r6
    bl func_020aadf8
    mov r2, #0x0
    ldr r1, _LIT1
    add r0, sp, #0x28
    strb r2, [sp, #0x23]
    strb r2, [sp, #0x27]
    strb r2, [sp, #0x2c]
    strb r2, [sp, #0x2f]
    strb r2, [sp, #0x32]
    strb r2, [sp, #0x35]
    str r2, [r1]
    bl func_020ace00
    ldr r1, _LIT1
    str r0, [sp]
    ldr r1, [r1]
    cmp r1, #0x22
    beq .L_4fc
    sub r1, r0, #0x7d0
    mov r0, #0xd
    str r1, [sp]
    str r0, [sp, #0x4]
    mov r8, #0x0
    ldr r7, _LIT2
    add r6, sp, #0x24
.L_3f0:
    ldr r0, [r7, r8, lsl #0x2]
    mov r1, r6
    bl func_020aaf40
    cmp r0, #0x0
    addeq r0, r8, #0x1
    streq r0, [sp, #0x4]
    beq .L_418
    add r8, r8, #0x1
    cmp r8, #0xc
    blt .L_3f0
.L_418:
    ldr r0, [sp, #0x4]
    cmp r0, #0xc
    bhi .L_4fc
    ldr r1, _LIT1
    mov r2, #0x0
    add r0, sp, #0x21
    str r2, [r1]
    bl func_020ace00
    ldr r1, _LIT1
    str r0, [sp, #0x8]
    ldr r0, [r1]
    cmp r0, #0x22
    beq .L_4fc
    mov r2, #0x0
    add r0, sp, #0x2d
    str r2, [r1]
    bl func_020ace00
    ldr r1, _LIT1
    str r0, [sp, #0x10]
    ldr r0, [r1]
    cmp r0, #0x22
    beq .L_4fc
    mov r2, #0x0
    add r0, sp, #0x30
    str r2, [r1]
    bl func_020ace00
    ldr r1, _LIT1
    str r0, [sp, #0x14]
    ldr r0, [r1]
    cmp r0, #0x22
    beq .L_4fc
    mov r2, #0x0
    add r0, sp, #0x33
    str r2, [r1]
    bl func_020ace00
    ldr r1, _LIT1
    str r0, [sp, #0x18]
    ldr r0, [r1]
    cmp r0, #0x22
    beq .L_4fc
    add r0, sp, #0x0
    add r1, sp, #0x10
    bl func_0209bea0
    mvn r2, #0x0
    cmp r1, r2
    cmpeq r0, r2
    beq .L_4fc
    subs r4, r4, r0
    ldr r2, _LIT3
    sbc r3, r5, r1
    ldr r1, _LIT4
    mov r0, #0x1
    str r3, [r2, #0x4]
    str r0, [r1]
    add sp, sp, #0x40
    str r4, [r2]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4fc:
    mov r0, #0x0
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020fec28
_LIT1: .word data_021aa460
_LIT2: .word data_020febf8
_LIT3: .word data_0219da68
_LIT4: .word data_0219da64
