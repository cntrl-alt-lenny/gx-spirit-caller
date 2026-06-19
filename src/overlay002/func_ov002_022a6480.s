; func_ov002_022a6480 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037208
        .extern func_ov002_022a60f4
        .extern func_ov002_022a6324
        .global func_ov002_022a6480
        .arm
func_ov002_022a6480:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldrh r1, [r4]
    mov r5, r0
    mov ip, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r1, ip, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a6324
    cmp r0, #0x0
    beq .L_aec
    ldrh r3, [r4]
    mov r1, #0x8
    mov r2, #0x0
    strh r3, [r0, #0xa]
    strh r1, [r0, #0x4]
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r3, #0x1
    bl func_02037208
.L_aec:
    ldrh r1, [r4]
    mov r0, r5
    mov r4, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r1, r4, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a60f4
    ldmia sp!, {r3, r4, r5, pc}
