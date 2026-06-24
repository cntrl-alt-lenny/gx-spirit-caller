; func_020873dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02095460
        .extern func_02095c08
        .global func_020873dc
        .arm
func_020873dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bne .L_c0
    ldr r0, [r4, #0x10]
    bl func_02095460
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    mov r0, #0x1
    str r0, [r4, #0xc]
.L_c0:
    bl func_02095c08
    ldr r1, [r4]
    mov r2, #0x1
    mov r1, r2, lsl r1
    ands r0, r1, r0
    movne r0, r2
    moveq r0, #0x0
    streq r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
