; func_ov002_021f93a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b99b4
        .extern func_ov002_021d8128
        .extern func_ov002_021f4a84
        .extern func_ov002_0220898c
        .global func_ov002_021f93a0
        .arm
func_ov002_021f93a0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov002_0220898c
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021f4a84
    mov r4, r0
    cmp r4, #0x1
    bne .L_714
    ldrh r1, [r5, #0x2]
    ldrh r0, [r5, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    ldrh r1, [r5, #0x2]
    mov ip, r0
    ldr r3, _LIT0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, ip, lsl #0x2
    mov r2, #0x0
    bl func_ov002_021d8128
.L_714:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
