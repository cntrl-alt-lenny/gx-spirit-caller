; func_ov000_021ae42c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c758c
        .extern func_ov000_021ae510
        .global func_ov000_021ae42c
        .arm
func_ov000_021ae42c:
    ldr r1, _LIT0
    mov r2, r0, lsl #0x1c
    ldr r3, [r1, #0x2a8]
    ldr r0, _LIT1
    bic r3, r3, #0xf000
    orr r2, r3, r2, lsr #0x10
    str r2, [r1, #0x2a8]
    ldr r3, [r1, #0x2a4]
    ldr ip, _LIT2
    and r0, r3, r0
    orr r3, r0, #0x2000
    mov r2, r2, lsl #0x10
    mov r0, r2, lsr #0x1c
    str r3, [r1, #0x2a4]
    bx ip
_LIT0: .word data_ov000_021c758c
_LIT1: .word 0xffe01fff
_LIT2: .word func_ov000_021ae510
