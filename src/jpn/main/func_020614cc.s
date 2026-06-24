; func_020614cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045398
        .global func_020614cc
        .arm
func_020614cc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl func_02045398
    str r0, [r5]
    ldr r0, [r5]
    cmp r0, #0x0
    moveq r0, #0x0
    strne r4, [r5, #0x4]
    movne r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
