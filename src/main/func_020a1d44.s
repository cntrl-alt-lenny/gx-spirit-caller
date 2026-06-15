; func_020a1d44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98fc
        .extern func_020a099c
        .global func_020a1d44
        .arm
func_020a1d44:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    beq .L_13c8
    bl func_020a099c
    cmp r0, #0x0
    beq .L_13c8
    ldr r0, _LIT0
    sub r1, r4, #0x1
    ldr r0, [r0]
    add r0, r0, r1, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x4e8]
    cmp r0, #0x7
    moveq r0, #0x1
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_13c8:
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a98fc
