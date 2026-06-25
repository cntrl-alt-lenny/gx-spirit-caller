; func_020752ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee00
        .extern data_0219ee2c
        .extern func_020704ec
        .extern func_02075c5c
        .extern func_02075d0c
        .extern func_02076264
        .extern func_0207634c
        .extern func_02094500
        .extern func_02094688
        .global func_020752ac
        .arm
func_020752ac:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r6, r0
    ldr r1, [r1]
    mov r0, #0x83
    ldr r5, [r6, #0xc]
    blx r1
    movs r4, r0
    moveq r0, #0x9
    addeq sp, sp, #0x8
    streqb r0, [r5, #0x455]
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r0, #0x14
    strb r0, [r4]
    mov r0, #0x3
    strb r0, [r4, #0x1]
    mov r1, #0x0
    strb r1, [r4, #0x2]
    strb r1, [r4, #0x3]
    mov r3, #0x1
    strb r3, [r4, #0x4]
    add r0, r5, #0x1cc
    mov r2, #0x8
    strb r3, [r4, #0x5]
    bl func_02094500
    mov r0, #0x16
    strb r0, [r4, #0x6]
    mov r0, #0x3
    strb r0, [r4, #0x7]
    mov r1, #0x0
    strb r1, [r4, #0x8]
    strb r1, [r4, #0x9]
    mov r0, #0x28
    strb r0, [r4, #0xa]
    mov r0, #0x14
    strb r0, [r4, #0xb]
    strb r1, [r4, #0xc]
    strb r1, [r4, #0xd]
    mov r3, #0x24
    add r0, r5, #0x3a4
    add r1, r5, #0x3fc
    mov r2, #0x58
    strb r3, [r4, #0xe]
    bl func_02094688
    mov r0, r5
    add r1, r4, #0xf
    mov r2, #0x0
    bl func_0207634c
    add r0, r5, #0x3fc
    add r1, r5, #0x3a4
    mov r2, #0x58
    bl func_02094688
    add r0, r5, #0x2ec
    add r1, r5, #0x348
    mov r2, #0x5c
    bl func_02094688
    mov r0, r5
    add r1, r4, #0x1f
    mov r2, #0x0
    bl func_02076264
    add r0, r5, #0x348
    add r1, r5, #0x2ec
    mov r2, #0x5c
    bl func_02094688
    mov r0, r5
    add r1, r4, #0xb
    mov r2, #0x28
    bl func_02075c5c
    mov r0, r5
    add r1, r4, #0x6
    bl func_02075d0c
    mov r2, #0x0
    add r1, r0, #0x6
    mov r0, r4
    mov r3, r2
    str r6, [sp]
    bl func_020704ec
    ldr r1, _LIT1
    mov r0, r4
    ldr r1, [r1]
    blx r1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_0219ee00
_LIT1: .word data_0219ee2c
