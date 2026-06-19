; func_ov002_0229d184 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022d1410
        .extern func_ov002_0229d2ec
        .extern func_ov002_022a6e04
        .global func_ov002_0229d184
        .arm
func_ov002_0229d184:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x14
    mov r4, r0
    mov r3, #0x1
    strb r3, [r4]
    str r1, [r4, #0xc]
    ldrh r1, [r2]
    strh r1, [r4, #0xa]
    bl func_ov002_0229d2ec
    ldrh r1, [r4, #0xa]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    strb r1, [r4, #0x3]
    ldrh r1, [r4, #0xa]
    ldr r0, [r0, #0x4]
    ldrh r2, [r4, #0xa]
    mov r1, r1, lsl #0x1f
    eor r0, r0, #0x1
    cmp r0, r1, lsr #0x1f
    moveq r3, #0x1
    mov r2, r2, lsl #0x10
    movne r3, #0x0
    mov r2, r2, lsr #0x1f
    rsb r2, r2, r3, lsl #0x1
    mov r2, r2, lsl #0x1e
    mov r2, r2, lsr #0x1b
    strb r2, [r4, #0x2]
    ldrh r2, [r4, #0xa]
    ldr r1, _LIT1
    add r0, sp, #0x4
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x18
    str r2, [sp]
    ldrh r2, [r4, #0xa]
    mov r3, r2, lsl #0x1a
    mov ip, r2, lsl #0x1f
    mov r2, ip, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6e04
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    mov r0, #0x0
    strh r2, [r4, #0x6]
    strh r1, [r4, #0x8]
    str r2, [sp, #0xc]
    str r1, [sp, #0x10]
    str r0, [r4, #0x10]
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_ov002_022d1410
