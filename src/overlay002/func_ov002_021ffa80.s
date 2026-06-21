; func_ov002_021ffa80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern func_ov002_021b3618
        .extern func_ov002_021bc288
        .extern func_ov002_021bc68c
        .extern func_ov002_021bc8c8
        .extern func_ov002_021ca2b8
        .global func_ov002_021ffa80
        .arm
func_ov002_021ffa80:
    stmdb sp!, {r4, r5, r6, lr}
    ldrh r2, [r0, #0x2]
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x11
    mov r1, r1, lsr #0x1b
    eor r4, r0, r2, lsr #0x1f
    bl func_ov002_021b3618
    ldr r1, _LIT0
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r0, asr #0x8
    and r5, r0, #0xff
    and r6, r1, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_021bc68c
    cmp r0, #0x0
    bne .L_14c
    cmp r5, r4
    bne .L_144
    mov r0, r5
    mov r1, r6
    bl func_ov002_021bc288
    cmp r0, #0x0
    bne .L_14c
.L_144:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_14c:
    mov r0, r4
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
