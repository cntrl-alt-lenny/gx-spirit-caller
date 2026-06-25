; func_02060358 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101234
        .extern data_0210123c
        .extern data_02101244
        .extern data_02101250
        .extern func_02058560
        .extern func_02060250
        .extern func_020aaf60
        .extern func_020aafd0
        .extern func_020acd0c
        .global func_02060358
        .arm
func_02060358:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r6, r1
    mov r7, r0
    mov r5, r2
    ldr r1, _LIT0
    mov r0, r6
    mov r2, #0x7
    ldr r4, [r7]
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_488
    ldr r1, _LIT1
    add r2, sp, #0x0
    mov r0, r6
    mov r3, #0x10
    bl func_02060250
    cmp r0, #0x0
    beq .L_424
    add r0, sp, #0x0
    bl func_020acd0c
    str r0, [r4, #0x418]
.L_424:
    ldr r1, _LIT2
    mov r0, r6
    mov r2, r4
    mov r3, #0x100
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [r4]
    cmp r5, #0x0
    beq .L_47c
    ldr r1, _LIT3
    mov r0, r6
    bl func_020aafd0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r7
    mov r1, #0x4
    bl func_02058560
.L_47c:
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_488:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101234
_LIT1: .word data_0210123c
_LIT2: .word data_02101244
_LIT3: .word data_02101250
