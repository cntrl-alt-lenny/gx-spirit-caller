; func_02039990 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02089024
        .extern func_0209614c
        .global func_02039990
        .arm
func_02039990:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0]
    mov r5, r1
    bl func_02089024
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5]
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x8
    bl func_02089024
    movs r2, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, #0x0
    bl func_0209614c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
