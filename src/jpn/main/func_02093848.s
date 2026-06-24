; func_02093848 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6610
        .extern func_02093804
        .extern func_02096134
        .extern func_02096318
        .extern func_02096340
        .global func_02093848
        .arm
func_02093848:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldrh r1, [r0]
    cmp r1, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    mov r1, #0x1
    strh r1, [r0]
    bl func_02096134
    mov r5, #0xc
    mov r4, #0x1
.L_34:
    mov r0, r5
    mov r1, r4
    bl func_02096318
    cmp r0, #0x0
    beq .L_34
    ldr r1, _LIT1
    mov r0, #0xc
    bl func_02096340
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a6610
_LIT1: .word func_02093804
