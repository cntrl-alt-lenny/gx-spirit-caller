; func_0203df88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203df88
        .arm
func_0203df88:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, #0x0
    mov r4, r0
    mov r6, r5
    add lr, r0, #0x300
    mov ip, r5
    mov r2, r5
    mov r1, r5
    mov r7, r5
    mov r3, #0x1
.L_104:
    ldrb r8, [r0, #0xd0c]
    mov r8, r8, lsl #0x1c
    movs r9, r8, lsr #0x1c
    beq .L_120
    add r8, r6, #0x1
    cmp r9, r8
    bne .L_1dc
.L_120:
    ldrb r8, [r4, #0xe7]
    cmp r8, #0xff
    beq .L_1dc
    mov r9, ip
.L_130:
    add r8, r4, r9
    ldrb sl, [r8, #0x40]
    cmp sl, #0x0
    beq .L_158
    add r8, r9, #0x1
    add r9, lr, r9
    strb sl, [r9, #0x4]
    and r9, r8, #0xff
    cmp r9, #0x20
    bcc .L_130
.L_158:
    cmp r9, #0x0
    strneb r9, [lr, #0x3]
    movne r8, r3
    strneb r6, [lr, #0x1]
    moveq r8, r2
    cmp r8, #0x0
    addne r5, r5, #0x1
    ldrb r8, [r4, #0xe7]
    andne r5, r5, #0xff
    addne lr, lr, #0x24
    cmp r8, #0x1
    bne .L_1dc
    mov r9, r1
.L_18c:
    add r8, r4, r9
    ldrb sl, [r8, #0x60]
    cmp sl, #0x0
    beq .L_1b4
    add r8, r9, #0x1
    add r9, lr, r9
    strb sl, [r9, #0x4]
    and r9, r8, #0xff
    cmp r9, #0x20
    bcc .L_18c
.L_1b4:
    cmp r9, #0x0
    strneb r9, [lr, #0x3]
    movne r9, r3
    addne r8, r6, #0x3
    moveq r9, r7
    strneb r8, [lr, #0x1]
    cmp r9, #0x0
    addne r5, r5, #0x1
    andne r5, r5, #0xff
    addne lr, lr, #0x24
.L_1dc:
    add r6, r6, #0x1
    cmp r6, #0x3
    add r4, r4, #0x100
    blt .L_104
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
