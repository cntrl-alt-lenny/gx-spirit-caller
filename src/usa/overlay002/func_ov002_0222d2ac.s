; func_ov002_0222d2ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b939c
        .extern func_ov002_021c3304
        .extern func_ov002_021ff2cc
        .extern func_ov002_0227ab74
        .global func_ov002_0222d2ac
        .arm
func_ov002_0222d2ac:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldr r0, [r6, #0x14]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r0, lsr #0x10
    mov r2, r1, asr #0x8
    mov r1, r3, lsl #0x10
    and r2, r2, #0xff
    cmp r2, #0xe
    and r4, r0, #0xff
    mov r5, r1, lsr #0x10
    bne .L_b4
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_b4
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    mov r1, #0x0
    str r1, [sp]
    ldrh r2, [r6, #0x2]
    add r0, r0, #0x18
    add r1, r0, #0x400
    mov r0, r2, lsl #0x1f
    mov r2, #0x1
    mov r3, r2
    mov r0, r0, lsr #0x1f
    add r1, r1, r5, lsl #0x2
    bl func_ov002_0227ab74
.L_b4:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
