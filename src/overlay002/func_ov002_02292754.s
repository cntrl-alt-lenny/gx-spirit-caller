; func_ov002_02292754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf26c
        .extern data_ov002_022d016c
        .global func_ov002_02292754
        .arm
func_ov002_02292754:
    ldr r1, _LIT0
    ldrh r2, [r0]
    ldr r1, [r1, #0xdc]
    cmp r1, r2
    beq .L_64
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r3, r2, r0
    add r0, r1, r3
    ldr r0, [r0, #0xf8]
    mov r1, #0x0
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrne r0, _LIT3
    ldrneh r0, [r0, r3]
    cmpne r0, #0x0
    movne r1, #0x1
    cmp r1, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_64:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf26c
