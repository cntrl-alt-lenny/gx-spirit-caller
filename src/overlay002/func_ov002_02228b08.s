; func_ov002_02228b08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021b99b4
        .extern func_ov002_021d7d0c
        .extern func_ov002_021e276c
        .extern func_ov002_0223def4
        .global func_ov002_02228b08
        .arm
func_ov002_02228b08:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_80
    cmp r1, #0x80
    bne .L_b0
    mov r1, #0x0
    bl func_ov002_0223def4
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b99b4
    movs ip, r0
    movmi r0, #0x0
    ldmmiia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r3, _LIT1
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r2, r1, #0x1
    mla r0, r2, r0, r3
    add r0, r0, #0x18
    add r2, r0, #0x400
    mov r0, r4
    add r2, r2, ip, lsl #0x2
    bl func_ov002_021d7d0c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_80:
    mov r1, #0x0
    bl func_ov002_0223def4
    mov r2, r0, lsl #0x10
    ldrh r1, [r4, #0x2]
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    mov r0, r1, lsl #0x1f
    ldrh r1, [r4]
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e276c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_b0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
