; func_0203a6f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020394ec
        .extern func_02089240
        .global func_0203a6f4
        .arm
func_0203a6f4:
    stmdb sp!, {r4, lr}
    mov r0, r1
    mov r4, r2
    bl func_02089240
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0]
    mov r2, r4
    mov r1, #0x3
    bl func_020394ec
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
