; func_ov002_021c2850 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c93f0
        .extern func_ov002_021fca38
        .global func_ov002_021c2850
        .arm
func_ov002_021c2850:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r4, r1
    cmp r4, #0x4
    mov r5, r0
    addle sp, sp, #0x18
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c93f0
    mov r3, r5, lsl #0x10
    mov r3, r3, lsr #0x10
    add r2, sp, #0x0
    mov r1, #0x0
    str r1, [r2]
    ldrh ip, [sp, #0x2]
    and r3, r3, #0x1
    str r1, [r2, #0x4]
    bic ip, ip, #0x1
    orr r3, ip, r3
    strh r3, [sp, #0x2]
    mov r3, r4, lsl #0x10
    ldrh ip, [sp, #0x2]
    mov r3, r3, lsr #0x10
    mov r3, r3, lsl #0x1b
    bic r4, ip, #0x3e
    orr r3, r4, r3, lsr #0x1a
    str r1, [r2, #0x8]
    str r1, [r2, #0xc]
    str r1, [r2, #0x10]
    str r1, [r2, #0x14]
    strh r3, [sp, #0x2]
    ldr r3, [r0]
    ldrh r1, [sp, #0x2]
    mov r3, r3, lsl #0x13
    mov r3, r3, lsr #0x13
    strh r3, [sp]
    ldr r3, [r0]
    bic r1, r1, #0x3000
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    ldrh r4, [sp, #0x4]
    ldr r0, _LIT0
    mov r3, r3, lsl #0x17
    and r0, r4, r0
    orr r3, r0, r3, lsr #0x11
    mov r0, r2
    strh r3, [sp, #0x4]
    strh r1, [sp, #0x2]
    bl func_ov002_021fca38
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0xffff803f
