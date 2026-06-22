; func_0201a3b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0200a250
        .extern func_0201908c
        .extern func_0201a384
        .global func_0201a3b8
        .arm
func_0201a3b8:
    stmdb sp!, {r3, r4, r5, lr}
    bl GetSystemWork
    mov r4, r0
    bl func_0201908c
    bl func_0201a384
    movs r5, r0
    beq .L_3c
    ldr r0, [r4, #0x8f8]
    mov r1, r0, lsl #0x16
    movs r1, r1, lsr #0x1f
    bne .L_3c
    orr r1, r0, #0x200
    mov r0, #0x4
    str r1, [r4, #0x8f8]
    bl func_0200a250
.L_3c:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
