; func_ov000_021ab484 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7450
        .global func_ov000_021ab484
        .arm
func_ov000_021ab484:
    ldr r3, _LIT0
    mov r2, #0x2c
    mla r3, r0, r2, r3
    ldr r0, [r3, #0x8]
    mvn r2, r1
    mov r1, r0, lsl #0x18
    and r2, r2, r1, lsr #0x18
    cmp r2, #0x3f
    bicne r0, r0, #0x200
    strne r0, [r3, #0x8]
    ldr r1, [r3, #0x8]
    and r0, r2, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    orr r0, r0, #0x100
    str r0, [r3, #0x8]
    bx lr
_LIT0: .word data_ov000_021c7450
