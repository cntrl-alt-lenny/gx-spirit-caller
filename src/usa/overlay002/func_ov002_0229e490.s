; func_ov002_0229e490 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c97ac
        .global func_ov002_0229e490
        .arm
func_ov002_0229e490:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r2
    mov r6, r1
    mov r4, r0
    mov r2, #0x0
    mov r0, r6
    mov r1, r5
    strh r2, [r4, #0x2a]
    bl func_ov002_021c97ac
    ldrh r3, [sp]
    mov r1, r6, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp]
    ldrh r2, [sp]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp]
    ldrh r2, [sp]
    mov r1, r0, lsl #0x1f
    mov r0, #0x0
    bic r2, r2, #0x3fc0
    strh r2, [sp]
    ldrh r2, [sp]
    bic r2, r2, #0x4000
    orr r1, r2, r1, lsr #0x11
    strh r1, [sp]
    ldrh r1, [sp]
    bic r1, r1, #0x8000
    strh r1, [sp]
    ldrh r1, [sp]
    strh r1, [r4, #0x28]
    strb r0, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
