; func_020609c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021012d8
        .extern data_021012f8
        .extern data_0219e438
        .extern func_0205405c
        .extern func_02060590
        .extern func_02060b10
        .extern func_02060c28
        .extern func_020acd0c
        .global func_020609c8
        .arm
func_020609c8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r5, r0
    bl func_02060c28
    bl func_020acd0c
    mov r4, r0
    ldr r1, _LIT1
    mov r0, r5
    bl func_02060c28
    bl func_020acd0c
    mov r1, r0
    mov r0, #0x3
    mov r2, #0x0
    bl func_02060b10
    mov r5, r0
    mvn r0, #0x0
    cmp r5, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, _LIT2
    mov r1, r5
    ldr r0, [r0]
    bl func_0205405c
    cmp r4, #0x0
    movgt r1, #0x1
    mov r2, #0x0
    str r4, [r0, #0x8]
    movle r1, #0x0
    mov r0, r5
    mov r3, r2
    str r2, [sp]
    bl func_02060590
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021012f8+0x4
_LIT1: .word data_021012d8
_LIT2: .word data_0219e438
