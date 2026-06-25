; func_ov002_021c9a10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .global func_ov002_021c9a10
        .arm
func_ov002_021c9a10:
    cmp r1, #0x0
    mov r2, #0x1
    beq .L_720
    ldr r1, _LIT0
    ldr r3, [r1, #0xd0]
    orr r0, r3, r2, lsl r0
    str r0, [r1, #0xd0]
    bx lr
.L_720:
    ldr r1, _LIT0
    mvn r0, r2, lsl r0
    ldr r2, [r1, #0xd0]
    and r0, r2, r0
    str r0, [r1, #0xd0]
    bx lr
_LIT0: .word data_ov002_022d008c
