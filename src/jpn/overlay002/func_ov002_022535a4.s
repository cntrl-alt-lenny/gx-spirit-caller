; func_ov002_022535a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cac38
        .extern data_ov002_022cdb98
        .extern func_ov002_02253550
        .global func_ov002_022535a4
        .arm
func_ov002_022535a4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r1, r5, lsl #0x10
    mov r6, r0
    mov r0, r1, lsr #0x10
    mov r4, r2
    bl func_ov002_02253550
    movs r2, r0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xc]
    bmi .L_48
    ldr r1, _LIT1
    mov r0, r6
    ldr r3, [r1, r2, lsl #0x3]
    mov r1, r5
    mov r2, r4
    blx r3
.L_48:
    ldr r0, _LIT0
    ldr r0, [r0, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cdb98
_LIT1: .word data_ov002_022cac38
