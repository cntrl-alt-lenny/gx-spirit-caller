; func_ov002_02205a40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_ov002_021b939c
        .global func_ov002_02205a40
        .arm
func_ov002_02205a40:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x14]
    mov r4, r0, lsr #0x3
    mov r0, r4
    bl func_ov002_021b939c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xf
    bne .L_170
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x11
    cmp r4, r0, lsr #0x17
    bne .L_168
    ldr r0, _LIT0
    mov r1, r4, lsl #0x2
    ldrh r0, [r0, r1]
    ldrh r1, [r5]
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x13
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_168:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_170:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0170
