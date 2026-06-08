; func_ov002_0225753c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02257464
        .global func_ov002_0225753c
        .arm
func_ov002_0225753c:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x18
    add r3, sp, #0x0
    mov r2, #0x0
    str r2, [r3]
    ldrh r1, [sp, #0x2]
    strh r0, [sp]
    mov r0, r3
    bic r1, r1, #0x3000
    orr r1, r1, #0x3000
    str r2, [r3, #0x4]
    str r2, [r3, #0x8]
    str r2, [r3, #0xc]
    str r2, [r3, #0x10]
    str r2, [r3, #0x14]
    strh r1, [sp, #0x2]
    bl func_ov002_02257464
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r3, pc}
