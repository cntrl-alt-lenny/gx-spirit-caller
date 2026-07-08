; func_ov002_02243e50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0d8c
        .extern func_ov002_0223d9e0
        .extern func_ov002_0226afc0
        .extern func_ov002_0226b000
        .extern func_ov002_0226b068
        .global func_ov002_02243e50
        .arm
func_ov002_02243e50:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_288
    b .L_1a0
    b .L_1d4
    b .L_218
    b .L_244
.L_1a0:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0xff
    bl func_ov002_0226b000
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_1d4:
    ldr r1, _LIT1
    ldrh r1, [r1, #0xb2]
    bl func_ov002_0223d9e0
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldrh r2, [r0, #0xb2]
    rsb r0, r3, #0x1
    bl func_ov002_0226afc0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_218:
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
.L_244:
    ldr r1, _LIT1
    ldrh r1, [r1, #0xb0]
    bl func_ov002_0223d9e0
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT3
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
.L_288:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word 0x0000171f
_LIT3: .word 0x00001357
