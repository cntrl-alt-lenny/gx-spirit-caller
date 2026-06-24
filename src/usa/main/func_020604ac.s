; func_020604ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bec68
        .extern data_02101278
        .extern data_0210128c
        .extern data_0219e438
        .extern func_020540cc
        .extern func_020540d4
        .extern func_02060590
        .extern func_02060d18
        .global func_020604ac
        .arm
func_020604ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x24
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x24
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_020540cc
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
    bl func_02060d18
    mov r0, r4
    mov r1, r6
    mov r2, r6
    mov r3, r8
    str r6, [sp]
    bl func_02060590
    subs r4, r4, #0x1
    bpl .L_60
.L_b4:
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_020540d4
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219e438
_LIT1: .word data_020bec68
_LIT2: .word data_0210128c
_LIT3: .word data_02101278
