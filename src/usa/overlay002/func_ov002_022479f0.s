; func_ov002_022479f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cabc0
        .extern func_ov002_021baf88
        .extern func_ov002_021ca1d8
        .extern func_ov002_02247700
        .global func_ov002_022479f0
        .arm
func_ov002_022479f0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_370
    ldr r6, _LIT2
.L_344:
    mov r0, r5
    mov r1, r4
    bl func_ov002_02247700
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x4]!
    add r4, r4, #0x1
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_344
.L_370:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000013f2
_LIT1: .word data_ov002_022cabc0
_LIT2: .word data_ov002_022cabc0
