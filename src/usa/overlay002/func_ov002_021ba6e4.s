; func_ov002_021ba6e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_ov002_021b90f0
        .global func_ov002_021ba6e4
        .arm
func_ov002_021ba6e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r1
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r1, [r0, r2]
    add r0, r1, r1, lsr #0x1f
    mov r5, r0, asr #0x1
    cmp r5, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT2
    sub r6, r1, #0x1
    add r0, r0, r2
    add r8, r0, #0x260
    mov r7, r8
.L_2e0:
    sub r1, r6, r4
    mov r0, r8
    add r1, r7, r1, lsl #0x2
    bl func_ov002_021b90f0
    add r4, r4, #0x1
    cmp r4, r5
    add r8, r8, #0x4
    blt .L_2e0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
