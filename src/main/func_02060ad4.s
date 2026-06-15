; func_02060ad4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021013b8
        .extern data_021013e4
        .extern data_021013ec
        .extern data_0219e518
        .extern func_020540d0
        .extern func_02060604
        .extern func_02060b84
        .extern func_02060c9c
        .extern func_020ace00
        .global func_02060ad4
        .arm
func_02060ad4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r6, r0
    bl func_02060c9c
    bl func_020ace00
    mov r5, r0
    ldr r1, _LIT1
    mov r0, r6
    bl func_02060c9c
    bl func_020ace00
    mov r4, r0
    ldr r1, _LIT2
    mov r0, r6
    bl func_02060c9c
    mov r1, r4
    mov r4, r0
    mov r0, #0x0
    mov r2, r0
    bl func_02060b84
    mov r6, r0
    mvn r0, #0x0
    cmp r6, r0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    mov r1, r6
    ldr r0, [r0]
    bl func_020540d0
    cmp r5, #0x0
    movgt r1, #0x1
    str r5, [r0, #0x8]
    mov r2, #0x0
    movle r1, #0x0
    mov r0, r6
    mov r3, r4
    str r2, [sp]
    bl func_02060604
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021013e4
_LIT1: .word data_021013b8
_LIT2: .word data_021013ec
_LIT3: .word data_0219e518
