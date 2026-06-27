; func_ov002_02286984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_02286984
        .arm
func_ov002_02286984:
    ldrh r1, [r0, #0x2]
    ldr r3, [r0, #0x14]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT1
    mov r3, r3, lsl #0x10
    ldr r1, [r1, r2]
    mov r2, r3, lsr #0x10
    cmp r1, r3, lsr #0x10
    movls r0, #0x1
    bxls lr
    sub r0, r0, #0x28c
    cmp r2, r0
    movcs r0, #0x1
    movcc r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
