; func_ov002_0220dd68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_0220dd68
        .arm
func_ov002_0220dd68:
    ldrh r0, [r0, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_64
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r1, #0x1
    mla r0, r1, r0, r2
    add r2, r0, #0x94
    mov r1, #0x5
.L_38:
    ldr r0, [r2]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    bxeq lr
    add r1, r1, #0x1
    cmp r1, #0xa
    add r2, r2, #0x14
    blt .L_38
    mov r0, #0x1
    bx lr
.L_64:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
