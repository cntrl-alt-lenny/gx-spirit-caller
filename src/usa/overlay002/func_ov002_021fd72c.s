; func_ov002_021fd72c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021fd180
        .global func_ov002_021fd72c
        .arm
func_ov002_021fd72c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    add r6, sp, #0x0
    mov r5, #0x0
    str r5, [r6]
    ldrh r4, [sp, #0x2]
    and r3, r0, #-2147483648
    mov r3, r3, lsr #0x1f
    bic r4, r4, #0x1
    and r3, r3, #0x1
    orr r3, r4, r3
    strh r3, [sp, #0x2]
    and r3, r0, #0x1000000
    mov r3, r3, lsr #0x18
    ldrh r4, [sp, #0x2]
    mov r3, r3, lsl #0x10
    mov lr, r3, lsr #0x10
    bic r7, r4, #0x4000
    mov r4, lr, lsl #0x1f
    orr r4, r7, r4, lsr #0x11
    strh r4, [sp, #0x2]
    and r3, r0, #0xe00000
    mov r3, r3, lsr #0x15
    ldrh lr, [sp, #0x2]
    mov r3, r3, lsl #0x10
    mov ip, r3, lsr #0x10
    and r3, r0, #0x1f0000
    and r4, r0, #0x7e000000
    strh r0, [sp]
    mov r3, r3, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r4, r4, lsr #0x19
    mov r4, r4, lsl #0x10
    mov r4, r4, lsr #0x10
    str r5, [r6, #0x14]
    bic lr, lr, #0x3000
    mov r0, ip, lsl #0x1e
    orr r0, lr, r0, lsr #0x12
    strh r0, [sp, #0x2]
    ldrh ip, [sp, #0x2]
    mov r3, r3, lsr #0x10
    mov r0, r3, lsl #0x1b
    bic ip, ip, #0x3e
    orr r0, ip, r0, lsr #0x1a
    strh r0, [sp, #0x2]
    str r5, [r6, #0x4]
    ldrh ip, [sp, #0x2]
    ldrh r3, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x17
    and r0, r3, r0
    orr r3, r0, r1, lsr #0x11
    mov r4, r4, lsl #0x1a
    bic ip, ip, #0xfc0
    orr r4, ip, r4, lsr #0x14
    mov r0, r6
    mov r1, r5
    str r5, [r6, #0x8]
    str r5, [r6, #0xc]
    str r5, [r6, #0x10]
    strh r4, [sp, #0x2]
    strh r3, [sp, #0x4]
    str r2, [sp, #0x14]
    bl func_ov002_021fd180
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0xffff803f
