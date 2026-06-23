; func_ov011_021cedf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d2f1c
        .extern data_ov011_021d2f44
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .global func_ov011_021cedf8
        .arm
func_ov011_021cedf8:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1, #0x2a0]
    cmp r1, #0x1
    ldr r1, [r0, #0x268]
    ldreq r2, _LIT2
    moveq r1, r1, lsl #0x17
    movne r1, r1, lsl #0x13
    mov r1, r1, lsr #0x1c
    ldrne r2, _LIT3
    sub r1, r1, #0x1
    add lr, r2, r1, lsl #0x2
    ldrsh r3, [lr]
    ldr r1, [r0, #0x270]
    mov r2, #0x1000
    mov ip, r3, lsl #0xc
    str ip, [r0, #0x21c]
    ldrsh r3, [lr, #0x2]
    bic r1, r1, #0x20000
    mov r3, r3, lsl #0xc
    str r3, [r0, #0x220]
    str r2, [r0, #0x218]
    str r1, [r0, #0x270]
    str ip, [r0, #0x230]
    str r3, [r0, #0x234]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word data_ov011_021d2f1c
_LIT3: .word data_ov011_021d2f44
