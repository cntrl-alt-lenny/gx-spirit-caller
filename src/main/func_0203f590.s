; func_0203f590 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bece4
        .extern data_020fe4dc
        .extern data_020fe4e8
        .extern func_0203f198
        .global func_0203f590
        .arm
func_0203f590:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    ldr lr, _LIT0
    add ip, sp, #0x0
    mov r4, r1
    mov r3, #0xc
.L_18:
    ldrb r2, [lr], #0x1
    ldrb r1, [lr], #0x1
    subs r3, r3, #0x1
    strb r2, [ip], #0x1
    strb r1, [ip], #0x1
    bne .L_18
    mov r1, r4
    mov r2, #0x20
    mov r3, #0x18
    bl func_0203f198
    mov r3, #0x0
    ldr r0, _LIT1
.L_48:
    ldr r1, [r0]
    ldrb r2, [r4, r3]
    ldrsb r1, [r1, r3]
    eor r1, r2, r1
    strb r1, [r4, r3]
    add r3, r3, #0x1
    cmp r3, #0x18
    blt .L_48
    mov lr, #0x0
    add ip, sp, #0x0
    mov r1, #0xff
.L_74:
    and r7, lr, #0xff
    ldrb r0, [ip, r7]
    mov r6, r7
    ldrb r5, [r4, lr]
    cmp r0, #0xff
    beq .L_b8
.L_8c:
    add r3, ip, r6
    ldrb r6, [ip, r6]
    ldrb r0, [ip, r7]
    ldrb r2, [r4, r6]
    mov r7, r6
    strb r5, [r4, r0]
    strb r1, [r3]
    ldrb r0, [ip, r6]
    mov r5, r2
    cmp r0, #0xff
    bne .L_8c
.L_b8:
    add lr, lr, #0x1
    cmp lr, #0x18
    blt .L_74
    ldr r0, _LIT2
    mov r3, #0x0
.L_cc:
    ldr r1, [r0]
    ldrb r2, [r4, r3]
    ldrsb r1, [r1, r3]
    eor r1, r2, r1
    strb r1, [r4, r3]
    add r3, r3, #0x1
    cmp r3, #0x18
    blt .L_cc
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020bece4+0x20
_LIT1: .word data_020fe4e8
_LIT2: .word data_020fe4dc
