; func_ov002_021ff37c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021ff2cc
        .extern func_ov002_02253600
        .global func_ov002_021ff37c
        .arm
func_ov002_021ff37c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r3, [r6, #0x2]
    mov r2, r3, lsl #0x11
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    eor r4, r2, r3, lsr #0x1f
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_80
    ldr r0, _LIT2
    add r7, r0, r1
.L_54:
    ldrh r1, [r6]
    mov r0, r4
    mov r2, r5
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    bcc .L_54
.L_80:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
