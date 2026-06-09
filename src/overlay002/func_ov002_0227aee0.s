; func_ov002_0227aee0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c4c9c
        .global func_ov002_0227aee0
        .arm
func_ov002_0227aee0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, _LIT0
    mov r3, #0x14
    ldr lr, _LIT1
    and r6, r0, #0x1
    mul r4, r1, r3
    mla r5, r6, ip, lr
    ldrh r3, [r5, r4]
    cmp r3, #0x0
    bne .L_154
    mov r3, #0x1
    strh r3, [r5, r4]
    bl func_ov002_021c4c9c
    mov r0, #0x0
    strh r0, [r5, r4]
    ldmia sp!, {r4, r5, r6, pc}
.L_154:
    bl func_ov002_021c4c9c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
