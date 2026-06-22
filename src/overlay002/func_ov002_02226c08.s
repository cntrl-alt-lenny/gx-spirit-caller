; func_ov002_02226c08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b3618
        .extern func_ov002_021d6808
        .extern func_ov002_02226268
        .global func_ov002_02226c08
        .arm
func_ov002_02226c08:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r2, [r4, #0xc]
    cmp r2, #0x2
    bne .L_b4
    ldrh r1, [r4, #0x2]
    ldrh ip, [r4, #0x4]
    ldr r3, _LIT0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov lr, r1, lsl #0x1a
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    mov r1, lr, lsr #0x1b
    mov r2, #0x14
    mul r2, r1, r2
    add r3, r3, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov ip, ip, lsr #0x17
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, pc}
    bl func_ov002_021b3618
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r3, #0x0
    mov r0, r4
    and r1, r1, #0xff
    and r2, r2, #0xff
    str r3, [sp]
    bl func_ov002_021d6808
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_b4:
    bl func_ov002_02226268
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
