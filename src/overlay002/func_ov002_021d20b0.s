; func_ov002_021d20b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf178
        .extern func_020b3a7c
        .extern func_ov002_0229ade0
        .global func_ov002_021d20b0
        .arm
func_ov002_021d20b0:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    movne r4, #0x1
    moveq r4, #0x0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r1, [r0, r2]
    cmp r1, #0x2
    bcs .L_39c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
.L_39c:
    ldr r2, _LIT0
    ldr r0, [r2, #0x810]
    cmp r0, #0x20
    movhi r0, #0x0
    strhi r0, [r2, #0x80c]
    ldmhiia sp!, {r4, pc}
    add r3, r0, #0x1
    mov r0, r0, lsr #0x1
    str r3, [r2, #0x810]
    bl func_020b3a7c
    mov r3, r1
    mov r1, r4
    mov r0, #0x7
    mov r2, #0xb
    bl func_ov002_0229ade0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
