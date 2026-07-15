; func_02060520 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bece4
        .extern data_02101358
        .extern data_0210136c
        .extern data_0219e518
        .extern func_02054140
        .extern func_02054148
        .extern func_02060604
        .extern func_02060d8c
        .global func_02060520
        .arm
func_02060520:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x24
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x24
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_02054140
    subs r4, r0, #0x1
    bmi .L_b4
    ldr r5, _LIT1
    add r3, sp, #0x14
    mov r2, #0x8
.L_34:
    ldrb r1, [r5], #0x1
    ldrb r0, [r5], #0x1
    subs r2, r2, #0x1
    strb r1, [r3], #0x1
    strb r0, [r3], #0x1
    bne .L_34
    ldr r9, _LIT2
    ldr r5, _LIT3
    add r8, sp, #0x4
    mov r7, #0xf
    mov r6, #0x0
.L_60:
    add ip, sp, #0x14
    add r3, sp, #0x4
    mov r2, #0x8
.L_6c:
    ldrb r1, [ip], #0x1
    ldrb r0, [ip], #0x1
    subs r2, r2, #0x1
    strb r1, [r3], #0x1
    strb r0, [r3], #0x1
    bne .L_6c
    mov r0, r8
    mov r1, r7
    str r9, [r5]
    bl func_02060d8c
    mov r0, r4
    mov r1, r6
    mov r2, r6
    mov r3, r8
    str r6, [sp]
    bl func_02060604
    subs r4, r4, #0x1
    bpl .L_60
.L_b4:
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_02054148
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219e518
_LIT1: .word data_020bece4+0x78
_LIT2: .word data_0210136c
_LIT3: .word data_02101358
