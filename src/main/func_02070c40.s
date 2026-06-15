; func_02070c40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63d0
        .extern func_02070c84
        .extern func_0207475c
        .global func_02070c40
        .arm
func_02070c40:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0xa4]
    cmp r4, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrb r0, [r4, #0x9]
    cmp r0, #0x0
    beq .L_1004
    mov r0, r4
    bl func_0207475c
.L_1004:
    mov r0, r4
    bl func_02070c84
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a63d0
