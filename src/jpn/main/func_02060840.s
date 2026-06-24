; func_02060840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021012cc
        .extern data_021012d4
        .extern data_021012d8
        .extern data_021012dc
        .extern func_02060590
        .extern func_02060b10
        .extern func_02060c28
        .extern func_020acd0c
        .global func_02060840
        .arm
func_02060840:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r7, r0
    bl func_02060c28
    bl func_020acd0c
    mov r6, r0
    ldr r1, _LIT1
    mov r0, r7
    bl func_02060c28
    bl func_020acd0c
    mov r5, r0
    ldr r1, _LIT2
    mov r0, r7
    bl func_02060c28
    bl func_020acd0c
    mov r4, r0
    ldr r1, _LIT3
    mov r0, r7
    bl func_02060c28
    bl func_020acd0c
    mov r1, r4
    mov r4, r0
    mov r2, r5
    mov r0, #0x2
    bl func_02060b10
    mvn r1, #0x0
    cmp r0, r1
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r3, #0x0
    mov r1, r6
    mov r2, r4
    str r3, [sp]
    bl func_02060590
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021012cc
_LIT1: .word data_021012d4
_LIT2: .word data_021012d8
_LIT3: .word data_021012dc
