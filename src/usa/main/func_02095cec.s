; func_02095cec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020951dc
        .extern func_020951f0
        .global func_02095cec
        .arm
func_02095cec:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_020951f0
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
    bl func_020951dc
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
