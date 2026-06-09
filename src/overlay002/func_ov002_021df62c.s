; func_ov002_021df62c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_ov002_021d479c
        .global func_ov002_021df62c
        .arm
func_ov002_021df62c:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    mov ip, r2, lsl #0x2
    ldrh r3, [r3, ip]
    cmp r0, #0x0
    mov r1, r1, lsl #0x10
    mov r0, r3, lsl #0x13
    mov r3, r0, lsr #0x13
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x2e
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    mov ip, r2, lsl #0x10
    mov r2, r3, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r3, ip, lsr #0x10
    bl func_ov002_021d479c
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0250
