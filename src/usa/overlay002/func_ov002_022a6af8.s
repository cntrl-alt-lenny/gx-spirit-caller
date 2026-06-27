; func_ov002_022a6af8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229a304
        .global func_ov002_022a6af8
        .arm
func_ov002_022a6af8:
    stmdb sp!, {r3, lr}
    ldrh ip, [sp]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic ip, ip, #0x1
    and r1, r1, #0x1
    orr r1, ip, r1
    strh r1, [sp]
    ldrh ip, [sp]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, ip, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp]
    ldrh r2, [sp]
    mov r1, r3, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0x3fc0
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x12
    strh r1, [sp]
    ldrh r3, [sp]
    add r1, r0, #0x500
    mov r2, #0x60
    orr r3, r3, #0x4000
    strh r3, [sp]
    ldrh r3, [sp]
    bic r3, r3, #0x8000
    strh r3, [sp]
    ldrh r3, [sp]
    strh r3, [r1, #0x90]
    str r2, [r0, #0x578]
    mov r0, #0x1
    bl func_ov002_0229a304
    ldmia sp!, {r3, pc}
