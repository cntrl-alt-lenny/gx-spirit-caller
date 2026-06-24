; func_02051898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba4
        .extern data_0219dbac
        .extern func_0204547c
        .extern func_0204987c
        .extern func_02092fc8
        .global func_02051898
        .arm
func_02051898:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_0204987c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
    cmp r4, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, pc}
    cmp r5, #0x0
    beq .L_48
    cmp r5, #0x1
    beq .L_130
    b .L_164
.L_48:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x13
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
    ldrb r0, [r4]
    cmp r0, #0x0
    beq .L_80
    ldrb r0, [r4, #0x1]
    cmp r0, #0x1
    addls sp, sp, #0x4
    movls r0, #0x3
    ldmlsia sp!, {r4, r5, pc}
.L_80:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_b4
    mov r0, #0x4
    mov r1, #0x20
    bl func_0204547c
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1]
    addeq sp, sp, #0x4
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, pc}
.L_b4:
    ldrb r2, [r4]
    ldr r1, _LIT0
    mov r3, #0x0
    strb r2, [r0]
    ldrb r2, [r4, #0x1]
    ldr r0, [r1]
    strb r2, [r0, #0x1]
    ldr r0, [r1]
    strb r3, [r0, #0x2]
    ldr r0, [r1]
    strb r3, [r0, #0x3]
    ldr r2, [r4, #0x4]
    ldr r0, [r1]
    str r2, [r0, #0x4]
    ldr r0, [r1]
    str r3, [r0, #0x8]
    ldr r0, [r1]
    str r3, [r0, #0xc]
    bl func_02092fc8
    ldr r2, _LIT0
    ldr r2, [r2]
    str r0, [r2, #0x10]
    str r1, [r2, #0x14]
    bl func_02092fc8
    ldr r2, _LIT0
    add sp, sp, #0x4
    ldr r2, [r2]
    str r0, [r2, #0x18]
    str r1, [r2, #0x1c]
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_130:
    ldr r0, [r4]
    add sp, sp, #0x4
    cmp r0, #0x0
    ldrne r0, _LIT1
    movne r1, #0x1
    strneb r1, [r0]
    ldreq r0, _LIT1
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r1, _LIT1
    mov r0, #0x0
    strb r0, [r1, #0x1]
    ldmia sp!, {r4, r5, pc}
.L_164:
    mov r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dba4
_LIT1: .word data_0219dbac
