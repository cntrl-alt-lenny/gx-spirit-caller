; func_ov002_0222196c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021d59cc
        .extern func_ov002_021d8904
        .global func_ov002_0222196c
        .arm
func_ov002_0222196c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r1
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x5
    bcc .L_ad8
    cmp r1, #0xa
    bhi .L_ad8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr lr, _LIT0
    mov r3, #0x14
    ldr r2, _LIT1
    and ip, r0, #0x1
    mla lr, ip, r2, lr
    ldrh r2, [r4, #0x4]
    mul r3, r1, r3
    add r4, lr, #0x30
    ldr r3, [r4, r3]
    mov r4, r2, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r2, r4, lsr #0x17
    bne .L_ad8
    ldr r2, _LIT2
    mov r4, #0x0
    mov r3, #0x3
    str r4, [sp]
    bl func_ov002_021d59cc
.L_ad8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x000017c2
