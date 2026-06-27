; func_ov002_0221e560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021df728
        .extern func_ov002_021e050c
        .extern func_ov002_0220e898
        .global func_ov002_0221e560
        .arm
func_ov002_0221e560:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r3, r2, lsl #0x12
    movs r3, r3, lsr #0x1e
    bne .L_15c4
    bl func_ov002_0220e898
    ldrh r0, [r4, #0x2]
    mov r1, #0x258
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e050c
    ldrh r0, [r4, #0x2]
    mov r1, #0x258
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e050c
    b .L_15e0
.L_15c4:
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r1, r1, r2, lsr #0x1f
    rsb r1, r1, #0x1
    mov r2, #0x64
    bl func_ov002_021df728
.L_15e0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
