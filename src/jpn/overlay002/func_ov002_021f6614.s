; func_ov002_021f6614 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d5a90
        .extern func_ov002_021dea38
        .global func_ov002_021f6614
        .arm
func_ov002_021f6614:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    mov r2, r1, lsl #0x12
    mov r2, r2, lsr #0x1e
    cmp r2, #0x2
    beq .L_1f0
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021dea38
    b .L_208
.L_1f0:
    ldrh r2, [r0]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5a90
.L_208:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
