; func_ov011_021ce280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_ov011_021cef38
        .global func_ov011_021ce280
        .arm
func_ov011_021ce280:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x2b0]
    ldr r3, _LIT2
    and r2, r2, r0
    orr r2, r2, #0x2000
    str r2, [r1, #0x2b0]
    ldr r1, [r1, #0x2a4]
    mov r2, r1, lsl #0x17
    mov r2, r2, lsr #0x1c
    mov r1, r1, lsl #0x13
    cmp r2, r1, lsr #0x1c
    beq .L_40
    bl func_ov011_021cef38
    ldmia sp!, {r3, pc}
.L_40:
    ldr r1, [r3, #0x274]
    and r0, r1, r0
    orr r0, r0, #0x4000
    str r0, [r3, #0x274]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word 0xffe01fff
_LIT2: .word data_ov011_021d3f5c
