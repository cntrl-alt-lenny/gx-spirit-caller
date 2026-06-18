; func_ov002_0222d5d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b99b4
        .extern func_ov002_021d7d0c
        .global func_ov002_0222d5d8
        .arm
func_ov002_0222d5d8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    movs ip, r0
    bmi .L_b60
    ldrh r1, [r4, #0x2]
    ldr r3, _LIT0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r2, r1, #0x1
    mla r0, r2, r0, r3
    add r0, r0, #0x18
    add r2, r0, #0x400
    mov r0, r4
    add r2, r2, ip, lsl #0x2
    bl func_ov002_021d7d0c
.L_b60:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
