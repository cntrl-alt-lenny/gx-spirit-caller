; func_020aad04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aad04
        .arm
func_020aad04:
    stmdb sp!, {r3, r4, r5, lr}
    and r4, r1, #0x3
    and r3, r0, #0x3
    mov r2, r0
    cmp r3, r4
    bne .L_9c
    cmp r4, #0x0
    beq .L_58
    ldrb r3, [r1]
    strb r3, [r0]
    cmp r3, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    rsbs r4, r4, #0x3
    beq .L_50
.L_38:
    ldrb r3, [r1, #0x1]!
    cmp r3, #0x0
    strb r3, [r2, #0x1]!
    ldmeqia sp!, {r3, r4, r5, pc}
    subs r4, r4, #0x1
    bne .L_38
.L_50:
    add r2, r2, #0x1
    add r1, r1, #0x1
.L_58:
    ldr r5, [r1]
    ldr r3, _LIT0
    mvn r4, r5
    add lr, r5, r3
    ldr ip, _LIT1
    and r4, lr, r4
    tst r4, ip
    bne .L_9c
    sub r2, r2, #0x4
.L_7c:
    str r5, [r2, #0x4]!
    ldr r5, [r1, #0x4]!
    add r4, r5, r3
    mvn lr, r5
    and lr, r4, lr
    tst lr, ip
    beq .L_7c
    add r2, r2, #0x4
.L_9c:
    ldrb r3, [r1]
    strb r3, [r2]
    cmp r3, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_ac:
    ldrb r3, [r1, #0x1]!
    cmp r3, #0x0
    strb r3, [r2, #0x1]!
    bne .L_ac
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0xfefefeff
_LIT1: .word 0x80808080
