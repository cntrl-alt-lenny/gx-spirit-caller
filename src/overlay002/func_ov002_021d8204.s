; func_ov002_021d8204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202e2c8
        .extern func_ov002_021b9a30
        .extern func_ov002_021d479c
        .global func_ov002_021d8204
        .arm
func_ov002_021d8204:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov002_021b9a30
    cmp r0, #0x0
    blt .L_78
    ldr r0, _LIT0
    mov r1, r4, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2c8
    cmp r0, #0x0
    movne r0, #0xc
    moveq r0, #0xd
    and r3, r5, #0x1
    mov r0, r0, lsl #0x1b
    orr r0, r3, r0, lsr #0x1a
    mov r2, r0, lsl #0x10
    orr r0, r3, #0x1e
    mov r1, r4, lsl #0x16
    orr r0, r0, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r0, #0x3f
    mov r3, #0x0
    bl func_ov002_021d479c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_78:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0250
