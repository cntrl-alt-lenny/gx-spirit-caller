; func_020a3840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98fc
        .extern func_020945f4
        .extern func_0209e91c
        .extern func_020a4b6c
        .extern func_020a5d08
        .global func_020a3840
        .arm
func_020a3840:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, _LIT0
    mov r1, r5
    bl func_0209e91c
    cmp r5, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    cmp r5, #0x10
    addcs sp, sp, #0x4
    ldmcsia sp!, {r4, r5, r6, r7, lr}
    bxcs lr
    ldr r2, _LIT1
    sub r4, r5, #0x1
    ldr r0, [r2]
    mov r1, #0x0
    add r0, r0, r4, lsl #0x1
    add r0, r0, #0x1400
    strh r1, [r0, #0x8a]
    ldr r3, [r2]
    ldr r0, _LIT2
    mov r2, #0x4
    add r0, r3, r0
    add r0, r0, r4, lsl #0x2
    bl func_020945f4
    ldr r0, _LIT1
    mov r2, #0x16
    ldr r0, [r0]
    mov r1, #0x0
    add r0, r0, #0x1340
    mla r0, r4, r2, r0
    bl func_020945f4
    mov r0, r5
    bl func_020a5d08
    ldr lr, _LIT1
    mov r2, #0x0
    ldr r1, [lr]
    mvn r0, #0x0
    add r1, r1, r4, lsl #0x1
    add r1, r1, #0x1700
    strh r2, [r1, #0x54]
    ldr r3, [lr]
    add r1, r3, r4
    add r1, r1, #0x1500
    ldrsb r2, [r1, #0x26]
    cmp r2, r0
    beq .L_130
    ldr r1, _LIT3
    and r2, r2, #0xff
    mul r1, r2, r1
    add r2, r3, r1
    add ip, r2, #0x1d00
    mov r3, #0x1
    ldrh r6, [ip, #0x4e]
    mvn r2, r3, lsl r5
    and r6, r6, r2
    strh r6, [ip, #0x4e]
    ldr r7, [lr]
    mov r6, r4
    add r7, r7, r1
    add ip, r7, #0x1d00
    ldrh r7, [ip, #0x50]
    orr r3, r7, r3, lsl r5
    strh r3, [ip, #0x50]
    ldr r3, [lr]
    add r3, r3, r6
    add r3, r3, #0x1000
    strb r0, [r3, #0x526]
    ldr r0, [lr]
    add r0, r0, r1
    add r0, r0, #0x1d00
    ldrh r1, [r0, #0x4c]
    and r1, r1, r2
    strh r1, [r0, #0x4c]
.L_130:
    ldr r1, _LIT1
    mov r0, #0x1
    ldr r2, [r1]
    mov r5, r0, lsl r5
    add r0, r2, #0x1500
    ldrh r0, [r0, #0x36]
    ands r0, r0, r5
    beq .L_178
    add r0, r2, #0x1000
    ldrb r3, [r0, #0x535]
    mvn r2, r5
    sub r3, r3, #0x1
    strb r3, [r0, #0x535]
    ldr r0, [r1]
    add r0, r0, #0x1500
    ldrh r1, [r0, #0x36]
    and r1, r1, r2
    strh r1, [r0, #0x36]
.L_178:
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, r4, lsl #0x2
    add r0, r0, #0x1000
    str r1, [r0, #0x4e8]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word func_020a4b6c
_LIT1: .word data_021a98fc
_LIT2: .word 0x000014a8
_LIT3: .word 0x000005d4
