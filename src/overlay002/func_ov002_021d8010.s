; func_ov002_021d8010 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern func_0202e2c8
        .extern func_ov002_021c2eac
        .extern func_ov002_021d479c
        .extern func_ov002_021e278c
        .global func_ov002_021d8010
        .arm
func_ov002_021d8010:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r1
    mov r8, r2
    mov r4, r0
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c2eac
    cmp r0, #0x0
    beq .L_40c
    ldrh r0, [r4, #0x2]
    rsb r5, r9, #0x1
    and r6, r5, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    ldr r0, _LIT0
    movne r7, #0x1
    mul r2, r6, r0
    ldr r0, [r8]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    moveq r7, #0x0
    ldr r4, [r1, r2]
    bl func_0202e2c8
    ldr r3, [r8]
    cmp r0, #0x0
    mov r1, r3, lsl #0x2
    movne r0, #0xc
    mov r1, r1, lsr #0x18
    moveq r0, #0xb
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    and r2, r9, #0x1
    add r9, r1, r3, lsr #0x1f
    mov r1, r0, lsl #0x1b
    mov r3, r7, lsl #0x10
    orr r0, r2, #0x1c
    mov r7, r9, lsl #0x16
    orr r0, r0, r7, lsr #0x10
    mov r2, r4, lsl #0x16
    orr r1, r6, r1, lsr #0x1a
    orr r1, r1, r2, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r0, #0x3f
    bl func_ov002_021d479c
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2c8
    cmp r0, #0x0
    bne .L_404
    ldr r2, [r8]
    mov r0, r5
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021e278c
.L_404:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_40c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
