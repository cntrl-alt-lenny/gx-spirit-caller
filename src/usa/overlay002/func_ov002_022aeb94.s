; func_ov002_022aeb94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0e4c
        .extern func_020371b8
        .extern func_ov002_022597e8
        .extern func_ov002_0229a304
        .extern func_ov002_022ae884
        .global func_ov002_022aeb94
        .arm
func_ov002_022aeb94:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, r1
    bl func_ov002_022597e8
    ldr r0, _LIT0
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_84
    mov r0, #0x0
    bl func_ov002_0229a304
.L_84:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022ae884
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0e4c
