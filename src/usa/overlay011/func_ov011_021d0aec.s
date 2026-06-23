; func_ov011_021d0aec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_ov011_021d4580
        .extern func_ov011_021cc0d0
        .extern func_ov011_021cc1b8
        .extern func_ov011_021d1370
        .global func_ov011_021d0aec
        .arm
func_ov011_021d0aec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x28
    bl Fill32
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r1, [r4, #0x1c]
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x18]
    ldr r2, _LIT2
    orr r0, r0, #0xe0
    str r0, [r4, #0x18]
    ldr r0, [r2, #0x19c]
    mov r1, r0, lsl #0x17
    movs r1, r1, lsr #0x1f
    ldmneia sp!, {r4, pc}
    orr r3, r0, #0x100
    mov r0, r4
    mov r1, #0x1
    str r3, [r2, #0x19c]
    bl func_ov011_021d1370
    ldmia sp!, {r4, pc}
_LIT0: .word func_ov011_021cc0d0
_LIT1: .word func_ov011_021cc1b8
_LIT2: .word data_ov011_021d4580
