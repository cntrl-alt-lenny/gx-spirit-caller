; func_ov002_02234a5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021b3dec
        .extern func_ov002_021e267c
        .extern func_ov002_022289ac
        .global func_ov002_02234a5c
        .arm
func_ov002_02234a5c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r0, [r2, #0x5a8]
    mov r5, r1
    cmp r0, #0x80
    bne .L_258
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT1
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e267c
.L_258:
    mov r0, r4
    mov r1, r5
    bl func_ov002_022289ac
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x000014c4
