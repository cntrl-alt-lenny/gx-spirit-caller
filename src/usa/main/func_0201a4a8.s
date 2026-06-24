; func_0201a4a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013980
        .extern func_020190b8
        .extern func_020190f0
        .global func_0201a4a8
        .arm
func_0201a4a8:
    stmdb sp!, {r4, lr}
    bl GetSystemWork
    mov r4, r0
    bl func_020190b8
    cmp r0, #0x0
    beq .L_2c
    bl func_02013980
    cmp r0, #0x2
    bge .L_3c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2c:
    bl func_020190f0
    cmp r0, #0xa8
    movlt r0, #0x2
    ldmltia sp!, {r4, pc}
.L_3c:
    ldr r0, [r4, #0x900]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    movne r0, #0x3
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
