; func_ov002_022296f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c83e4
        .extern func_ov002_021d58dc
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_022296f0
        .arm
func_ov002_022296f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    add r2, sp, #0x4
    mov r1, #0x0
    mov sl, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_304
    ldr r2, [sp, #0x4]
    mov r0, sl
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r6, r2, #0xff
    and fp, r1, #0xff
    mov r1, r6
    mov r2, fp
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_304
    mov r8, #0x0
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov r7, r8
    mov r9, r8
.L_2a4:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r4, r5
    add r1, r9, r1
    ldrh r1, [r1, #0x38]
    cmp r1, #0x0
    beq .L_2d4
    mov r1, r7
    bl func_ov002_021c83e4
    add r8, r8, r0
.L_2d4:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r9, r9, #0x14
    ble .L_2a4
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r2, [sl]
    mov r0, r6
    mov r1, fp
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_304:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
