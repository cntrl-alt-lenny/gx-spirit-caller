; func_ov002_02295cd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b89c
        .extern func_ov002_021be3c0
        .extern func_ov002_021c3a04
        .extern func_ov002_022579d0
        .extern func_ov002_02259e8c
        .extern func_ov002_02280870
        .global func_ov002_02295cd0
        .arm
func_ov002_02295cd0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r1, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3a04
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x2]
    ldrh r0, [r5]
    mov r1, r1, lsl #0x1f
    mov r4, r1, lsr #0x1f
    bl func_0202b89c
    rsb r2, r4, #0x1
    ldr r1, _LIT1
    and r2, r2, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    cmp r1, r0
    bgt .L_90
    mov r0, r4
    bl func_ov002_02259e8c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_90:
    ldrh r0, [r5, #0x2]
    mov r2, #0x1
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021be3c0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280870
    cmp r0, #0x0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000018e8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
