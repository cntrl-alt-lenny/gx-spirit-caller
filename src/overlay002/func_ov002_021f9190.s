; func_ov002_021f9190 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021d90c0
        .extern func_ov002_021df780
        .extern func_ov002_0226b298
        .global func_ov002_021f9190
        .arm
func_ov002_021f9190:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_4a4
    cmp r0, #0x1
    beq .L_4d4
    b .L_51c
.L_4a4:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b298
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_4d4:
    ldr r0, _LIT1
    ldrh r1, [r4, #0x2]
    ldrh r3, [r0, #0xb0]
    mov r0, #0x3e8
    mov r2, r1, lsl #0x1f
    mul r5, r3, r0
    mov r1, r5
    mov r0, r2, lsr #0x1f
    bl func_ov002_021df780
    ldrh r0, [r4, #0x2]
    mov r2, r5
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d90c0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_51c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
