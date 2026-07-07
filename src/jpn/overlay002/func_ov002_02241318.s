; func_ov002_02241318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0d8c
        .extern func_ov002_021d8fd0
        .extern func_ov002_0223d9e0
        .extern func_ov002_0226afc0
        .extern func_ov002_0226b068
        .global func_ov002_02241318
        .arm
func_ov002_02241318:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x0
    beq .L_288
    cmp r0, #0x1
    beq .L_2b4
    cmp r0, #0x2
    beq .L_2fc
    b .L_334
.L_288:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b068
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_2b4:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r3, r1, lsl #0x1f
    ldrh r2, [r0, #0xb0]
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8fd0
    ldr r1, _LIT1
    mov r0, r4
    ldrh r1, [r1, #0xb0]
    bl func_ov002_0223d9e0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_2fc:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldrh r2, [r0, #0xb0]
    rsb r0, r3, #0x1
    bl func_ov002_0226afc0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_334:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word 0x00001357
