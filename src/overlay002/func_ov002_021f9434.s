; func_ov002_021f9434 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae4bc
        .extern func_ov002_021decdc
        .extern func_ov002_021df62c
        .extern func_ov002_022536e8
        .extern func_ov002_0226b094
        .global func_ov002_021f9434
        .arm
func_ov002_021f9434:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_2c
    cmp r0, #0x1
    beq .L_10c
    cmp r0, #0x2
    beq .L_198
    b .L_1a0
.L_2c:
    ldrh r1, [r4, #0x2]
    ldr lr, _LIT1
    ldrh r2, [r4, #0x4]
    mov r0, r1, lsl #0x1f
    mov r3, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    and ip, r0, #0x1
    mla lr, ip, r1, lr
    mov r3, r3, lsr #0x1b
    mov r1, #0x14
    mul ip, r3, r1
    add r3, lr, #0x30
    ldr r3, [r3, ip]
    mov ip, r2, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov ip, ip, lsr #0x17
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    subne r0, r1, #0x15
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT3
    mov r2, #0x0
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    ldrh r1, [r4]
    bne .L_c0
    bl func_ov002_022536e8
    cmp r0, #0x0
    movgt r1, #0x1
    ldr r0, _LIT4
    movle r1, #0x0
    str r1, [r0, #0xd44]
    b .L_f4
.L_c0:
    bl func_ov002_022536e8
    cmp r0, #0x0
    ldrh r1, [r4, #0x4]
    bne .L_e4
    mov r1, r1, lsl #0x11
    ldr r0, _LIT5
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae4bc
    b .L_f4
.L_e4:
    mov r1, r1, lsl #0x11
    mov r0, #0xec
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae4bc
.L_f4:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_10c:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    beq .L_160
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r3, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021decdc
    b .L_190
.L_160:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b094
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_190:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_198:
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_1a0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cd744
_LIT4: .word data_ov002_022d016c
_LIT5: .word 0x00000142
_LIT6: .word 0x000010d6
