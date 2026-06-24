; func_0206a9bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020540d4
        .extern func_02068b44
        .extern func_0206a9f4
        .extern func_0206b51c
        .global func_0206a9bc
        .arm
func_0206a9bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0206a9f4
    mov r0, r4
    bl func_0206b51c
    mov r0, r4
    bl func_02068b44
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_d8
    bl func_020540d4
.L_d8:
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
