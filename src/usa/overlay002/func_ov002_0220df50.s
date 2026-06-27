; func_ov002_0220df50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_0220df50
        .arm
func_ov002_0220df50:
    cmp r1, #0x0
    movne r0, #0x0
    bxne lr
    ldrh r1, [r0, #0x2]
    mov r2, r1, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x21
    bne .L_7c
    ldr ip, [r0, #0x14]
    mov r1, r1, lsl #0x1f
    mov r0, ip, lsl #0x16
    mov r2, r0, lsr #0x1f
    mov r0, ip, lsl #0xf
    eor r0, r2, r0, lsr #0x1f
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x0
    bxeq lr
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r3, r2, #0x1
    mla r2, r3, r0, r1
    mov r0, ip, lsl #0x12
    mov r1, r0, lsr #0x1c
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_7c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
