; func_ov002_02212bf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021d6624
        .extern func_ov002_021df618
        .extern func_ov002_021e2a2c
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02212bf8
        .arm
func_ov002_02212bf8:
    stmdb sp!, {r3, r4, r5, lr}
    add r2, sp, #0x0
    mov r1, #0x0
    mov r4, r0
    bl func_ov002_0223de48
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
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_a0
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d6624
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
    bl func_ov002_021df618
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d6624
.L_a0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
