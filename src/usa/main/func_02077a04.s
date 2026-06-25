; func_02077a04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101dec
        .extern data_021a62f0
        .extern func_0209172c
        .extern func_02091734
        .global func_02077a04
        .arm
func_02077a04:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x20
    addcs sp, sp, #0x4
    mvncs r0, #0x0
    ldmcsia sp!, {r4, r5, lr}
    bxcs lr
    ldr r0, _LIT1
    ldr r5, [r0, #0x4]
    mov r0, r5
    bl func_0209172c
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    mov r0, r5
    bl func_02091734
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_02101dec
_LIT1: .word data_021a62f0
