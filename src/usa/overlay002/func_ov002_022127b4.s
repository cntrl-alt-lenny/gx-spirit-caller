; func_ov002_022127b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021df6dc
        .extern func_ov002_021e050c
        .global func_ov002_022127b4
        .arm
func_ov002_022127b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_4ec
    mov r0, r1, lsl #0x1f
    ldr r1, _LIT0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e050c
    b .L_520
.L_4ec:
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    beq .L_50c
    mov r0, r1, lsl #0x1f
    ldr r1, _LIT0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e050c
.L_50c:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df6dc
.L_520:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000bb8
_LIT1: .word 0x00001388
