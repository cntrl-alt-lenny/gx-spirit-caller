; func_ov002_0222f1c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d58dc
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_0222f1c0
        .arm
func_ov002_0222f1c0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    add r2, sp, #0x4
    mov r1, #0x0
    mov r6, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_2b8
    ldr r2, [sp, #0x4]
    mov r0, r6
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_2b8
    ldrh r2, [r6]
    ldr r0, _LIT0
    mov r1, #0x0
    cmp r2, r0
    ldreqh r0, [r6, #0x2]
    mov r3, #0x1
    moveq r0, r0, lsl #0x1f
    moveq r1, r0, lsr #0x1f
    mov r0, r1, lsl #0x10
    mov r6, r0, lsr #0x10
    mov r0, r4
    mov r1, r5
    str r6, [sp]
    bl func_ov002_021d58dc
.L_2b8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001a0b
