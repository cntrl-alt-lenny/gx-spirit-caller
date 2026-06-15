; func_0201a4dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_020190ec
        .extern func_02019124
        .global func_0201a4dc
        .arm
func_0201a4dc:
    stmdb sp!, {r4, lr}
    bl GetSystemWork
    mov r4, r0
    bl func_020190ec
    cmp r0, #0x0
    beq .L_70
    bl func_020139b4
    cmp r0, #0x2
    bge .L_80
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_70:
    bl func_02019124
    cmp r0, #0xa8
    movlt r0, #0x2
    ldmltia sp!, {r4, pc}
.L_80:
    ldr r0, [r4, #0x900]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    movne r0, #0x3
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
