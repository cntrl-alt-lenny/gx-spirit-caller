; func_ov002_021d7178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202e274
        .extern func_ov002_021b98d4
        .extern func_ov002_021d46ac
        .extern func_ov002_02244efc
        .global func_ov002_021d7178
        .arm
func_ov002_021d7178:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov002_021b98d4
    cmp r0, #0x0
    blt .L_98
    ldr r0, _LIT0
    mov r1, r5, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e274
    cmp r0, #0x0
    movne r0, #0xc
    moveq r0, #0xd
    cmp r4, #0x0
    moveq r1, #0x1
    and r3, r6, #0x1
    mov r0, r0, lsl #0x1b
    movne r1, #0x0
    orr r0, r3, r0, lsr #0x1a
    orr r0, r0, r1, lsl #0x6
    mov r2, r0, lsl #0x10
    orr r0, r3, #0x1c
    mov r1, r5, lsl #0x16
    orr r0, r0, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r0, #0x3f
    mov r3, #0x0
    bl func_ov002_021d46ac
    mov r0, #0x24
    mov r1, #0x0
    bl func_ov002_02244efc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_98:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d0170
