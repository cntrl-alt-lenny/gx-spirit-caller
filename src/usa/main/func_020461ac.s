; func_020461ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_020465b0
        .extern func_0204664c
        .extern func_0204f958
        .extern func_0204ff98
        .global func_020461ac
        .arm
func_020461ac:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bne .L_48
    cmp r6, #0x0
    beq .L_48
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x4ec]
    cmp r0, #0x0
    bne .L_ac
    bl func_0204ff98
    mov r0, #0x3
    bl func_0204664c
    b .L_ac
.L_48:
    cmp r7, #0x0
    bne .L_ac
    mov r0, #0x6
    bl func_0204664c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r3, [r1]
    ldrb r1, [r3, #0x361]
    cmp r1, #0x0
    blt .L_ac
    ldr r2, [r3, #0x64]
.L_74:
    add r1, r3, r0, lsl #0x2
    ldr r1, [r1, #0x448]
    cmp r2, r1
    bne .L_9c
    ldr r1, _LIT0
    ldr r1, [r1]
    add r0, r1, r0
    ldrb r0, [r0, #0x61c]
    strb r0, [r1, #0x2c]
    b .L_ac
.L_9c:
    ldrb r1, [r3, #0x361]
    add r0, r0, #0x1
    cmp r0, r1
    ble .L_74
.L_ac:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1]
    ldrb r1, [r2, #0x361]
    add r0, r2, r0
    add r1, r1, #0x1
    bl func_020465b0
    ldr r1, _LIT0
    ldr r1, [r1]
    str r0, [r1, #0x63c]
    bl func_0204f958
    ldr r0, _LIT0
    ldr r1, [r0]
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    beq .L_f8
    ldrb r0, [r1, #0x369]
    cmp r0, #0x3
    bne .L_12c
.L_f8:
    ldr r0, _LIT0
    ldr r1, [sp, #0x20]
    ldr r3, [r0]
    mov r0, r7
    str r1, [sp]
    ldr r2, [r3, #0x8c]
    mov r1, r6
    str r2, [sp, #0x4]
    ldr r6, [r3, #0x88]
    mov r2, r5
    mov r3, r4
    blx r6
    b .L_140
.L_12c:
    ldr r2, [r1, #0x84]
    ldr r3, [r1, #0x80]
    mov r0, r7
    mov r1, r6
    blx r3
.L_140:
    cmp r7, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r0, #0x24]
    cmp r0, #0x5
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x3
    bl func_0204664c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219da0c
_LIT1: .word 0x0000061c
