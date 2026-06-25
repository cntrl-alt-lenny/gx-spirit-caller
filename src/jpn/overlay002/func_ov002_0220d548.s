; func_ov002_0220d548 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e1e0
        .extern func_ov002_021b939c
        .extern func_ov002_021c3304
        .extern func_ov002_021c9310
        .extern func_ov002_021ff2cc
        .global func_ov002_0220d548
        .arm
func_ov002_0220d548:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x14]
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r3, r0, lsr #0x10
    mov r1, r3, lsl #0x10
    mov r2, r2, asr #0x8
    and r7, r0, #0xff
    mov r6, r1, lsr #0x10
    and r5, r2, #0xff
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov002_021c9310
    cmp r5, #0xe
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_98
    ldrh r0, [r4, #0x2]
    mov r1, r7
    mov r2, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3304
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_98:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
