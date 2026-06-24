; func_0209dbc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8c50
        .extern func_02092484
        .extern func_02092800
        .extern func_02094688
        .extern func_02096264
        .extern func_0209dcf4
        .global func_0209dbc4
        .arm
func_0209dbc4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r1
    bl func_0209dcf4
    movs r5, r0
    moveq r0, #0x8
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02094688
    mov r0, r5
    mov r1, r4
    bl func_02092800
    mov r1, r5
    mov r0, #0xa
    mov r2, #0x0
    bl func_02096264
    mov r4, r0
    ldr r0, _LIT0
    mov r1, r5
    mov r2, #0x1
    bl func_02092484
    cmp r4, #0x0
    movlt r0, #0x8
    movge r0, #0x2
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a8c50
