; func_ov002_0221771c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0226ad5c
        .extern func_ov002_0226af38
        .global func_ov002_0221771c
        .arm
func_ov002_0221771c:
    stmdb sp!, {r4, lr}
    ldrh r1, [r0, #0x4]
    ldrh r2, [r0, #0x8]
    mov r0, r1, lsl #0x1d
    movs r0, r0, lsr #0x1f
    and r4, r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_98
    cmp r0, #0x7f
    beq .L_7c
    cmp r0, #0x80
    bne .L_a4
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_021e2b3c
    mov r1, #0x1
    mov r0, r4
    mov r2, r1
    bl func_ov002_0226af38
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_7c:
    mov r1, #0x1
    mov r0, r4
    mov r3, r1
    mov r2, #0x0
    bl func_ov002_0226ad5c
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_98:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_a4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
