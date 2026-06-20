; func_ov002_02235a78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c1a2c
        .extern func_ov002_021d59cc
        .extern func_ov002_02216424
        .extern func_ov002_0226b11c
        .global func_ov002_02235a78
        .arm
func_ov002_02235a78:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x6
    bne .L_dc
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov ip, r2, lsl #0x1a
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla lr, r2, r1, r3
    mov r1, ip, lsr #0x1b
    mov r2, #0x14
    ldrh r3, [r4, #0x4]
    mul r2, r1, r2
    mov ip, r3, lsl #0x11
    add r3, lr, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsr #0x17
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, pc}
    rsb r2, r0, #0x1
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    str r2, [sp]
    ldrh r2, [r4]
    mov r3, #0x5
    bl func_ov002_021d59cc
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    beq .L_e8
    ldrh r0, [r4, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b11c
    b .L_e8
.L_dc:
    bl func_ov002_02216424
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_e8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
