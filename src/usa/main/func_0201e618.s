; func_0201e618 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208ff60
        .extern func_0208ffb8
        .extern func_0209002c
        .extern func_02090074
        .extern func_020900e4
        .extern func_02090248
        .extern func_0209281c
        .global func_0201e618
        .arm
func_0201e618:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldrh r6, [r0, #0xe]
    ldrh r3, [r0, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r6, #0x0
    add r7, r0, r3
    mov r8, #0x0
    ble .L_164
    sub r0, r5, #0x40000
    mov r0, r0, lsr #0x1
    mov fp, r5, lsr #0x1
    str r0, [sp]
.L_34:
    ldr r1, [r7]
    ldr r0, _LIT0
    cmp r1, r0
    beq .L_8c
    ldr r0, _LIT1
    cmp r1, r0
    bne .L_150
    ldr r0, [r7, #0x8]
    movs r9, r0, lsl #0x1
    beq .L_150
    cmp r4, #0x0
    blt .L_150
    mov r1, r9
    add r0, r7, #0xc
    bl func_0209281c
    bl func_0209002c
    mov r2, r9
    add r0, r7, #0xc
    mov r1, r4
    bl func_0208ffb8
    bl func_0208ff60
    b .L_150
.L_8c:
    ldr r9, [r7, #0x10]
    add sl, r7, #0x14
    cmp r9, #0x0
    beq .L_150
    cmp r5, #0x0
    blt .L_150
    ldrb r0, [r7, #0x8]
    cmp r0, #0x5
    bne .L_12c
    ldrb r0, [r7, #0x9]
    ldrb r2, [r7, #0xa]
    mov r1, r9
    add r3, r0, #0x3
    mov r0, #0x1
    add r2, r2, #0x3
    mov r3, r0, lsl r3
    mov r0, r0, lsl r2
    mul r2, r3, r0
    mov r0, r2, asr #0x1
    add r2, r2, r0, lsr #0x1e
    mov r0, sl
    mov r9, r2, asr #0x2
    bl func_0209281c
    bl func_02090248
    mov r0, sl
    mov r1, r5
    mov r2, r9
    bl func_020900e4
    cmp r5, #0x20000
    add r2, r9, r9, lsr #0x1f
    ldrcs r0, [sp]
    addcc r1, fp, #0x20000
    addcs r1, r0, #0x30000
    add r0, r9, #0x3
    bic r0, r0, #0x3
    add r0, sl, r0
    mov r2, r2, asr #0x1
    bl func_020900e4
    bl func_02090074
    b .L_150
.L_12c:
    mov r0, sl
    mov r1, r9
    bl func_0209281c
    bl func_02090248
    mov r0, sl
    mov r2, r9
    mov r1, r5
    bl func_020900e4
    bl func_02090074
.L_150:
    ldr r0, [r7, #0x4]
    add r8, r8, #0x1
    cmp r8, r6
    add r7, r7, r0
    blt .L_34
.L_164:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x45474d49
_LIT1: .word 0x544c4150
