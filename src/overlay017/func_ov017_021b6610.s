; func_ov017_021b6610 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov017_021b8894
        .extern data_ov017_021b8994
        .global func_ov017_021b6610
        .arm
func_ov017_021b6610:
    ldr r1, [r0, #0x4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_22c
    b .L_1c4
    b .L_1e0
    b .L_1fc
    b .L_214
.L_1c4:
    ldr r2, [r0, #0x60]
    ldr r1, _LIT0
    ldr r0, _LIT1
    strb r2, [r1, #0x1ce]
    mov r1, #0x4
    strh r1, [r0, #0xd8]
    b .L_22c
.L_1e0:
    ldr r2, [r0, #0x60]
    ldr r1, _LIT0
    ldr r0, _LIT1
    strb r2, [r1, #0x1cf]
    mov r1, #0x8
    strh r1, [r0, #0xd8]
    b .L_22c
.L_1fc:
    ldr r2, [r0, #0x60]
    ldr r0, _LIT1
    mov r1, #0x10
    strh r2, [r0, #0xd0]
    strh r1, [r0, #0xd8]
    b .L_22c
.L_214:
    ldr r2, [r0, #0x60]
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r2, [r1, #0x1d4]
    mov r1, #0x40
    strh r1, [r0, #0xd8]
.L_22c:
    mov r0, #0x1
    bx lr
_LIT0: .word data_ov017_021b8894
_LIT1: .word data_ov017_021b8994
