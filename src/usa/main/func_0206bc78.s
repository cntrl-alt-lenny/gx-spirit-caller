; func_0206bc78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d9c
        .extern data_0219ebf8
        .extern data_0219ec08
        .extern func_0206c000
        .extern func_0206c3f8
        .global func_0206bc78
        .arm
func_0206bc78:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x20]
    bl func_0206c000
    movs r4, r0
    bmi .L_22c
    ldr r0, _LIT1
    bl func_0206c3f8
    ldr r1, _LIT2
    str r0, [r1]
.L_22c:
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219ebf8
_LIT1: .word data_02101d9c
_LIT2: .word data_0219ec08
