; func_ov002_0221fbcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021c8390
        .extern func_ov002_021de3c0
        .extern func_ov002_021df728
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021ebe50
        .extern func_ov002_022100d4
        .extern func_ov002_02257790
        .extern func_ov002_022592c0
        .extern func_ov002_0225930c
        .global func_ov002_0221fbcc
        .arm
func_ov002_0221fbcc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_f18
    b .L_eb0
    b .L_e7c
    b .L_e2c
    b .L_e20
.L_e20:
    bl func_ov002_022100d4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_e2c:
    ldr r1, _LIT1
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_e6c
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_e74
.L_e6c:
    mov r0, #0x68
    bl func_ov002_021ae3a4
.L_e74:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_e7c:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022592c0
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_eb0:
    bl func_ov002_0225930c
    cmp r0, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT3
    ldr r7, [r0, #0xd70]
    ldr r6, [r0, #0xd74]
    ldr r5, [r0, #0xd78]
    bl func_ov002_021e2a4c
    mov r0, r4
    mov r1, r7
    add r2, r6, r5
    bl func_ov002_021de3c0
    mov r0, r7
    add r1, r6, r5
    bl func_ov002_021c8390
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_f18:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_021ebe50
_LIT2: .word data_ov002_022cd664
_LIT3: .word data_ov002_022d008c
