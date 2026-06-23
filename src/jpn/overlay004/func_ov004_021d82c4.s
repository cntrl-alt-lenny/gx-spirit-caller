; func_ov004_021d82c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220e2a0
        .extern func_0202c06c
        .extern func_ov004_021c9cf4
        .extern func_ov004_021c9e10
        .extern func_ov004_021c9fc4
        .extern func_ov004_021d6e34
        .extern func_ov004_021d7100
        .extern func_ov004_021d7354
        .extern func_ov004_021d7478
        .extern func_ov004_021d7b98
        .extern func_ov004_021d7e40
        .global func_ov004_021d82c4
        .arm
func_ov004_021d82c4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    mov r5, #0x0
    str r5, [r4, #0xa0]
    ldr r0, _LIT1
    str r5, [r4, #0x9c]
    str r5, [r0, #0xc8c]
    ldr r0, [r4, #0x54]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_860
    b .L_860
    b .L_860
    b .L_778
    b .L_79c
    b .L_7ac
    b .L_7c8
    b .L_854
.L_778:
    ldr r0, [r4, #0x58]
    add r0, r0, #0x8
    str r0, [r4, #0x58]
    cmp r0, #0x100
    blt .L_860
    mov r0, #0x3
    str r0, [r4, #0x54]
    str r5, [r4, #0x58]
    b .L_860
.L_79c:
    mov r0, #0xe1
    bl func_ov004_021c9e10
    bl func_ov004_021d7b98
    b .L_860
.L_7ac:
    ldr r0, [r4, #0x58]
    add r0, r0, #0x8
    str r0, [r4, #0x58]
    cmp r0, #0x100
    strge r5, [r4, #0x54]
    strge r5, [r4, #0x58]
    b .L_860
.L_7c8:
    ldr r1, [r4, #0x58]
    sub r0, r5, #0x40
    add r1, r1, #0x8
    str r1, [r4, #0x58]
    cmp r1, r0
    bne .L_808
    mov r6, #0xc0
.L_7e4:
    add r0, r5, #0x3c4
    bl func_0202c06c
    mov r1, r0
    mov r0, r5
    mov r2, r6
    bl func_ov004_021d6e34
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_7e4
.L_808:
    ldr r0, [r4, #0x58]
    cmp r0, #0x40
    bne .L_81c
    mvn r0, #0x0
    bl func_ov004_021d7354
.L_81c:
    ldr r0, [r4, #0x58]
    mvn r1, #0x0
    cmp r0, #0x0
    moveq r0, #0x3
    str r1, [r4, #0x90]
    streq r0, [r4, #0x54]
    beq .L_860
    cmp r0, #0x100
    blt .L_860
    mov r1, #0x6
    mov r0, #0x0
    str r1, [r4, #0x54]
    str r0, [r4, #0x58]
    b .L_860
.L_854:
    mov r0, #0xe0
    bl func_ov004_021c9e10
    bl func_ov004_021d7e40
.L_860:
    bl func_ov004_021d7100
    bl func_ov004_021d7478
    ldr r0, [r4, #0x54]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_8a8
    b .L_88c
    b .L_88c
    b .L_894
    b .L_8a8
    b .L_8a0
.L_88c:
    mov r1, #0x100
    b .L_8ac
.L_894:
    ldr r0, [r4, #0x58]
    rsb r1, r0, #0x100
    b .L_8ac
.L_8a0:
    ldr r1, [r4, #0x58]
    b .L_8ac
.L_8a8:
    mov r1, #0x0
.L_8ac:
    ldr r0, [r4, #0xa0]
    mov r1, r1, lsl #0x5
    cmp r0, #0x1
    moveq r3, #0x1
    mov r0, r1, asr #0x7
    add r2, r1, r0, lsr #0x18
    movne r3, #0x0
    mov r1, #0x2
    add r0, r4, #0xf90
    mov r2, r2, asr #0x8
    str r1, [sp]
    add r3, r3, #0xc
    str r3, [sp, #0x4]
    add r3, r2, #0xa4
    add r0, r0, #0x5000
    mov r2, #0xe0
    bl func_ov004_021c9fc4
    ldr r0, [r4, #0x54]
    cmp r0, #0x5
    beq .L_908
    cmp r0, #0x6
    beq .L_92c
    b .L_93c
.L_908:
    ldr r1, [r4, #0x58]
    ldr r0, _LIT2
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    rsb r2, r1, #0x0
    ldr r1, _LIT3
    and r0, r2, r0
    str r0, [r1]
    b .L_948
.L_92c:
    ldr r0, _LIT3
    mov r1, #0x100
    str r1, [r0]
    b .L_948
.L_93c:
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0]
.L_948:
    add r1, r4, #0xef0
    ldr r0, _LIT4
    ldr r3, _LIT5
    add r1, r1, #0x5000
    mov r2, #0x4
    bl func_ov004_021c9cf4
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_0220e2a0
_LIT2: .word 0x000001ff
_LIT3: .word 0x0400101c
_LIT4: .word 0x05000638
_LIT5: .word 0x00600100
