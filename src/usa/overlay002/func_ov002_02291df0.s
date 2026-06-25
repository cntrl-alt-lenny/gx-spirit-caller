; func_ov002_02291df0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_02291df0
        .arm
func_ov002_02291df0:
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT0
    ldr r3, _LIT1
    mov r1, r1, lsl #0x1f
    mov ip, r1, lsr #0x1f
    rsb r1, ip, #0x1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, [r3, r2]
    cmp r1, #0x1f4
    movle r0, #0x1
    bxle lr
    and r1, ip, #0x1
    mul r2, r1, r0
    ldr r1, [r3, r2]
    sub r0, r0, #0x28c
    cmp r1, r0
    movgt r0, #0x1
    movle r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
