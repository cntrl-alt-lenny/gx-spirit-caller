; func_02082e7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084d24
        .global func_02082e7c
        .arm
func_02082e7c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r2, [r4, #0x8]
    ands r0, r2, #0x100
    bne .L_704
    ands r0, r2, #0x200
    bne .L_704
    cmp r1, #0x0
    ldreq r0, [r4, #0xe0]
    add r1, sp, #0x0
    streq r0, [sp, #0x8]
    streq r0, [sp, #0x4]
    streq r0, [sp]
    ldrne r0, [r4, #0xe4]
    mov r2, #0x3
    strne r0, [sp, #0x8]
    strne r0, [sp, #0x4]
    strne r0, [sp]
    mov r0, #0x1b
    bl func_02084d24
.L_704:
    ldr r0, [r4]
    add r0, r0, #0x1
    str r0, [r4]
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
