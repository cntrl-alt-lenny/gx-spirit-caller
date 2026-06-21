; func_ov002_0222d1a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b99b4
        .extern func_ov002_021d7268
        .extern func_ov002_0223def4
        .global func_ov002_0222d1a0
        .arm
func_ov002_0222d1a0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r1, [r5, #0x6]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x18
    cmp r1, #0x1
    bne .L_378
    mov r1, #0x0
    bl func_ov002_0223def4
    ldrh r2, [r5, #0x2]
    mov r4, r0
    mov r1, r4
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b99b4
    cmp r0, #0x0
    blt .L_378
    ldrh r1, [r5]
    ldr r0, _LIT0
    cmp r1, r0
    ldrh r0, [r5, #0x2]
    bne .L_364
    mov r0, r0, lsl #0x1f
    mov r1, r4
    mov r2, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d7268
    b .L_378
.L_364:
    mov r0, r0, lsl #0x1f
    mov r1, r4
    mov r2, #0x1
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d7268
.L_378:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000016d5
