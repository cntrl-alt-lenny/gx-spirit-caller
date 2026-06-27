; func_ov002_02233c3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4538
        .extern func_ov002_021d5918
        .extern func_ov002_021de318
        .extern func_ov002_021e99d4
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_02257668
        .global func_ov002_02233c3c
        .arm
func_ov002_02233c3c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r6, r0
    bl func_ov002_02257668
    mov r1, r0
    mov r0, r6
    bl func_ov002_021de318
    mov r1, #0x0
    mov r7, r0
    mov r0, r6
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_a24
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_a24
    mov r0, r7
    bl func_ov002_021b4538
    mov r1, #0x3e8
    mul r1, r0, r1
    mov r0, r1, lsl #0x10
    mov r1, #0x3
    str r1, [sp]
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldrh r3, [r6]
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021d5918
.L_a24:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word func_ov002_021e99d4
