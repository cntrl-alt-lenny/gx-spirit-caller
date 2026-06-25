; func_02060c48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bec78
        .extern data_02101314
        .extern data_0219e440
        .extern data_0219e648
        .extern func_020aace8
        .extern func_020aae1c
        .extern func_020aafd0
        .global func_02060c48
        .arm
func_02060c48:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x100
    ldr lr, _LIT0
    add ip, sp, #0x0
    mov r4, r0
    mov r3, #0x80
.L_18:
    ldrb r2, [lr], #0x1
    ldrb r0, [lr], #0x1
    subs r3, r3, #0x1
    strb r2, [ip], #0x1
    strb r0, [ip], #0x1
    bne .L_18
    ldr r2, _LIT1
    add r0, sp, #0x0
    ldr r3, [r2]
    eor r3, r3, #0x1
    str r3, [r2]
    bl func_020aae1c
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020aae1c
    add r1, sp, #0x0
    mov r0, r4
    bl func_020aafd0
    movs r4, r0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, sp, #0x0
    bl func_020aace8
    ldr r1, _LIT1
    ldr r2, _LIT3
    ldr r1, [r1]
    add r3, r4, r0
    add r0, r2, r1, lsl #0x8
    mov r2, r0
    b .L_9c
.L_94:
    ldrsb r1, [r3], #0x1
    strb r1, [r2], #0x1
.L_9c:
    ldrsb r1, [r3]
    cmp r1, #0x0
    beq .L_b0
    cmp r1, #0x5c
    bne .L_94
.L_b0:
    mov r1, #0x0
    strb r1, [r2]
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
_LIT0: .word data_020bec78
_LIT1: .word data_0219e440
_LIT2: .word data_02101314
_LIT3: .word data_0219e648
