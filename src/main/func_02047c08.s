; func_02047c08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc74
        .extern data_0219dc78
        .extern data_0219dc7c
        .extern func_0204052c
        .extern func_0204548c
        .extern func_020454ac
        .extern func_020454cc
        .extern func_020459c4
        .extern func_02053190
        .extern func_020531a0
        .extern func_020531c0
        .extern func_02053230
        .extern func_0205337c
        .extern func_020536c8
        .extern func_020930b0
        .extern func_020945f4
        .extern func_02094688
        .extern func_020aadf8
        .global func_02047c08
        .arm
func_02047c08:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    mov r5, r0
    mov r4, r1
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x48
    bl func_020945f4
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0]
    str r5, [r2]
    str r4, [r1]
    ldr r0, [r0, #0x1c]
    bl func_02053190
    cmp r0, #0x0
    beq .L_440
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1, #0x1c]
    add r2, r1, #0x248
    ldr r1, [r0, #0x24]
    add r0, r0, #0x10
    bl func_0205337c
    b .L_4f4
.L_440:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x3c
    bl func_020531a0
    cmp r0, #0x0
    bne .L_4a8
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x1c]
    add r0, r0, #0x4
    bl func_020531c0
    cmp r0, #0x0
    beq .L_494
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1, #0x1c]
    add r3, r1, #0x3c
    add r0, r0, #0x4
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    b .L_4dc
.L_494:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x3c
    bl func_02053230
    b .L_4dc
.L_4a8:
    bl func_020930b0
    ldr r2, _LIT3
    ldr r3, _LIT4
    umull ip, r4, r0, r2
    mla r4, r0, r3, r4
    ldr r3, _LIT0
    ldr r0, _LIT5
    mla r4, r1, r2, r4
    adds r0, ip, r0
    ldr r3, [r3]
    adc r1, r4, #0x0
    add r0, r3, #0x3c
    bl func_020536c8
.L_4dc:
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r1, [r2, #0xc]
    add r0, r2, #0x3c
    add r2, r2, #0x248
    bl func_0205337c
.L_4f4:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    bl func_020459c4
    ldr r1, _LIT0
    mov r2, r0, lsl #0x1
    ldr r1, [r1]
    add r2, r2, #0x2
    ldr r0, [r1, #0x10]
    add r1, sp, #0x0
    bl func_02094688
    ldr r0, _LIT0
    ldr r1, _LIT6
    ldr r2, [r0]
    add r0, sp, #0x34
    add r1, r2, r1
    bl func_020aadf8
    ldr r4, _LIT7
    ldr r3, _LIT8
    ldr r1, _LIT9
    mov r0, #0x0
    mov r2, #0x4
    str r4, [sp, #0x40]
    str r3, [sp, #0x44]
    bl func_020454ac
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    str r4, [r0, #0x24]
    bl func_020930b0
    ldr r2, _LIT0
    ldr r2, [r2]
    str r0, [r2, #0x28]
    str r1, [r2, #0x2c]
    mov r1, r4
    add r0, sp, #0x0
    bl func_0204052c
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dc78
_LIT1: .word data_0219dc7c
_LIT2: .word data_0219dc74
_LIT3: .word 0x6c078965
_LIT4: .word 0x5d588b65
_LIT5: .word 0x00269ec3
_LIT6: .word 0x00000251
_LIT7: .word func_020454cc
_LIT8: .word func_0204548c
_LIT9: .word 0x00001c10
