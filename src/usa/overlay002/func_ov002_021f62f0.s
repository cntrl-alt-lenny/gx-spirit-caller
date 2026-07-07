; func_ov002_021f62f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021debec
        .extern func_ov002_022574e0
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .global func_ov002_021f62f0
        .arm
func_ov002_021f62f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b4]
    cmp r0, #0x0
    beq .L_3c
    cmp r0, #0x1
    beq .L_7c
    b .L_ec
.L_3c:
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x3a
    bl func_ov002_021ae320
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_7c:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_d4
    ldr r2, _LIT2
    ldr r0, _LIT3
    ldr r1, [r2, #0xd70]
    ldr r3, _LIT4
    and ip, r1, #0x1
    mla r3, ip, r0, r3
    ldr ip, [r2, #0xd74]
    ldr r2, [r2, #0xd78]
    mov r0, #0x14
    add r2, ip, r2
    mla r0, r2, r0, r3
    ldr r3, [r0, #0x30]
    mov r0, r4
    mov r3, r3, lsl #0x13
    mov r3, r3, lsr #0x13
    strh r3, [r4, #0xa]
    bl func_ov002_021debec
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_d4:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_ec:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_022574e0
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf08c
