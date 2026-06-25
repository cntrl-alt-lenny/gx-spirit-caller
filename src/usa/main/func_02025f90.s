; func_02025f90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_InvokeLocked
        .extern data_020c680c
        .extern data_020c6810
        .extern data_02186a10
        .extern data_02186a18
        .extern func_0200ada0
        .extern func_0200adbc
        .extern func_0200b368
        .extern func_0200b580
        .extern func_0200b5f8
        .extern func_0200b7e0
        .extern func_0200b9e4
        .extern func_0200bb40
        .extern func_0200bc8c
        .extern func_0200bcc8
        .extern func_0200bd04
        .extern func_0200bd3c
        .extern func_0200ee8c
        .extern func_0200eed4
        .extern func_0200ef44
        .extern func_0200efc4
        .extern func_0200f028
        .extern func_0200f120
        .extern func_0200f290
        .extern func_0200f498
        .extern func_0200f668
        .extern func_020215d8
        .extern func_0202160c
        .extern func_020221e0
        .extern func_02025868
        .extern func_0207dbc0
        .extern func_0207dc10
        .extern func_0207dc38
        .extern func_020a9698
        .global func_02025f90
        .arm
func_02025f90:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xf0
    mov r7, r0
    add r9, sp, #0x88
    mov r6, r1
    mov r5, r2
    mov r4, r3
    mov sl, r7
    mov r8, #0x6
.L_24:
    ldmia sl!, {r0, r1, r2, r3}
    stmia r9!, {r0, r1, r2, r3}
    subs r8, r8, #0x1
    bne .L_24
    ldmia sl, {r0, r1}
    stmia r9, {r0, r1}
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x16c
    ldr r8, [r7, #0x154]
    ldr r9, [r7, #0x158]
    bl Fill32
    add lr, sp, #0x88
    mov ip, r7
    mov sl, #0x6
.L_60:
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    subs sl, sl, #0x1
    bne .L_60
    ldmia lr, {r0, r1}
    stmia ip, {r0, r1}
    str r8, [r7, #0x154]
    mov sl, r6
    str r9, [r7, #0x158]
    add r8, r7, #0x68
    ldmia sl!, {r0, r1, r2, r3}
    stmia r8!, {r0, r1, r2, r3}
    ldmia sl!, {r0, r1, r2, r3}
    stmia r8!, {r0, r1, r2, r3}
    ldmia sl, {r0, r1, r2}
    stmia r8, {r0, r1, r2}
    add r0, r7, #0x3
    add r1, r6, #0x1c
    add r9, r0, #0x100
    add lr, r7, #0xac
    ldmia r1, {r0, r1, r2}
    stmia lr, {r0, r1, r2}
    mov r8, #0x0
    str r8, [r7, #0xb8]
    str r8, [r7, #0xbc]
    mov ip, #0x1000
    str r8, [r7, #0xc0]
    str ip, [r7, #0xc4]
    str ip, [r7, #0xc8]
    mov r3, #0x1f0
    str ip, [r7, #0xcc]
    str r3, [r7, #0xd0]
    str r8, [r7, #0xd4]
    add sl, r7, #0x100
    str r8, [r7, #0xd8]
    strh r8, [sl, #0x62]
    ldrh r0, [sl, #0x6a]
    mvn r1, #0x0
    bic r0, r0, #0x4
    strh r0, [sl, #0x6a]
    ldrh r0, [sl, #0x6a]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    strh r0, [sl, #0x6a]
    ldrh r0, [sl, #0x6a]
    orr r0, r0, #0x20
    bic r0, r0, #0xf000
    orr r0, r0, #0xf000
    strh r0, [sl, #0x6a]
.L_128:
    add r0, r7, r8, lsl #0x4
    add r0, r0, #0x100
    strh r1, [r0]
    ldrb r0, [r9]
    add r8, r8, #0x1
    cmp r8, #0x6
    bic r0, r0, #0x1
    strb r0, [r9], #0x10
    blt .L_128
    cmp r5, #0x0
    blt .L_184
    bl func_020215d8
    mov r2, r5
    mov r1, #0x3
    bl func_0202160c
    ldr r0, [r0, #0x94]
    str r0, [r7, #0x94]
    strh r5, [r7, #0xa8]
    ldrb r0, [r7, #0xaa]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    strb r0, [r7, #0xaa]
    b .L_1e4
.L_184:
    ldr r0, [r6]
    bl func_0200adbc
    cmp r0, #0x0
    beq .L_1bc
    ldr r0, [r6]
    bl func_0200ada0
    str r0, [r7, #0x94]
    ldrb r2, [r7, #0xaa]
    mov r0, #0x1c
    mov r1, #0x0
    bic r2, r2, #0x1
    strb r2, [r7, #0xaa]
    bl func_020221e0
    b .L_1e4
.L_1bc:
    add r2, r7, #0x100
    ldrh r3, [r2, #0x6a]
    mov r0, #0x1c
    mov r1, #0x1
    bic r3, r3, #0x1
    strh r3, [r2, #0x6a]
    bl func_020221e0
    add sp, sp, #0xf0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1e4:
    ldr r2, [r7, #0x94]
    ldr r1, _LIT0
    add r0, sp, #0x20
    bl func_0207dc38
    cmp r0, #0x0
    addeq sp, sp, #0xf0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, [r7, #0x154]
    ldr r0, _LIT1
    ldr r1, _LIT2
    str r2, [r0]
    ldr r2, [r7, #0x158]
    add r0, sp, #0x0
    str r2, [r1]
    ldr r2, [r6, #0x4]
    ldr r1, _LIT3
    bl func_020a9698
    add r0, sp, #0x0
    bl func_0207dbc0
    str r0, [r7, #0xa0]
    bl func_0200b368
    ldr r2, [r6, #0x14]
    mov r5, r0
    cmp r2, #0x0
    beq .L_2f8
    ldr r1, _LIT3
    add r0, sp, #0x0
    bl func_020a9698
    add r0, sp, #0x0
    bl func_0207dbc0
    bl func_0200b9e4
    ldrb r1, [r7, #0xab]
    mov r8, r0
    cmp r4, #0x0
    orr r0, r1, #0x8
    strb r0, [r7, #0xab]
    blt .L_2a8
    bl func_020215d8
    mov r2, r4
    mov r1, #0x3
    bl func_0202160c
    bl func_02025868
    mov r1, r0
    mov r0, r5
    mov r2, r8
    mov r3, #0x1
    bl func_0200efc4
    b .L_2b8
.L_2a8:
    mov r0, r5
    mov r1, r8
    mov r2, #0x1
    bl func_0200eed4
.L_2b8:
    str r0, [r7, #0xa4]
    ldr r0, [r8]
    bl func_0200bd04
    ldr r2, [r7, #0xa4]
    mov r1, #0x0
    str r0, [r2, #0xa0]
    ldr r0, [r7, #0xa4]
    mov r2, r1
    mov r3, #0x1
    bl func_0200f498
    mov r1, #0x1
    ldr r0, [r7, #0xa4]
    mov r3, r1
    mov r2, #0x0
    bl func_0200f498
    b .L_330
.L_2f8:
    cmp r4, #0x0
    blt .L_328
    bl func_020215d8
    mov r2, r4
    mov r1, #0x3
    bl func_0202160c
    bl func_02025868
    mov r1, r0
    mov r0, r5
    bl func_0200ef44
    str r0, [r7, #0xa4]
    b .L_330
.L_328:
    bl func_0200ee8c
    str r0, [r7, #0xa4]
.L_330:
    mov r0, r5
    bl Task_InvokeLocked
    ldr r2, [r6, #0x8]
    cmp r2, #0x0
    beq .L_398
    ldr r1, _LIT3
    add r0, sp, #0x0
    bl func_020a9698
    add r0, sp, #0x0
    bl func_0207dbc0
    bl func_0200b580
    ldr r2, [r7, #0xa4]
    mov r1, #0x0
    str r0, [r2, #0x80]
    ldrb r0, [r7, #0xab]
    mov r2, r1
    mov r3, #0x1
    orr r0, r0, #0x1
    strb r0, [r7, #0xab]
    ldr r0, [r7, #0xa4]
    bl func_0200f028
    mov r1, #0x1
    ldr r0, [r7, #0xa4]
    mov r2, #0x0
    mov r3, r1
    bl func_0200f028
.L_398:
    ldr r2, [r6, #0xc]
    cmp r2, #0x0
    beq .L_408
    ldr r1, _LIT3
    add r0, sp, #0x0
    bl func_020a9698
    add r0, sp, #0x0
    bl func_0207dbc0
    bl func_0200b7e0
    ldr r1, [r7, #0xa4]
    str r0, [r1, #0x90]
    ldr r0, [r0]
    bl func_0200bc8c
    ldr r2, [r7, #0xa4]
    mov r1, #0x0
    str r0, [r2, #0x94]
    ldrb r0, [r7, #0xab]
    mov r2, r1
    mov r3, #0x1
    orr r0, r0, #0x2
    strb r0, [r7, #0xab]
    ldr r0, [r7, #0xa4]
    bl func_0200f290
    mov r1, #0x1
    ldr r0, [r7, #0xa4]
    mov r2, #0x0
    mov r3, r1
    bl func_0200f290
.L_408:
    ldr r2, [r6, #0x10]
    cmp r2, #0x0
    beq .L_478
    ldr r1, _LIT3
    add r0, sp, #0x0
    bl func_020a9698
    add r0, sp, #0x0
    bl func_0207dbc0
    bl func_0200b5f8
    ldr r1, [r7, #0xa4]
    str r0, [r1, #0x88]
    ldr r0, [r0]
    bl func_0200bcc8
    ldr r2, [r7, #0xa4]
    mov r1, #0x0
    str r0, [r2, #0x8c]
    ldrb r0, [r7, #0xab]
    mov r2, r1
    mov r3, #0x1
    orr r0, r0, #0x4
    strb r0, [r7, #0xab]
    ldr r0, [r7, #0xa4]
    bl func_0200f120
    mov r1, #0x1
    ldr r0, [r7, #0xa4]
    mov r2, #0x0
    mov r3, r1
    bl func_0200f120
.L_478:
    ldr r2, [r6, #0x18]
    cmp r2, #0x0
    beq .L_4e8
    ldr r1, _LIT3
    add r0, sp, #0x0
    bl func_020a9698
    add r0, sp, #0x0
    bl func_0207dbc0
    bl func_0200bb40
    ldr r1, [r7, #0xa4]
    str r0, [r1, #0xa4]
    ldr r0, [r0]
    bl func_0200bd3c
    ldr r2, [r7, #0xa4]
    mov r1, #0x0
    str r0, [r2, #0xa8]
    ldrb r0, [r7, #0xab]
    mov r2, r1
    mov r3, #0x1
    orr r0, r0, #0x10
    strb r0, [r7, #0xab]
    ldr r0, [r7, #0xa4]
    bl func_0200f668
    mov r1, #0x1
    ldr r0, [r7, #0xa4]
    mov r2, #0x0
    mov r3, r1
    bl func_0200f668
.L_4e8:
    add r0, sp, #0x20
    bl func_0207dc10
    mov r0, #0x1
    add sp, sp, #0xf0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_020c680c
_LIT1: .word data_02186a10
_LIT2: .word data_02186a18
_LIT3: .word data_020c6810
