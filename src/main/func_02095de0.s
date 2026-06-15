; func_02095de0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020952d0
        .extern func_020952e4
        .global func_02095de0
        .arm
func_02095de0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_020952e4
    add r0, r5, r4, lsl #0x2
    ldr r4, [r0, #0x3c]
    cmp r4, #0x0
    beq .L_a4
    cmp r4, #0x2000000
    addcc r4, r5, r4
    b .L_a8
.L_a4:
    mov r4, #0x0
.L_a8:
    bl func_020952d0
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
