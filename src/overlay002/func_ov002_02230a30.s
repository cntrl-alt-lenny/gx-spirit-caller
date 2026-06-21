; func_ov002_02230a30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_ov002_021c8470
        .extern func_ov002_021d5a08
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_02257594
        .extern func_ov002_0225764c
        .global func_ov002_02230a30
        .arm
func_ov002_02230a30:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r6, r0
    ldr r4, [r2, #0x4]
    ldr r5, [r2, #0x20]
    bl func_ov002_02257594
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_7bc
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r7, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r8, r0, #0xff
    mov r0, r6
    mov r1, r7
    mov r2, r8
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_7bc
    mov r0, r7
    mov r1, r8
    bl func_ov002_021c8470
    mov r0, r0, lsl #0x10
    mov r1, #0x4
    str r1, [sp]
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldrh r3, [r6]
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021d5a08
.L_7bc:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cd3f4
