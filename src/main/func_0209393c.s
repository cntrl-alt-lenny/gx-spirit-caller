; func_0209393c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a66f0
        .extern func_020938f8
        .extern func_02096228
        .extern func_0209640c
        .extern func_02096434
        .global func_0209393c
        .arm
func_0209393c:
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
    bl func_02096228
    mov r5, #0xc
    mov r4, #0x1
.L_128:
    mov r0, r5
    mov r1, r4
    bl func_0209640c
    cmp r0, #0x0
    beq .L_128
    ldr r1, _LIT1
    mov r0, #0xc
    bl func_02096434
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a66f0
_LIT1: .word func_020938f8
