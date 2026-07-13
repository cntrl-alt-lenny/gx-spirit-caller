; func_ov022_021aa5a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov022_021ac28c
        .extern data_ov022_021ac48c
        .extern data_ov022_021ac68c
        .extern data_ov022_021ac88c
        .extern data_ov022_021ac9c0
        .extern func_ov022_021ab680
        .global func_ov022_021aa5a0
        .arm
func_ov022_021aa5a0:
    stmdb sp!, {r4, lr}
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    orr r4, r0, #0x100
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r4
    bl func_ov022_021ab680
    ldr r0, _LIT2
    ldr r1, _LIT3
    mov r2, r4
    bl func_ov022_021ab680
    ldr r0, _LIT4
    ldr r1, [r0, #0x198]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r0, #0x198]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov022_021ac28c
_LIT1: .word data_ov022_021ac68c
_LIT2: .word data_ov022_021ac48c
_LIT3: .word data_ov022_021ac88c
_LIT4: .word data_ov022_021ac9c0
