; func_ov002_021fd668 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021fc3e8
        .global func_ov002_021fd668
        .arm
func_ov002_021fd668:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    ldr r8, _LIT0
    ldr r5, _LIT1
    and r7, r0, #0x1
    add lr, sp, #0x0
    mov ip, #0x0
    str ip, [lr]
    ldrh r3, [sp, #0x2]
    mov r4, r0, lsl #0x10
    mov r0, r4, lsr #0x10
    mov r4, r1, lsl #0x10
    mov r6, #0x14
    mla r8, r7, r5, r8
    mul r5, r1, r6
    add r1, r8, #0x30
    ldr r5, [r1, r5]
    bic r3, r3, #0x1
    and r0, r0, #0x1
    orr r0, r3, r0
    strh r0, [sp, #0x2]
    mov r4, r4, lsr #0x10
    mov r1, r5, lsl #0x2
    ldrh r6, [sp, #0x2]
    mov r0, r4, lsl #0x1b
    mov r1, r1, lsr #0x18
    bic r4, r6, #0x3e
    orr r4, r4, r0, lsr #0x1a
    mov r3, r5, lsl #0x12
    mov r0, r1, lsl #0x1
    str ip, [lr, #0x4]
    strh r4, [sp, #0x2]
    add r0, r0, r3, lsr #0x1f
    mov r0, r0, lsl #0x10
    ldrh r1, [sp, #0x2]
    mov r4, r0, lsr #0x10
    ldrh r5, [sp, #0x4]
    bic r3, r1, #0xfc0
    ldr r0, _LIT2
    str ip, [lr, #0x8]
    and r1, r5, r0
    mov r0, r4, lsl #0x17
    orr r4, r1, r0, lsr #0x11
    mov r0, lr
    mov r1, ip
    str ip, [lr, #0xc]
    str ip, [lr, #0x10]
    str ip, [lr, #0x14]
    strh r2, [sp]
    strh r4, [sp, #0x4]
    strh r3, [sp, #0x2]
    bl func_ov002_021fc3e8
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0xffff803f
