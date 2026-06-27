; func_ov002_022868c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_022868c0
        .arm
func_ov002_022868c0:
    ldrh r3, [r0, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    rsb r3, r3, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldrh r3, [r0, #0x16]
    ldr r1, [r2, r1]
    cmp r3, r1
    movge r0, #0x1
    bxge lr
    ldrh r0, [r0, #0x14]
    cmp r0, r3
    movcs r0, #0x1
    movcc r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
