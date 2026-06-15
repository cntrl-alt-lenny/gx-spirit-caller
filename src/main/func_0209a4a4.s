; func_0209a4a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8390
        .extern data_021a8394
        .extern func_02096228
        .extern func_0209640c
        .extern func_02096434
        .extern func_0209a534
        .global func_0209a4a4
        .arm
func_0209a4a4:
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
    ldr r0, _LIT1
    mov r1, #0x0
    strh r1, [r0, #0x32]
    strh r1, [r0, #0x36]
    strh r1, [r0, #0xc]
    str r1, [r0]
    str r1, [r0, #0x10]
    strh r1, [r0, #0x30]
    strh r1, [r0, #0x34]
    mov r5, #0x6
    mov r4, #0x1
.L_4fc:
    mov r0, r5
    mov r1, r4
    bl func_0209640c
    cmp r0, #0x0
    beq .L_4fc
    ldr r1, _LIT2
    mov r0, #0x6
    bl func_02096434
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a8390
_LIT1: .word data_021a8394
_LIT2: .word func_0209a534
