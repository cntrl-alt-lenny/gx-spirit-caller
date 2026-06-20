; func_ov002_02237618 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e234
        .extern func_ov002_021ca5bc
        .extern func_ov002_021df818
        .extern func_ov002_021e13f4
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .global func_ov002_02237618
        .arm
func_ov002_02237618:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    bl func_ov002_021e2b3c
    ldrh r0, [r8, #0x2]
    mov r1, #0x3
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e13f4
    mov r6, #0x0
    mov r5, r6
    mov r7, r6
    mov sl, #0x3
    ldr r4, _LIT0
    ldr r9, _LIT1
    b .L_a0
.L_40:
    add r0, r2, r7
    ldr r0, [r0, #0x260]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    bne .L_98
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mla r1, r0, r9, r4
    add r0, r1, #0x260
    ldr r1, [r0, r7]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_98:
    add r7, r7, #0x4
    add r5, r5, #0x1
.L_a0:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    and r0, r1, #0x1
    mla r2, r0, r9, r4
    ldr r0, [r2, #0x10]
    cmp r0, #0x3
    movcs r0, sl
    cmp r5, r0
    bcc .L_40
    mov r0, #0x3e8
    mul r2, r6, r0
    mov r0, r8
    bl func_ov002_021df818
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
