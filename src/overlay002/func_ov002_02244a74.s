; func_ov002_02244a74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_0223de04
        .extern func_ov002_0226b194
        .global func_ov002_02244a74
        .arm
func_ov002_02244a74:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x5
    bne .L_84
    ldr r1, _LIT0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x0
    beq .L_34
    cmp r1, #0x1
    beq .L_64
    b .L_84
.L_34:
    mov r1, r2, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldrh r1, [r0]
    rsb r0, r2, #0x1
    mov r2, #0x0
    bl func_ov002_0226b194
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, pc}
.L_64:
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    ldrh r3, [r1, #0xb2]
    mov r1, r2, lsr #0x1f
    mov r2, #0xe
    bl func_ov002_0223de04
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_84:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
