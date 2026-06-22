; func_ov002_0222a688 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b947c
        .extern func_ov002_021bc618
        .extern func_ov002_021c3608
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca5bc
        .extern func_ov002_021d81d4
        .extern func_ov002_0227ac64
        .global func_ov002_0222a688
        .arm
func_ov002_0222a688:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldrh r2, [r7, #0x2]
    ldrh r0, [r7, #0x4]
    mov r1, r2, lsl #0x11
    mov r0, r0, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsr #0x17
    eor r4, r1, r2, lsr #0x1f
    bl func_ov002_021b947c
    mov r8, r0
    mov r0, r8, lsr #0x10
    mov r1, r0, lsl #0x10
    mov r0, r4
    and r5, r8, #0xff
    mov r6, r1, lsr #0x10
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xf
    bne .L_10c
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021c3608
    cmp r0, #0x0
    beq .L_10c
    mov r0, r4
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_e0
    ldrh r7, [r7]
    mov r3, #0x2
    rsb r0, r3, #0x16c0
    cmp r7, r0
    and r1, r5, #0x1
    ldr r2, _LIT0
    ldr r0, _LIT1
    mov r5, r7, lsl #0x10
    mla r0, r1, r0, r2
    add r1, r0, #0x5d0
    moveq r3, #0x0
    mov r0, r4
    add r1, r1, r6, lsl #0x2
    mov r2, #0x1
    str r5, [sp]
    bl func_ov002_0227ac64
    b .L_10c
.L_e0:
    ldrh r0, [r7, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    beq .L_10c
    ldrh r1, [r7, #0x4]
    mov r0, r5
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021d81d4
.L_10c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
