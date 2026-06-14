; func_ov011_021d1c80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d403c
        .extern func_ov011_021cb218
        .extern func_ov011_021ceffc
        .global func_ov011_021d1c80
        .arm
func_ov011_021d1c80:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1c
    ldr r2, [r1, #0x284]
    bic r2, r2, #0xf00
    orr r0, r2, r0, lsr #0x14
    str r0, [r1, #0x284]
    mov r0, r0, lsl #0x14
    ldr r2, [r1, #0x268]
    mov r0, r0, lsr #0x1c
    bic r2, r2, #0x1e0
    mov r0, r0, lsl #0x1c
    orr r0, r2, r0, lsr #0x17
    str r0, [r1, #0x268]
    ldr r0, [r1, #0x280]
    orr r0, r0, #0x200
    str r0, [r1, #0x280]
    bl func_ov011_021cb218
    bl func_ov011_021ceffc
    ldr r0, _LIT0
    ldr r1, [r0, #0x284]
    bic r1, r1, #0xff
    orr r1, r1, #0x2
    str r1, [r0, #0x284]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov011_021d403c
