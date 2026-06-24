; func_ov002_02267ea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021b9d20
        .global func_ov002_02267ea8
        .arm
func_ov002_02267ea8:
    stmdb sp!, {r3, lr}
    add r1, r1, r2
    cmp r1, #0xa
    bgt .L_1d4
    ldr r2, _LIT0
    ldr r3, [r2, #0xcec]
    ldr r2, [r2, #0xd24]
    eor r2, r3, r2
    cmp r0, r2
    bne .L_1d4
    bl func_ov002_021b9d20
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, pc}
.L_1d4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
