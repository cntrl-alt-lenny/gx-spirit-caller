; func_ov002_02295dec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021be3c0
        .extern func_ov002_022579d0
        .extern func_ov002_02259e8c
        .extern func_ov002_02280870
        .global func_ov002_02295dec
        .arm
func_ov002_02295dec:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r1, [r6, #0x2]
    ldr r2, _LIT0
    mov r1, r1, lsl #0x1f
    mov r5, r1, lsr #0x1f
    rsb r1, r5, #0x1
    and r3, r1, #0x1
    mul r4, r3, r2
    bl func_ov002_022579d0
    ldr r1, _LIT1
    ldr r1, [r1, r4]
    adds r0, r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldr r1, [r1, r4]
    cmp r1, r0
    bgt .L_64
    mov r0, r5
    bl func_ov002_02259e8c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_64:
    ldrh r0, [r6, #0x2]
    mov r2, #0x1
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021be3c0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280870
    cmp r0, #0x0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000b54
