; func_020608e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021012d4
        .extern data_021012d8
        .extern data_021012dc
        .extern data_021012e0
        .extern data_021012e8
        .extern data_021012f0
        .extern data_021012f8
        .extern func_02060590
        .extern func_02060b10
        .extern func_02060c28
        .extern func_020aafd0
        .extern func_020acd0c
        .global func_020608e4
        .arm
func_020608e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r4, r0
    bl func_02060c28
    bl func_020acd0c
    mov r7, r0
    ldr r1, _LIT1
    mov r0, r4
    bl func_02060c28
    bl func_020acd0c
    mov r6, r0
    ldr r1, _LIT2
    mov r0, r4
    bl func_02060c28
    bl func_020acd0c
    mov r5, r0
    ldr r1, _LIT3
    mov r0, r4
    bl func_02060c28
    bl func_020acd0c
    mov r2, r5
    mov r5, r0
    mov r1, r6
    mov r0, #0x1
    bl func_02060b10
    mov r8, r0
    mvn r0, #0x0
    cmp r8, r0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT4
    mov r0, r4
    bl func_02060c28
    bl func_020acd0c
    mov r6, r0
    ldr r1, _LIT5
    mov r0, r4
    bl func_020aafd0
    cmp r0, #0x0
    ldreq r3, _LIT6
    moveq r6, #0x0
    addne r3, r0, #0x6
    mov r0, r8
    mov r1, r7
    mov r2, r5
    str r6, [sp]
    bl func_02060590
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021012e0
_LIT1: .word data_021012d8
_LIT2: .word data_021012d4
_LIT3: .word data_021012dc
_LIT4: .word data_021012e8
_LIT5: .word data_021012f0
_LIT6: .word data_021012f8
