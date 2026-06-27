; func_ov002_0222d554 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bb718
        .extern func_ov002_021de318
        .extern func_ov002_021e0f5c
        .extern func_ov002_02210014
        .extern func_ov002_0225761c
        .global func_ov002_0222d554
        .arm
func_ov002_0222d554:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r3, r2, lsl #0x12
    mov r3, r3, lsr #0x1e
    cmp r3, #0x2
    bne .L_24
    bl func_ov002_02210014
    ldmia sp!, {r4, pc}
.L_24:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4]
    mov r0, r2, lsl #0x1f
    mov r2, r2, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bb718
    cmp r0, #0x2
    blt .L_80
    ldrh r0, [r4, #0x2]
    mov r1, #0x3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e0f5c
    mov r0, r4
    bl func_ov002_0225761c
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de318
.L_80:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
