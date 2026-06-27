; func_ov002_0222c2ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf18c
        .extern func_ov002_021e267c
        .extern func_ov002_02210014
        .global func_ov002_0222c2ec
        .arm
func_ov002_0222c2ec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, r1
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e267c
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_524
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r3, r2, r0
    ldrh r0, [r1, r3]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    ldr r0, _LIT3
    add r1, r1, r3
    ldr r1, [r1, #0xf8]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    cmp r1, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_02210014
    ldmia sp!, {r3, r4, r5, pc}
.L_524:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf18c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x0000175e
