; func_ov011_021d0a88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov011_021d37dc
        .extern data_ov011_021d3f20
        .global func_ov011_021d0a88
        .arm
func_ov011_021d0a88:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r3, [r1, #0x2bc]
    ldr r2, _LIT2
    orr r3, r3, #0x400000
    str r3, [r1, #0x2bc]
    ldr r0, [r0, #0xb6c]
    ldr r0, [r2, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_264
    blx r0
    cmp r0, #0x0
    beq .L_25c
    ldr r0, _LIT1
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
.L_25c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_264:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_02103fcc
_LIT2: .word data_ov011_021d37dc
