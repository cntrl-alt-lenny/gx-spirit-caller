; func_0201cbd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218febc
        .extern data_0218fedc
        .extern data_0218ff0c
        .extern data_021901bc
        .extern data_0219020c
        .extern func_02092748
        .extern func_020927b8
        .extern func_020944a4
        .global func_0201cbd8
        .arm
func_0201cbd8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r1
    ldr r3, [r2, #0x1c]
    ldr r2, [r2]
    cmp r2, r3
    beq .L_248
    ldr r2, _LIT1
    ldrh r2, [r2, #0x50]
    mov r2, r2, asr #0x8
    cmp r2, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    mov r2, r3, lsl #0x1
    ldrh r4, [r0, r2]
    ldr r0, _LIT3
    mov r2, r4
    bl func_020944a4
    ldrh r1, [r5]
    ldr r2, _LIT4
    ldr r0, _LIT5
    and r1, r1, #0xff
    strh r1, [r5]
    ldrh r5, [r2]
    mov r1, #0x0
    strh r1, [r2]
    bl func_020927b8
    ldr r1, _LIT0
    ldr r3, _LIT2
    ldr ip, [r1, #0x1c]
    mov r0, #0x0
    add r2, ip, #0x1
    mov ip, ip, lsl #0x1
    and lr, r2, #0x1f
    strh r0, [r3, ip]
    str lr, [r1, #0x1c]
    ldr ip, [r1]
    cmp lr, ip
    beq .L_1e0
.L_1c4:
    mov r1, lr, lsl #0x1
    ldrh r2, [r3, r1]
    add r1, lr, #0x1
    and lr, r1, #0x1f
    cmp lr, ip
    add r0, r0, r2
    bne .L_1c4
.L_1e0:
    ldr r1, _LIT2
    mov r2, ip, lsl #0x1
    ldrh r2, [r1, r2]
    mov r1, #0x0
    add r0, r0, r2
    add r0, r0, r0, lsr #0x1f
    mov lr, r0, asr #0x1
    cmp lr, #0x0
    ble .L_22c
    add r0, r4, r4, lsr #0x1f
    ldr ip, _LIT3
    mov r0, r0, asr #0x1
    add r2, ip, r0, lsl #0x1
.L_214:
    mov r3, r1, lsl #0x1
    ldrh r0, [r3, r2]
    add r1, r1, #0x1
    cmp r1, lr
    strh r0, [ip, r3]
    blt .L_214
.L_22c:
    ldr r0, _LIT5
    bl func_02092748
    ldr r2, _LIT4
    mov r0, r4
    ldrh r1, [r2]
    strh r5, [r2]
    ldmia sp!, {r3, r4, r5, pc}
.L_248:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0218febc
_LIT1: .word data_021901bc
_LIT2: .word data_0218ff0c
_LIT3: .word data_0219020c
_LIT4: .word 0x04000208
_LIT5: .word data_0218fedc
