; func_ov002_02224c04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_021ae320
        .extern func_ov002_021ba1b4
        .extern func_ov002_021d8198
        .extern func_ov002_021e277c
        .extern func_ov002_0226af64
        .global func_ov002_02224c04
        .arm
func_ov002_02224c04:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    ldrh r1, [r4, #0x8]
    cmp r0, #0x64
    beq .L_188
    cmp r0, #0x78
    beq .L_170
    cmp r0, #0x80
    bne .L_1a4
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021ba1b4
    movs ip, r0
    ldrh r0, [r4, #0x2]
    bpl .L_140
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_140:
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    ldr r3, _LIT1
    ldr r1, _LIT2
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    add r1, r1, ip, lsl #0x2
    bl func_ov002_021d8198
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_170:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af64
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_188:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1a4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
