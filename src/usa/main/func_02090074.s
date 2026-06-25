; func_02090074 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023bc
        .extern data_021a625c
        .extern data_021a6268
        .extern data_021a626c
        .extern data_021a6270
        .extern func_0208d408
        .extern func_02093cd4
        .global func_02090074
        .arm
func_02090074:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_20
    bl func_02093cd4
.L_20:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0208d408
    ldr r3, _LIT2
    mov ip, #0x0
    ldr r2, _LIT3
    ldr r1, _LIT4
    ldr r0, _LIT1
    str ip, [r3]
    str ip, [r2]
    str ip, [r1]
    str ip, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021023bc
_LIT1: .word data_021a6268
_LIT2: .word data_021a6270
_LIT3: .word data_021a626c
_LIT4: .word data_021a625c
