; func_ov002_02208390 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern func_ov002_021bfe20
        .extern func_ov002_021c026c
        .extern func_ov002_022015cc
        .global func_ov002_02208390
        .arm
func_ov002_02208390:
    stmdb sp!, {r3, lr}
    bl func_ov002_022015cc
    cmp r0, #0x0
    beq .L_54
    ldr r1, _LIT0
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021bfe20
    cmp r0, #0x2
    movge r0, #0x1
    ldmgeia sp!, {r3, pc}
    cmp r0, #0x0
    beq .L_54
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c026c
    cmp r0, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_54:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd314
