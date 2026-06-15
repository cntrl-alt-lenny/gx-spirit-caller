; func_0201a498 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0200a26c
        .extern func_020190c0
        .extern func_0201a454
        .global func_0201a498
        .arm
func_0201a498:
    stmdb sp!, {r3, r4, r5, lr}
    bl GetSystemWork
    mov r4, r0
    bl func_020190c0
    bl func_0201a454
    movs r5, r0
    beq .L_3c
    ldr r0, [r4, #0x8f8]
    mov r1, r0, lsl #0x15
    movs r1, r1, lsr #0x1f
    bne .L_3c
    orr r1, r0, #0x400
    mov r0, #0x5
    str r1, [r4, #0x8f8]
    bl func_0200a26c
.L_3c:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
