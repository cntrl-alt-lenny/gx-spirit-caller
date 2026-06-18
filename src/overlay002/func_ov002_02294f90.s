; func_ov002_02294f90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c848c
        .extern func_ov002_022576d8
        .extern func_ov002_0228c864
        .extern func_ov002_0228db8c
        .global func_ov002_02294f90
        .arm
func_ov002_02294f90:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_022576d8
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldr r2, _LIT0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0228c864
    movs r1, r0
    bmi .L_88
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c848c
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT1
    add r0, r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    mov r2, r0, asr #0x1
    ldr r1, [r1, r3]
    cmp r1, r0, asr #0x1
    movle r0, #0x1
    ldmleia sp!, {r4, pc}
    cmp r2, #0x3e8
    movgt r0, #0x1
    ldmgtia sp!, {r4, pc}
.L_88:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_ov002_0228db8c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
