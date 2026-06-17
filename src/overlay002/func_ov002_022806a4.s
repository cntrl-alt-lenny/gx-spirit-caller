; func_ov002_022806a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022d016c
        .extern func_ov002_021afb64
        .extern func_ov002_021aff4c
        .extern func_ov002_0225368c
        .extern func_ov002_0227f03c
        .global func_ov002_022806a4
        .arm
func_ov002_022806a4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov002_0225368c
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT0
    mov r0, r6
    mov r1, r5
    mov r2, r4
    str r6, [r3]
    bl func_ov002_0227f03c
    movs r4, r0
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, r5, r6, pc}
    bl func_ov002_021afb64
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021aff4c
    ldr r1, _LIT1
    mov r2, #0x1
    mov r0, r4
    str r2, [r1, #0xd44]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word data_ov002_022d016c
