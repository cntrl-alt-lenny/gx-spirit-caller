; func_02093a0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a65e8
        .extern func_02092fb8
        .global func_02093a0c
        .arm
func_02093a0c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldrh r7, [r1]
    add r4, r2, #0x80
    mov r6, r0
    add r5, r4, #0x74
    bl func_02092fb8
    orr r0, r0, r7, lsl #0x10
    str r0, [r6]
    ldr r1, _LIT2
    ldr r0, _LIT1
    ldr r3, [r1]
    ldrh r5, [r5, #0x4]
    ldr r2, [r1, #0x4]
    ldr r2, _LIT3
    eor r3, r3, r5, lsl #0x10
    str r3, [r6, #0x4]
    ldr r3, [r1]
    ldr r3, [r1, #0x4]
    ldr r1, [r4, #0x74]
    ldr r4, [r0, #0x3c]
    eor r1, r3, r1
    eor r1, r4, r1
    str r1, [r6, #0x8]
    ldr r3, [r6, #0x8]
    ldr r2, [r2]
    add r1, r0, #0x300
    eor r2, r3, r2
    str r2, [r6, #0x8]
    ldr r2, [r0, #0x1e8]
    ldr r3, _LIT4
    str r2, [r6, #0xc]
    ldr r4, [r0, #0x1ec]
    ldr r2, _LIT5
    str r4, [r6, #0x10]
    ldrh r4, [r1, #0x94]
    ldr r0, [r0, #0x390]
    eor r0, r0, r4, lsl #0x10
    str r0, [r6, #0x14]
    ldrh r4, [r1, #0xaa]
    ldrh r0, [r1, #0xac]
    orr r0, r0, r4, lsl #0x10
    str r0, [r6, #0x18]
    ldrh r3, [r3]
    ldrh r0, [r2]
    ldrh r1, [r1, #0x98]
    orr r0, r3, r0
    orr r0, r0, r1, lsl #0x10
    str r0, [r6, #0x1c]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x04000006
_LIT1: .word 0x027ffc00
_LIT2: .word data_021a65e8
_LIT3: .word 0x04000600
_LIT4: .word 0x04000130
_LIT5: .word 0x027fffa8
