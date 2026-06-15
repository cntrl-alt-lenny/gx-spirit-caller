; func_ov002_021c229c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c2084
        .global func_ov002_021c229c
        .arm
func_ov002_021c229c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov lr, r0
    add r0, sp, #0x0
    mov ip, #0x0
    str ip, [r0]
    rsb r4, lr, #0x1
    ldrh r5, [sp, #0x2]
    mov r4, r4, lsl #0x10
    mov r4, r4, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bic r5, r5, #0x1
    and r4, r4, #0x1
    orr r4, r5, r4
    strh r4, [sp, #0x2]
    ldrh r4, [sp, #0x2]
    mov r5, r1
    strh r2, [sp]
    mov r3, r3, lsl #0x1b
    bic r4, r4, #0x3e
    orr r3, r4, r3, lsr #0x1a
    strh r3, [sp, #0x2]
    ldrh r3, [sp, #0x2]
    mov r1, lr
    mov r2, r5
    bic r4, r3, #0x3000
    ldr r3, [sp, #0x28]
    str ip, [r0, #0x4]
    str ip, [r0, #0x8]
    str ip, [r0, #0xc]
    str ip, [r0, #0x10]
    str ip, [r0, #0x14]
    strh r4, [sp, #0x2]
    bl func_ov002_021c2084
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
