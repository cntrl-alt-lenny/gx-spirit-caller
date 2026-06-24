; func_02060a60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021012d8
        .extern data_02101304
        .extern data_0210130c
        .extern data_0219e438
        .extern func_0205405c
        .extern func_02060590
        .extern func_02060b10
        .extern func_02060c28
        .extern func_020acd0c
        .global func_02060a60
        .arm
func_02060a60:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r6, r0
    bl func_02060c28
    bl func_020acd0c
    mov r5, r0
    ldr r1, _LIT1
    mov r0, r6
    bl func_02060c28
    bl func_020acd0c
    mov r4, r0
    ldr r1, _LIT2
    mov r0, r6
    bl func_02060c28
    mov r1, r4
    mov r4, r0
    mov r0, #0x0
    mov r2, r0
    bl func_02060b10
    mov r6, r0
    mvn r0, #0x0
    cmp r6, r0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    mov r1, r6
    ldr r0, [r0]
    bl func_0205405c
    cmp r5, #0x0
    movgt r1, #0x1
    str r5, [r0, #0x8]
    mov r2, #0x0
    movle r1, #0x0
    mov r0, r6
    mov r3, r4
    str r2, [sp]
    bl func_02060590
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02101304
_LIT1: .word data_021012d8
_LIT2: .word data_0210130c
_LIT3: .word data_0219e438
