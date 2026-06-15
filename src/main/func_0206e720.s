; func_0206e720 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206e224
        .global func_0206e720
        .arm
func_0206e720:
    stmdb sp!, {r4, lr}
    mov r4, r1
    bl func_0206e224
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    mov r2, r0, lsr #0x18
    mov r1, r0, lsr #0x8
    mov r3, r0, lsl #0x8
    mov ip, r0, lsl #0x18
    and r2, r2, #0xff
    and r0, r1, #0xff00
    and r1, r3, #0xff0000
    orr r0, r2, r0
    and r2, ip, #-16777216
    orr r0, r1, r0
    orr r0, r2, r0
    str r0, [r4]
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
