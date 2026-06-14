; func_ov011_021cef38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4000
        .extern func_ov011_021ccf8c
        .extern func_ov011_021ce324
        .global func_ov011_021cef38
        .arm
func_ov011_021cef38:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov ip, r0, lsl #0x1c
    ldr lr, [r3, #0x2a4]
    mov r0, #0x1
    bic lr, lr, #0x1e00
    orr lr, lr, ip, lsr #0x13
    mov ip, lr, lsl #0x13
    mov ip, ip, lsr #0x1c
    bic lr, lr, #0x1e0
    mov ip, ip, lsl #0x1c
    orr ip, lr, ip, lsr #0x17
    mov r5, r1
    mov r4, r2
    str ip, [r3, #0x2a4]
    bl func_ov011_021ce324
    ldr r0, _LIT0
    mov r3, r5, lsl #0xc
    str r3, [r0, #0x258]
    mov r2, r4, lsl #0xc
    str r2, [r0, #0x25c]
    mov r1, #0x1000
    str r1, [r0, #0x254]
    ldr r1, [r0, #0x2ac]
    bic r1, r1, #0x20000
    str r1, [r0, #0x2ac]
    str r3, [r0, #0x26c]
    str r2, [r0, #0x270]
    bl func_ov011_021ccf8c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d4000
