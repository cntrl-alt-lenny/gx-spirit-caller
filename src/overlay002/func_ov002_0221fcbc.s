; func_ov002_0221fcbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae484
        .extern func_ov002_021c8470
        .extern func_ov002_021de4b0
        .extern func_ov002_021df818
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021ebf40
        .extern func_ov002_022101c4
        .extern func_ov002_02257878
        .extern func_ov002_022593a8
        .extern func_ov002_022593f4
        .global func_ov002_0221fcbc
        .arm
func_ov002_0221fcbc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_128
    b .L_c0
    b .L_8c
    b .L_3c
    b .L_30
.L_30:
    bl func_ov002_022101c4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3c:
    ldr r1, _LIT1
    bl func_ov002_02257878
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_7c
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_84
.L_7c:
    mov r0, #0x68
    bl func_ov002_021ae484
.L_84:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_8c:
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
    bl func_ov002_022593a8
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c0:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT3
    ldr r7, [r0, #0xd70]
    ldr r6, [r0, #0xd74]
    ldr r5, [r0, #0xd78]
    bl func_ov002_021e2b3c
    mov r0, r4
    mov r1, r7
    add r2, r6, r5
    bl func_ov002_021de4b0
    mov r0, r7
    add r1, r6, r5
    bl func_ov002_021c8470
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_128:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_021ebf40
_LIT2: .word data_ov002_022cd744
_LIT3: .word data_ov002_022d016c
