; func_ov002_021eac88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_ov002_021bc8c8
        .global func_ov002_021eac88
        .arm
func_ov002_021eac88:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    mov r5, r1
    ldr r0, [r0, #0xcec]
    mov r4, r2
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT2
    and r3, r5, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
