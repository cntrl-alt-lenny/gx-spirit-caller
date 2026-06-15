; func_0205cf10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100b64
        .extern data_02100cb8
        .extern data_02100cd0
        .extern data_02100cf0
        .extern data_02100cf8
        .extern data_02100d00
        .extern data_02100d08
        .extern data_02100d10
        .extern data_02100d18
        .extern data_02100d20
        .extern data_02100d28
        .extern func_02054868
        .extern func_02057b00
        .extern func_02058070
        .extern func_020602c4
        .extern func_020a6d54
        .extern func_020a978c
        .extern func_020aaddc
        .extern func_020aaf40
        .extern func_020ab054
        .extern func_020ab0c4
        .extern func_020ace00
        .global func_0205cf10
        .arm
func_0205cf10:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x184
    mov r5, r1
    ldr r1, [r5]
    mov r6, r0
    cmp r1, #0x68
    ldr r4, [r6]
    beq .L_750
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xc1
    bl func_020a6d54
.L_750:
    add r1, sp, #0xc
    ldr r0, _LIT2
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r5, #0x8]
    add r3, sp, #0x8
    mov r0, r6
    add r2, r5, #0x18
    bl func_02057b00
    cmp r0, #0x0
    addne sp, sp, #0x184
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    movne r0, #0x6a
    strne r0, [r5]
    addne sp, sp, #0x184
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x18]
    ldr r1, _LIT3
    bl func_020ab0c4
    cmp r0, #0x0
    beq .L_92c
    mov r1, #0x0
    strb r1, [r0]
    ldr r7, [r5, #0x18]
    ldr r1, _LIT4
    mov r0, r7
    mov r2, #0x6
    bl func_020ab054
    cmp r0, #0x0
    bne .L_910
    ldr r1, _LIT5
    add r2, sp, #0x10
    mov r0, r7
    mov r3, #0x10
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x6a
    streq r0, [r5]
    addeq sp, sp, #0x184
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    add r0, sp, #0x10
    bl func_020ace00
    mov r7, r0
    ldr r0, [r5, #0x18]
    ldr r1, _LIT6
    add r2, sp, #0x20
    mov r3, #0x1f
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x6a
    streq r0, [r5]
    addeq sp, sp, #0x184
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x18]
    ldr r1, _LIT7
    add r2, sp, #0x3f
    mov r3, #0x21
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x6a
    streq r0, [r5]
    addeq sp, sp, #0x184
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    str r7, [sp]
    ldr r2, _LIT8
    ldr r3, [r4, #0x1a0]
    ldr r1, _LIT9
    add r0, sp, #0x81
    add r2, r4, r2
    bl func_020a978c
    add r0, sp, #0x81
    bl func_020aaddc
    mov r1, r0
    add r0, sp, #0x81
    add r2, sp, #0x60
    bl func_02054868
    add r0, sp, #0x3f
    add r1, sp, #0x60
    bl func_020aaf40
    cmp r0, #0x0
    beq .L_8e0
    ldr r2, _LIT10
    mov r0, r6
    add r1, r5, #0x28
    bl func_02058070
    ldr r2, _LIT3
    mov r0, r6
    add r1, r5, #0x28
    bl func_02058070
    mov r0, #0x6a
    str r0, [r5]
    add sp, sp, #0x184
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_8e0:
    ldr r2, _LIT11
    mov r0, r6
    add r1, r5, #0x28
    bl func_02058070
    ldr r2, _LIT3
    mov r0, r6
    add r1, r5, #0x28
    bl func_02058070
    mov r0, #0x69
    str r0, [r5]
    str r7, [r5, #0xc]
    b .L_924
.L_910:
    mov r0, #0x6a
    str r0, [r5]
    add sp, sp, #0x184
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_924:
    mov r0, #0x0
    str r0, [r5, #0x20]
.L_92c:
    mov r0, #0x0
    add sp, sp, #0x184
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02100cd0
_LIT1: .word data_02100b64
_LIT2: .word data_02100cb8
_LIT3: .word data_02100cf0
_LIT4: .word data_02100cf8
_LIT5: .word data_02100d00
_LIT6: .word data_02100d08
_LIT7: .word data_02100d10
_LIT8: .word 0x00000177
_LIT9: .word data_02100d18
_LIT10: .word data_02100d20
_LIT11: .word data_02100d28
