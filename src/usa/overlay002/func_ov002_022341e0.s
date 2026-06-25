; func_ov002_022341e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021de318
        .extern func_ov002_021df728
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_02216090
        .global func_ov002_022341e0
        .arm
func_ov002_022341e0:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x78
    beq .L_260
    bl func_ov002_02216090
    ldmia sp!, {r4, pc}
.L_260:
    bl func_ov002_021e2a4c
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x5ac]
    bl func_ov002_021de318
    ldrh r1, [r4, #0x2]
    ldrh r2, [r4, #0x8]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    mov r2, r2, lsr #0x1
    bl func_ov002_021df728
    ldrh r1, [r4, #0x2]
    ldrh r2, [r4, #0x8]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1
    bl func_ov002_021df728
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
