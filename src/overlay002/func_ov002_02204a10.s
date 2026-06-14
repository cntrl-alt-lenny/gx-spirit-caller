; func_ov002_02204a10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .global func_ov002_02204a10
        .arm
func_ov002_02204a10:
    ldrh r2, [r0, #0x2]
    ldr r1, _LIT0
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    ldr ip, [r1, #0xcec]
    rsb r1, r3, #0x1
    cmp ip, r1
    movne r0, #0x0
    bxne lr
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x19
    bne .L_d0
    ldr r0, [r0, #0x14]
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_d0:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d016c
