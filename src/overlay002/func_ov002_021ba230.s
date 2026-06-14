; func_ov002_021ba230 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_ov002_021b00d0
        .extern func_ov002_021b91d0
        .global func_ov002_021ba230
        .arm
func_ov002_021ba230:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT1
    ldr r0, [r0, r1]
    subs r5, r0, #0x1
    ldmmiia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    add r0, r0, r1
    add r4, r0, #0x260
    add r6, r4, r5, lsl #0x2
.L_30:
    add r0, r5, #0x1
    bl func_ov002_021b00d0
    mov r1, r0
    mov r0, r6
    add r1, r4, r1, lsl #0x2
    bl func_ov002_021b91d0
    sub r6, r6, #0x4
    subs r5, r5, #0x1
    bpl .L_30
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
