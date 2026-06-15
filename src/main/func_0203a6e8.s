; func_0203a6e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203953c
        .extern func_0203a694
        .extern func_0208938c
        .global func_0203a6e8
        .arm
func_0203a6e8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r0, r1
    mov r5, r2
    bl func_0208938c
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r4]
    mov r2, r5
    mov r1, #0x0
    bl func_0203953c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r4, #0x4]
    mov r0, r6
    mov r2, r5
    bl func_0203a694
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
