; func_ov002_02220250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d6718
        .extern func_ov002_021e2ca4
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02220250
        .arm
func_ov002_02220250:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r1, #0x0
    mov r2, r1
    mov r4, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_1508
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_1508
    ldrh r1, [r4]
    ldr r0, _LIT0
    cmp r1, r0
    bne .L_14f0
    mov r0, r5
    mov r1, r6
    mov r2, #0x15
    mov r3, #0x1
    bl func_ov002_021e2ca4
.L_14f0:
    mov r3, #0x0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    str r3, [sp]
    bl func_ov002_021d6718
.L_1508:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00001485
