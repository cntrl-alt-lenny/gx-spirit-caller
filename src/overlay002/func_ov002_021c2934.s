; func_ov002_021c2934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e234
        .extern func_ov002_021baca8
        .global func_ov002_021c2934
        .arm
func_ov002_021c2934:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    mov r9, r0
    mov r0, r8
    mov r7, r2
    bl func_0202e234
    cmp r0, #0x0
    movne r4, #0x0
    movne r5, #0x4
    moveq r4, #0x5
    moveq r5, #0x9
    cmp r4, r5
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r9, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mla r6, r4, r0, r2
.L_418:
    mov r0, r9
    mov r1, r4
    mov r2, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    ldrne r0, [r6, #0x3c]
    add r4, r4, #0x1
    addne r0, r0, r7
    strne r0, [r6, #0x3c]
    cmp r4, r5
    add r6, r6, #0x14
    ble .L_418
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
