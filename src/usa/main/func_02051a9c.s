; func_02051a9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dbd4
        .extern data_0219dbd5
        .extern data_0219dbd6
        .extern data_0219dbd8
        .extern data_0219dbdc
        .extern func_0204543c
        .extern func_0204547c
        .extern func_0204b35c
        .extern func_0204ffe0
        .extern func_020677dc
        .extern func_020aace8
        .extern func_020aad04
        .extern func_020aae4c
        .global func_02051a9c
        .arm
func_02051a9c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r6, r1
    mov r7, r0
    mov r5, r2
    beq .L_1c
    cmp r5, #0x0
    bne .L_24
.L_1c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_24:
    cmp r7, #0x64
    bcc .L_6c
    sub r2, r7, #0x64
    mov r0, #0xc
    mul r3, r2, r0
    ldr r0, _LIT0
    ldrb r0, [r0, r3]
    cmp r0, #0x0
    beq .L_6c
    ldr r0, _LIT1
    ldr r0, [r0, r3]
    cmp r0, #0x0
    beq .L_7c
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_7c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_6c:
    bl func_0204b35c
    movs r7, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_7c:
    sub r1, r7, #0x64
    mov r0, #0xc
    mul r4, r1, r0
    ldr r1, _LIT0
    ldr r0, _LIT2
    strb r7, [r1, r4]
    mov r2, #0x1
    ldr r1, _LIT3
    strb r2, [r0, r4]
    mov r2, #0x0
    ldr r0, _LIT1
    strh r2, [r1, r4]
    ldr r1, [r0, r4]
    cmp r1, #0x0
    beq .L_c0
    mov r0, #0x4
    bl func_0204543c
.L_c0:
    mov r0, r6
    ldr r8, _LIT1
    bl func_020aace8
    add r1, r0, #0x1
    mov r0, #0x4
    bl func_0204547c
    str r0, [r8, r4]
    ldr r0, [r8, r4]
    cmp r0, #0x0
    bne .L_fc
    ldr r1, _LIT4
    mov r0, #0x9
    bl func_0204ffe0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_fc:
    mov r1, r6
    bl func_020aad04
    ldr r1, _LIT5
    mov r0, r8
    str r5, [r1, r4]
    ldr r1, [r0, r4]
    mov r0, r7
    bl func_020677dc
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219dbd4
_LIT1: .word data_0219dbd8
_LIT2: .word data_0219dbd5
_LIT3: .word data_0219dbd6
_LIT4: .word 0xfffec77f
_LIT5: .word data_0219dbdc
