; func_ov002_02267f40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021bc8c8
        .global func_ov002_02267f40
        .arm
func_ov002_02267f40:
    stmdb sp!, {r4, lr}
    add r4, r1, r2
    cmp r4, #0x4
    bgt .L_190
    ldr r1, _LIT0
    ldr r1, [r1, #0xcec]
    cmp r0, r1
    bne .L_190
    mov r1, r0
    mov r2, r4
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    ldrne r0, _LIT0
    ldrne r0, [r0, #0xd28]
    cmpne r0, r4
    movne r0, #0x800
    ldmneia sp!, {r4, pc}
.L_190:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
