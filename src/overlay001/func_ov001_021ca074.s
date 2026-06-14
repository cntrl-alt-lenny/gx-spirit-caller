; func_ov001_021ca074 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov001_021ca420
        .extern func_0201d5c0
        .extern func_0208c940
        .extern func_ov000_021ab4bc
        .extern func_ov001_021c9f24
        .global func_ov001_021ca074
        .arm
func_ov001_021ca074:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r0, _LIT1
    ldrh r1, [r3]
    add r2, r3, #0x1000
    and r1, r1, #0x43
    orr r1, r1, #0x84
    strh r1, [r3]
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x84
    strh r1, [r2]
    ldr r0, [r0]
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    bl func_ov001_021c9f24
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov000_021ab4bc
    mov r0, #0x1
    mov r1, r0
    bl func_ov000_021ab4bc
    mov r2, #0x4000000
    ldr r0, [r2]
    ldr r1, _LIT2
    add r3, r2, #0x1000
    and r0, r0, r1
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    ldr r2, [r3]
    mov r0, #0x4
    and r1, r2, r1
    orr r2, r1, #0x10
    orr r2, r2, #0x200000
    mov r1, #0x2
    str r2, [r3]
    bl func_0201d5c0
    mov r0, #0x9
    mov r1, #0x2
    bl func_0201d5c0
    bl func_0208c940
    ldr r2, _LIT3
    mov r0, #0x1
    ldr r1, [r2]
    orr r1, r1, #0x10000
    str r1, [r2]
    ldmia sp!, {r3, pc}
_LIT0: .word 0x04000008
_LIT1: .word data_ov001_021ca420
_LIT2: .word 0xffcfffef
_LIT3: .word 0x04001000
