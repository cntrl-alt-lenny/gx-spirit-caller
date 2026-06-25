; func_0201ca60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218fddc
        .extern data_0218fdfc
        .extern data_0218fe2c
        .extern data_0219012c
        .extern func_02092660
        .extern func_020926d0
        .extern func_020943b0
        .global func_0201ca60
        .arm
func_0201ca60:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, _LIT0
    mov r6, r1
    mov r5, r2
    bl func_020926d0
    ldr r0, _LIT1
    ldr r4, _LIT2
    ldr r3, [r0, #0x1c]
    ldr ip, [r0]
    cmp r3, ip
    beq .L_50
    ldr r2, _LIT3
.L_34:
    mov r0, r3, lsl #0x1
    ldrh r1, [r2, r0]
    add r0, r3, #0x1
    and r3, r0, #0x1f
    cmp r3, ip
    add r4, r4, r1
    bne .L_34
.L_50:
    cmp r5, #0x0
    beq .L_9c
    ldr r0, _LIT3
    mov r1, ip, lsl #0x1
    ldrh r1, [r0, r1]
    add r0, r7, #0x2
    sub r2, r6, #0x2
    add r1, r1, #0x2
    add r1, r4, r1
    bl func_020943b0
    ldr r0, _LIT1
    ldr r3, _LIT3
    ldr r1, [r0]
    sub r0, r6, #0x2
    mov r2, r1, lsl #0x1
    ldrh r1, [r3, r2]
    add r0, r1, r0
    strh r0, [r3, r2]
    b .L_108
.L_9c:
    ldr r0, _LIT3
    mov r1, ip, lsl #0x1
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_d0
    add r1, r0, #0x2
    add r0, r7, #0x2
    add r1, r4, r1
    sub r2, r6, #0x2
    bl func_020943b0
    ldrh r0, [r7]
    strh r0, [r4]
    b .L_e0
.L_d0:
    mov r0, r7
    mov r1, r4
    mov r2, r6
    bl func_020943b0
.L_e0:
    ldr r0, _LIT1
    ldr r4, _LIT3
    ldr r1, [r0]
    mov r3, r1, lsl #0x1
    ldrh r2, [r4, r3]
    add r1, r1, #0x1
    and r1, r1, #0x1f
    add r2, r2, r6
    strh r2, [r4, r3]
    str r1, [r0]
.L_108:
    ldr r0, _LIT0
    bl func_02092660
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0218fdfc
_LIT1: .word data_0218fddc
_LIT2: .word data_0219012c
_LIT3: .word data_0218fe2c
