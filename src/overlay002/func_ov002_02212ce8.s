; func_ov002_02212ce8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021d6714
        .extern func_ov002_021df708
        .extern func_ov002_021e2b1c
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_02212ce8
        .arm
func_ov002_02212ce8:
    stmdb sp!, {r3, r4, r5, lr}
    add r2, sp, #0x0
    mov r1, #0x0
    mov r4, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_a0
    ldr r2, [sp]
    mov r0, r4
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_a0
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d6714
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r1, [r0, #0x30]
    mov r0, r4
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_ov002_021df708
    mov r0, #0x1e
    bl func_ov002_021e2b1c
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d6714
.L_a0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
