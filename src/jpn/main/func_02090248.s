; func_02090248 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c30a4
        .extern data_020c30a6
        .extern data_020c30a8
        .extern data_021a625c
        .extern data_021a6268
        .extern data_021a626c
        .extern data_021a6270
        .extern func_0208ce00
        .global func_02090248
        .arm
func_02090248:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_0208ce00
    mov r1, #0x6
    mul ip, r0, r1
    ldr r3, _LIT0
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldrh r5, [r3, ip]
    ldrh r4, [r2, ip]
    ldrh lr, [r1, ip]
    ldr ip, _LIT3
    ldr r3, _LIT4
    mov r5, r5, lsl #0xc
    ldr r2, _LIT5
    mov r4, r4, lsl #0xc
    ldr r1, _LIT6
    mov lr, lr, lsl #0xc
    str r0, [ip]
    str r5, [r3]
    str r4, [r2]
    str lr, [r1]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_020c30a4
_LIT1: .word data_020c30a6
_LIT2: .word data_020c30a8
_LIT3: .word data_021a6268
_LIT4: .word data_021a625c
_LIT5: .word data_021a626c
_LIT6: .word data_021a6270
