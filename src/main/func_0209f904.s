; func_0209f904 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209f8c8
        .global func_0209f904
        .arm
func_0209f904:
    stmdb sp!, {r4, lr}
    mov r4, r1
    ldrh lr, [r4, #0x2]
    cmp r0, #0x0
    mov r3, r2
    mov r1, #0x1
    mov ip, r1, lsl r3
    ldrh r1, [r4]
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ands r2, r1, ip
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ands r2, lr, ip
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r2, r4, #0x4
    bl func_0209f8c8
    ldmia sp!, {r4, lr}
    bx lr
