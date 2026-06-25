; func_ov002_0222eefc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202b89c
        .extern func_ov002_021df728
        .extern func_ov002_021e267c
        .extern func_ov002_0223de04
        .global func_ov002_0222eefc
        .arm
func_ov002_0222eefc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_220
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e267c
.L_220:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de04
    ldr r1, _LIT0
    mov r0, r0, lsl #0x2
    ldrh r0, [r1, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0170
