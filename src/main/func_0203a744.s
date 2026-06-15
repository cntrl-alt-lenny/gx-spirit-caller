; func_0203a744 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203953c
        .extern func_02089328
        .global func_0203a744
        .arm
func_0203a744:
    stmdb sp!, {r4, lr}
    mov r0, r1
    mov r4, r2
    bl func_02089328
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0]
    mov r2, r4
    mov r1, #0x3
    bl func_0203953c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
