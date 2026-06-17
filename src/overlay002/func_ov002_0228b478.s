; func_ov002_0228b478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .global func_ov002_0228b478
        .arm
func_ov002_0228b478:
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldrh r2, [r1]
    ldr r1, _LIT0
    cmp r2, r1
    beq .L_2a0
    add r1, r1, #0x50
    cmp r2, r1
    beq .L_2a8
    b .L_2dc
.L_2a0:
    mov r0, #0x1
    bx lr
.L_2a8:
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x4
    movcs r0, #0x1
    movcc r0, #0x0
    bx lr
.L_2dc:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000012d5
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
