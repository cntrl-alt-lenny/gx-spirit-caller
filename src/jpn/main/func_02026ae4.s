; func_02026ae4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c680c
        .extern data_020c6810
        .extern func_02006e00
        .extern func_0200ada0
        .extern func_0200aeec
        .extern func_0200afac
        .extern func_0200b580
        .extern func_0200b5f8
        .extern func_0200f028
        .extern func_0200f120
        .extern func_020215d8
        .extern func_0202160c
        .extern func_0207dbc0
        .extern func_0207dc10
        .extern func_0207dc38
        .extern func_020a9698
        .global func_02026ae4
        .arm
func_02026ae4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x88
    mov r7, r1
    mov r1, r7, lsl #0x18
    mov r6, r2
    mov r5, r3
    add r4, r0, #0x94
    movs r7, r1, asr #0x18
    bmi .L_44
    add r0, r4, r7, lsl #0x2
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_44
    bl func_02006e00
    add r0, r4, r7, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x4]
.L_44:
    ldrb r0, [r4, #0x16]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_78
    bl func_020215d8
    ldrsh r2, [r4, #0x14]
    mov r1, #0x3
    bl func_0202160c
    add r0, r0, r7, lsl #0x2
    ldr r2, [r0, #0x98]
    add r0, r4, r7, lsl #0x2
    str r2, [r0, #0x4]
    b .L_98
.L_78:
    cmp r7, #0x0
    ldrlt r2, [r4]
    blt .L_98
    ldr r0, [r5]
    bl func_0200ada0
    mov r2, r0
    add r0, r4, r7, lsl #0x2
    str r2, [r0, #0x4]
.L_98:
    ldr r1, _LIT0
    add r0, sp, #0x20
    bl func_0207dc38
    cmp r0, #0x0
    addeq sp, sp, #0x88
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    tst r6, #0x1
    beq .L_158
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x80]
    cmp r0, #0x0
    beq .L_d4
    tst r6, #0x80
    bne .L_158
.L_d4:
    cmp r0, #0x0
    beq .L_f8
    bl func_0200aeec
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    str r1, [r0, #0x80]
    ldrb r0, [r4, #0x17]
    bic r0, r0, #0x1
    strb r0, [r4, #0x17]
.L_f8:
    ldr r2, [r5, #0x8]
    cmp r2, #0x0
    beq .L_158
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_020a9698
    add r0, sp, #0x0
    bl func_0207dbc0
    bl func_0200b580
    ldr r2, [r4, #0x10]
    mov r1, #0x0
    str r0, [r2, #0x80]
    ldrb r0, [r4, #0x17]
    mov r2, r1
    mov r3, #0x1
    orr r0, r0, #0x1
    strb r0, [r4, #0x17]
    ldr r0, [r4, #0x10]
    bl func_0200f028
    mov r1, #0x1
    ldr r0, [r4, #0x10]
    mov r2, #0x0
    mov r3, r1
    bl func_0200f028
.L_158:
    tst r6, #0x4
    beq .L_1fc
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x88]
    cmp r0, #0x0
    beq .L_178
    tst r6, #0x80
    bne .L_1fc
.L_178:
    cmp r0, #0x0
    beq .L_19c
    bl func_0200afac
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    str r1, [r0, #0x88]
    ldrb r0, [r4, #0x17]
    bic r0, r0, #0x4
    strb r0, [r4, #0x17]
.L_19c:
    ldr r2, [r5, #0x10]
    cmp r2, #0x0
    beq .L_1fc
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_020a9698
    add r0, sp, #0x0
    bl func_0207dbc0
    bl func_0200b5f8
    ldr r2, [r4, #0x10]
    mov r1, #0x0
    str r0, [r2, #0x88]
    ldrb r0, [r4, #0x17]
    mov r2, r1
    mov r3, #0x1
    orr r0, r0, #0x4
    strb r0, [r4, #0x17]
    ldr r0, [r4, #0x10]
    bl func_0200f120
    mov r1, #0x1
    ldr r0, [r4, #0x10]
    mov r2, #0x0
    mov r3, r1
    bl func_0200f120
.L_1fc:
    add r0, sp, #0x20
    bl func_0207dc10
    mov r0, #0x1
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020c680c
_LIT1: .word data_020c6810
