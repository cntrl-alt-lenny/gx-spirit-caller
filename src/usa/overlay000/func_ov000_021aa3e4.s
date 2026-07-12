; func_ov000_021aa3e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020bf18c
        .extern data_ov000_021c7300
        .extern data_ov000_021c7304
        .extern func_ov000_021aa4d8
        .extern func_ov000_021aa760
        .extern func_ov000_021aa9e8
        .global func_ov000_021aa3e4
        .arm
func_ov000_021aa3e4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, [r2]
    mov r5, r1
    cmp r0, #0x0
    ldreq r0, _LIT1
    ldr r1, _LIT0
    streq r0, [r2]
    ldr r4, [r1]
    mov r0, #0x0
    mov r2, #0x4
    mov r1, r4
    bl Fill32
    ldr r1, _LIT2
    mov r0, #0x0
    ldrsh r3, [r1, #0x5c]
    ldrsh r2, [r1, #0x5e]
    ldr r1, _LIT3
    str r3, [r4]
    str r2, [r4, #0x4]
    str r1, [r4, #0x8]
    mov r1, #0x1000
    str r1, [r4, #0xc]
    mov r1, #0x200000
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
    sub r1, r0, #0xbf000
    str r1, [r4, #0x18]
    str r0, [r4, #0x20]
    mov r1, #0xff000
    str r1, [r4, #0x1c]
    str r0, [r4, #0x30]
    str r0, [r4, #0x34]
    mov r1, r0
    mov r2, r0
    str r0, [r4, #0x38]
    bl func_ov000_021aa760
    mov r0, #0x0
    str r0, [r4, #0x120]
    str r0, [r4, #0x24]
    mov r0, #0xa000
    str r0, [r4, #0x28]
    str r0, [r4, #0x2c]
    ldr r1, [r4, #0x140]
    mov r0, r6, lsl #0x1e
    bic r3, r1, #0xf
    bic r1, r3, #0x30
    orr r2, r1, r0, lsr #0x1a
    bic r1, r2, #0x200
    mov r0, r5, lsl #0x1f
    orr r0, r1, r0, lsr #0x16
    str r0, [r4, #0x140]
    bl func_ov000_021aa9e8
    mov r0, r4
    bl func_ov000_021aa4d8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov000_021c7300
_LIT1: .word data_ov000_021c7304
_LIT2: .word data_020bf18c
_LIT3: .word 0x00001555
