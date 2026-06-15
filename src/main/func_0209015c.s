; func_0209015c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210249c
        .extern data_021a633c
        .extern data_021a6348
        .extern data_021a634c
        .extern data_021a6350
        .extern func_0208d4f0
        .extern func_02093dc8
        .global func_0209015c
        .arm
func_0209015c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_df0
    bl func_02093dc8
.L_df0:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0208d4f0
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
_LIT0: .word data_0210249c
_LIT1: .word data_021a6348
_LIT2: .word data_021a6350
_LIT3: .word data_021a634c
_LIT4: .word data_021a633c
