; func_02092618 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02091924
        .extern func_02092124
        .global func_02092618
        .arm
func_02092618:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x88]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    add r5, r6, #0x88
    mov r4, #0x0
.L_94:
    mov r0, r5
    bl func_02092124
    str r4, [r0, #0xc]
    str r4, [r0, #0x8]
    bl func_02091924
    ldr r0, [r6, #0x88]
    cmp r0, #0x0
    bne .L_94
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
