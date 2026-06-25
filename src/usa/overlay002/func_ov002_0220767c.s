; func_ov002_0220767c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0a0
        .global func_ov002_0220767c
        .arm
func_ov002_0220767c:
    ldrh r2, [r0]
    ldr r1, _LIT0
    mov r3, #0x1
    cmp r2, r1
    beq .L_f0
    add r1, r1, #0x1ec
    cmp r2, r1
    moveq r3, #0x1e
    b .L_f4
.L_f0:
    mov r3, #0xf
.L_f4:
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, r3
    movcs r0, #0x1
    movcc r0, #0x0
    bx lr
_LIT0: .word 0x000014f0
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0a0
