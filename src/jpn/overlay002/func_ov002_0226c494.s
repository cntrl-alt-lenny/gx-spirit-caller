; func_ov002_0226c494 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d008c
        .extern func_ov002_021bc7e8
        .global func_ov002_0226c494
        .arm
func_ov002_0226c494:
    stmdb sp!, {r3, r4, r5, lr}
    add r4, r1, r2
    mov r5, r0
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    mov r1, r5
    ldr r0, [r0, #0xcec]
    mov r2, r4
    bl func_ov002_021bc7e8
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
    movne r0, #0x800
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c4
