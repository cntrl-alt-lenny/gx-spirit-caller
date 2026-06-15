; func_0203a694 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203953c
        .extern func_0203a5d4
        .extern func_020892c4
        .global func_0203a694
        .arm
func_0203a694:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r0, r5
    mov r4, r2
    bl func_020892c4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r0]
    mov r2, r4
    mov r1, #0x1
    bl func_0203953c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0203a5d4
    ldmia sp!, {r4, r5, r6, pc}
