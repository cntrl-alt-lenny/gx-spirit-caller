; func_020515a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_02049cfc
        .extern func_02049e10
        .extern func_02049ec4
        .extern func_02049eec
        .extern func_02049ef8
        .extern func_02049f00
        .extern func_02049fa8
        .extern func_02049fac
        .extern func_02049fb0
        .extern func_0204a998
        .extern func_0206249c
        .extern func_020624b4
        .extern func_02067368
        .extern func_020675c8
        .extern func_020675e0
        .extern func_020675f8
        .extern func_02067610
        .global func_020515a4
        .arm
func_020515a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    bl func_0204987c
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_0204987c
    str r4, [r0, #0x1f8]
    mov sl, #0x0
    ldr fp, _LIT0
    mov r4, sl
    mov r5, #0x1
.L_228:
    bl func_0204987c
    mov r9, r0
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_0206249c
    mov r8, r0
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020624b4
    mov r7, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldr r3, [r0, #0x2f0]
    mov r1, r8
    str r3, [sp]
    str r5, [sp, #0x4]
    str r5, [sp, #0x8]
    ldr r3, _LIT1
    str fp, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr r3, _LIT2
    mov r2, r7
    str r3, [sp, #0x14]
    ldr r3, _LIT3
    add r0, r9, #0x10
    str r3, [sp, #0x18]
    ldr r3, _LIT4
    str r3, [sp, #0x1c]
    ldr r3, _LIT5
    str r3, [sp, #0x20]
    str r4, [sp, #0x24]
    ldr r3, [r6, #0x2ec]
    bl func_02067610
    movs r6, r0
    beq .L_2f0
    cmp r6, #0x3
    bne .L_2d0
    cmp sl, #0x4
    bne .L_2e4
.L_2d0:
    mov r0, r6
    bl func_0204a998
    add sp, sp, #0x2c
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e4:
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_228
.L_2f0:
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1c]
    bl func_0204987c
    mov r1, #0x0
    strh r1, [r0, #0x1a]
    bl func_0204987c
    ldr r0, [r0, #0x10]
    ldr r1, _LIT6
    bl func_020675c8
    bl func_0204987c
    ldr r0, [r0, #0x10]
    ldr r1, _LIT7
    bl func_020675f8
    bl func_0204987c
    ldr r0, [r0, #0x10]
    ldr r1, _LIT8
    bl func_020675e0
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_02067368
    mov r0, r6
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word func_02049fb0
_LIT1: .word func_02049fac
_LIT2: .word func_02049fa8
_LIT3: .word func_02049f00
_LIT4: .word func_02049ef8
_LIT5: .word func_02049eec
_LIT6: .word func_02049ec4
_LIT7: .word func_02049e10
_LIT8: .word func_02049cfc
