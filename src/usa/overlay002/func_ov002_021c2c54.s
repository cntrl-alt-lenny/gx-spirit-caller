; func_ov002_021c2c54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a8
        .extern data_ov002_022cf814
        .extern func_ov002_021b90e4
        .global func_ov002_021c2c54
        .arm
func_ov002_021c2c54:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r7, r0, r2
    ldr r0, _LIT1
    ldr r0, [r0, r7]
    subs r5, r0, #0x1
    ldmmiia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT2
    add r6, r2, r7
    add r2, r6, #0x5d0
    add r4, r2, r5, lsl #0x2
.L_30:
    ldr r3, [r4]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r1, r2
    bne .L_e0
    ldr r1, _LIT2
    ldr r4, _LIT1
    add r1, r1, r7
    add r1, r1, #0x5d0
    add r0, r1, r0, lsl #0x2
    add r1, r1, r5, lsl #0x2
    bl func_ov002_021b90e4
    ldr r1, _LIT3
    ldr r0, [r4, r7]
    add r2, r1, r7
    mov r1, r5, lsl #0x1
    ldrh r1, [r2, r1]
    mov r0, r0, lsl #0x1
    strh r1, [r2, r0]
    ldr r0, [r4, r7]
    cmp r5, r0
    ldmcsia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT2
    add r1, r6, #0x5d0
    add r7, r0, r7
    add r6, r1, r5, lsl #0x2
    add r4, r7, #0x5d0
.L_a8:
    add r1, r5, #0x1
    mov r0, r6
    add r1, r4, r1, lsl #0x2
    bl func_ov002_021b90e4
    add r0, r7, r5, lsl #0x1
    add r0, r0, #0x700
    ldrh r1, [r0, #0x8a]
    add r5, r5, #0x1
    add r6, r6, #0x4
    strh r1, [r0, #0x88]
    ldr r0, [r7, #0x1c]
    cmp r5, r0
    bcc .L_a8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_e0:
    sub r4, r4, #0x4
    subs r5, r5, #0x1
    bpl .L_30
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a8
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf814
