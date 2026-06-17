; func_ov002_02262738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021d5fb4
        .global func_ov002_02262738
        .arm
func_ov002_02262738:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r4, _LIT0
    ldr r9, _LIT1
    ldr sl, _LIT2
    mov r6, #0x0
    mov r5, #0x5
.L_18:
    and r0, r6, #0x1
    mla r1, r0, sl, r4
    mov r7, r5
    add r8, r1, #0x94
.L_28:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    cmp r9, r0, lsr #0x13
    bne .L_44
    mov r0, r6
    mov r1, r7
    bl func_ov002_021d5fb4
.L_44:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    blt .L_28
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_18
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x000013f9
_LIT2: .word 0x00000868
