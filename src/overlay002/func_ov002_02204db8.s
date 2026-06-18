; func_ov002_02204db8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021b3ecc
        .global func_ov002_02204db8
        .arm
func_ov002_02204db8:
    stmdb sp!, {r3, lr}
    mov ip, r0
    ldrh r3, [ip, #0x2]
    ldr r0, _LIT0
    mov r2, r3, lsl #0x1f
    ldr r1, [r0, #0xcec]
    mov r0, r2, lsr #0x1f
    cmp r1, r2, lsr #0x1f
    beq .L_48
    ldr r1, _LIT1
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT2
    ldr r0, [r0, r1]
    cmp r0, #0x4
    movcc r0, #0x1
    movcs r0, #0x0
    ldmia sp!, {r3, pc}
.L_48:
    ldrh r2, [ip]
    mov r1, r3, lsl #0x1a
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3ecc
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
