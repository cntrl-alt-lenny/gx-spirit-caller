; func_ov002_022425ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021c92ec
        .extern func_ov002_0223dad0
        .extern func_ov002_0223de94
        .extern func_ov002_0223fb48
        .extern func_ov002_0226b0b0
        .extern func_ov002_0226b0f0
        .global func_ov002_022425ac
        .arm
func_ov002_022425ac:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5b8]
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_e4
    b .L_2c
    b .L_2c
    b .L_48
    b .L_a0
.L_2c:
    bl func_ov002_0223fb48
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x2
    strne r1, [r0, #0x5b8]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_48:
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c92ec
    mov r2, #0x1
    mov r3, r2, lsl r0
    ldrh r1, [r4, #0x2]
    eor r3, r3, #0xff
    mov r0, r1, lsl #0x1f
    ldrh r1, [r4]
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b0f0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_a0:
    ldr r1, _LIT1
    ldrh r5, [r1, #0xb2]
    mov r1, r5
    bl func_ov002_0223dad0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b0b0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_e4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
_LIT2: .word 0x0000171f
