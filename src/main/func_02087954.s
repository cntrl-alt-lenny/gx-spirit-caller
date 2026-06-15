; func_02087954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020875e0
        .extern func_02087790
        .extern func_0208b0a4
        .global func_02087954
        .arm
func_02087954:
    stmdb sp!, {r4, lr}
    movs r4, r0
    mov r2, r1
    ldmeqia sp!, {r4, pc}
    ldrb r1, [r4, #0x2c]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r2, #0x0
    bne .L_3a0
    bl func_02087790
    ldmia sp!, {r4, pc}
.L_3a0:
    add r0, r4, #0x1c
    mov r1, #0x0
    bl func_0208b0a4
    mov r0, r4
    mov r1, #0x0
    bl func_020875e0
    mov r0, #0x2
    strb r0, [r4, #0x2c]
    ldmia sp!, {r4, pc}
