; func_020aaf40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aaf40
        .arm
func_020aaf40:
    stmdb sp!, {r4, lr}
    ldrb r2, [r0]
    ldrb r3, [r1]
    subs r3, r2, r3
    movne r0, r3
    ldmneia sp!, {r4, pc}
    and r4, r0, #0x3
    and r3, r1, #0x3
    cmp r3, r4
    bne .L_224
    cmp r4, #0x0
    beq .L_1bc
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    rsbs r4, r4, #0x3
    beq .L_1b4
.L_18c:
    ldrb r3, [r0, #0x1]!
    ldrb r2, [r1, #0x1]!
    subs r2, r3, r2
    movne r0, r2
    ldmneia sp!, {r4, pc}
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    subs r4, r4, #0x1
    bne .L_18c
.L_1b4:
    add r0, r0, #0x1
    add r1, r1, #0x1
.L_1bc:
    ldr r2, [r0]
    ldr r3, _LIT0
    mvn r4, r2
    add lr, r2, r3
    ldr ip, _LIT1
    and r4, lr, r4
    tst r4, ip
    ldr r4, [r1]
    bne .L_210
    cmp r2, r4
    bne .L_204
.L_1e8:
    ldr r2, [r0, #0x4]!
    ldr r4, [r1, #0x4]!
    add lr, r2, r3
    tst lr, ip
    bne .L_210
    cmp r2, r4
    beq .L_1e8
.L_204:
    sub r0, r0, #0x1
    sub r1, r1, #0x1
    b .L_224
.L_210:
    ldrb r2, [r0]
    ldrb r3, [r1]
    subs r3, r2, r3
    movne r0, r3
    ldmneia sp!, {r4, pc}
.L_224:
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_230:
    ldrb r3, [r0, #0x1]!
    ldrb r2, [r1, #0x1]!
    subs r2, r3, r2
    movne r0, r2
    ldmneia sp!, {r4, pc}
    cmp r3, #0x0
    bne .L_230
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfefefeff
_LIT1: .word 0x80808080
