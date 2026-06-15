; func_02096060 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928e8
        .extern func_020952d0
        .extern func_020952e4
        .global func_02096060
        .arm
func_02096060:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl func_020952e4
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_40
    mov r5, #0x0
    mov r4, #0x8
.L_20:
    ldr r6, [r0, #0x4]
    mov r1, r4
    str r5, [r0]
    str r5, [r0, #0x4]
    bl func_020928e8
    mov r0, r6
    cmp r6, #0x0
    bne .L_20
.L_40:
    bl func_020952d0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
