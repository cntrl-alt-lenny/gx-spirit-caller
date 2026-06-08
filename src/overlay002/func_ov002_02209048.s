; func_ov002_02209048 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .global func_ov002_02209048
        .arm
func_ov002_02209048:
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r1, [r1, r3]
    mov r0, #0x1
    cmp r1, #0x0
    ldreq r1, _LIT2
    ldreq r1, [r1, r3]
    cmpeq r1, #0x0
    moveq r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf17c
