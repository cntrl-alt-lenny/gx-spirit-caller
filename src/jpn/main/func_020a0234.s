; func_020a0234 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209e6fc
        .global func_020a0234
        .arm
func_020a0234:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x6
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r0, r4, #0x800
    ldrh r1, [r0, #0xe]
    cmp r1, #0x0
    moveq r0, #0x3
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrh r0, [r0, #0x16]
    mov r1, #0x0
    mov r2, r1
    bl func_0209e6fc
    add r1, r4, #0x800
    mov r0, #0x0
    strh r0, [r1, #0xe]
    strh r0, [r1, #0x1c]
    ldmia sp!, {r4, lr}
    bx lr
