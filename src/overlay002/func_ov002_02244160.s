; func_ov002_02244160 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021f208c
        .extern func_ov002_021f27b4
        .extern func_ov002_0223dcc0
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_02244160
        .arm
func_ov002_02244160:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_10c
    b .L_2c
    b .L_b4
    b .L_70
    b .L_b4
.L_2c:
    ldrh r0, [r4, #0x2]
    mov r1, #0x7c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_70:
    ldrh r0, [r4, #0x2]
    mov r1, #0x64
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_b4:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_f4
    ldr r1, _LIT3
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_f4:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_10c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_021f27b4
_LIT2: .word func_ov002_021f208c
_LIT3: .word data_ov002_022d016c
