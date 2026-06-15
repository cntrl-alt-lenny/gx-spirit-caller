; func_ov000_021af4d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c758c
        .extern data_ov000_021c7594
        .global func_ov000_021af4d8
        .arm
func_ov000_021af4d8:
    stmdb sp!, {r4, lr}
    ldr ip, _LIT0
    ldr r3, _LIT1
    ldr r4, [ip, #0x2c]
    mov r4, r4, lsl #0xb
    cmp r1, r4, lsr #0x18
    ldreq r4, [r3, #0x24]
    moveq ip, r4, lsl #0x13
    cmpeq r0, ip, lsr #0x18
    moveq r4, r4, lsl #0x6
    moveq r4, r4, lsr #0x1b
    cmpeq r4, r2
    ldmeqia sp!, {r4, pc}
    ldr r4, [r3, #0x24]
    ldr ip, _LIT2
    and r0, r0, #0xff
    and lr, r1, #0xff
    and r4, r4, ip
    mov ip, r0, lsl #0x18
    and r1, r2, #0xff
    ldr r0, _LIT3
    orr r2, r4, ip, lsr #0x13
    and r2, r2, r0
    mov r0, lr, lsl #0x18
    orr r0, r2, r0, lsr #0xb
    bic r2, r0, #0x3e00000
    mov r0, r1, lsl #0x1b
    orr r0, r2, r0, lsr #0x6
    str r0, [r3, #0x24]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov000_021c758c
_LIT1: .word data_ov000_021c7594
_LIT2: .word 0xffffe01f
_LIT3: .word 0xffe01fff
