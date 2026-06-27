; func_ov002_02253600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cac38
        .extern data_ov002_022cdb98
        .extern func_ov002_02253550
        .global func_ov002_02253600
        .arm
func_ov002_02253600:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r1, r6, lsl #0x10
    mov r7, r0
    mov r0, r1, lsr #0x10
    mov r5, r2
    bl func_ov002_02253550
    ldr r1, _LIT0
    movs r2, r0
    ldr r4, [r1, #0xc]
    bmi .L_44
    ldr r1, _LIT1
    mov r0, r7
    ldr r3, [r1, r2, lsl #0x3]
    mov r1, r6
    mov r2, r5
    blx r3
.L_44:
    ldr r0, _LIT0
    ldr r1, [r0, #0xc]
    str r4, [r0, #0xc]
    sub r0, r1, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cdb98
_LIT1: .word data_ov002_022cac38
