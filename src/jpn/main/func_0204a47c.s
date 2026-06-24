; func_0204a47c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8a0
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204a100
        .extern func_0204a278
        .extern func_0204a478
        .extern func_0204a93c
        .extern func_0204aa80
        .extern func_0204b130
        .extern func_0204c9fc
        .extern func_0204cdc8
        .extern func_0204cf08
        .extern func_0204d210
        .extern func_0204d3c4
        .extern func_0204ecdc
        .extern func_0204f034
        .extern func_02068944
        .extern func_02068968
        .extern func_020689ac
        .extern func_02068c44
        .extern func_02068c54
        .extern func_02068cb0
        .extern func_02092fc8
        .global func_0204a47c
        .arm
func_0204a47c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    cmp r1, #0x0
    beq .L_28
    cmp r1, #0x4
    beq .L_38
    add sp, sp, #0x4
    cmp r1, #0x5
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_28:
    mov r0, r2
    bl func_0204a478
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_38:
    mov r5, #0x0
    bl func_02068c44
    cmp r0, #0x0
    ble .L_88
.L_48:
    mov r0, r6
    mov r1, r5
    bl func_02068c54
    mov r4, r0
    bl func_0204b130
    cmp r0, #0x0
    bne .L_74
    mov r0, r6
    mov r1, r4
    bl func_02068cb0
    sub r5, r5, #0x1
.L_74:
    mov r0, r6
    add r5, r5, #0x1
    bl func_02068c44
    cmp r5, r0
    blt .L_48
.L_88:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x2
    beq .L_b0
    cmp r0, #0x3
    beq .L_1a8
    cmp r0, #0x5
    beq .L_224
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_b0:
    mov r0, r6
    mov r5, #0x0
    bl func_02068c44
    cmp r0, #0x0
    ble .L_140
.L_c4:
    mov r0, r6
    mov r1, r5
    bl func_02068c54
    mov r4, r0
    bl func_0204987c
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_12c
    bl func_0204987c
    mov r7, r0
    mov r0, r4
    bl func_02068968
    ldr r1, [r7, #0x1c]
    cmp r1, r0
    bne .L_12c
    bl func_0204987c
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    beq .L_12c
    bl func_0204987c
    mov r7, r0
    mov r0, r4
    bl func_02068944
    ldrh r1, [r7, #0x1a]
    cmp r1, r0
    beq .L_140
.L_12c:
    mov r0, r6
    add r5, r5, #0x1
    bl func_02068c44
    cmp r5, r0
    blt .L_c4
.L_140:
    mov r0, r6
    bl func_02068c44
    cmp r5, r0
    bge .L_180
    mov r0, #0x3
    bl func_02049868
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1fc]
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    bl func_0204f034
    bl func_0204aa80
    add sp, sp, #0x4
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_180:
    bl func_0204987c
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0xec]
    add sp, sp, #0x4
    str r1, [r4, #0xf0]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1a8:
    mov r0, #0x1
    bl func_0204a278
    bl func_0204a100
    mov r0, r6
    bl func_02068c44
    cmp r0, #0x0
    beq .L_1fc
    mov r0, #0x0
    mov r1, r0
    bl func_0204d210
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x4
    bl func_02049868
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0xe8]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1fc:
    bl func_0204987c
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0xec]
    add sp, sp, #0x4
    str r1, [r4, #0xf0]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_224:
    mov r0, r6
    bl func_02068c44
    cmp r0, #0x0
    beq .L_29c
    mov r4, #0x0
.L_238:
    mov r0, r6
    mov r1, r4
    bl func_02068c54
    mov r5, r0
    bl func_02068968
    mov r7, r0
    bl func_0204987c
    ldr r0, [r0, #0x1b0]
    cmp r7, r0
    bne .L_280
    mov r0, r5
    bl func_02068944
    mov r7, r0
    bl func_0204987c
    add r0, r0, #0x100
    ldrh r0, [r0, #0xac]
    cmp r7, r0
    beq .L_29c
.L_280:
    mov r0, r6
    mov r1, r5
    bl func_02068cb0
    mov r0, r6
    bl func_02068c44
    cmp r0, #0x0
    bne .L_238
.L_29c:
    mov r0, r6
    bl func_02068c44
    cmp r0, #0x0
    beq .L_3a0
    mov r0, r6
    mov r1, #0x0
    bl func_02068c54
    ldr r1, _LIT0
    mov r2, #0x0
    bl func_020689ac
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_36c
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    cmp r4, r0
    bne .L_36c
    mov r0, #0x0
    bl func_0204a278
    cmp r0, #0x0
    beq .L_320
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_36c
    bl func_0204c9fc
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_36c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_320:
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    bl func_0204cdc8
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x4
    bl func_02049868
    bl func_0204987c
    mov r1, r0
    mov r0, #0x0
    ldr r2, [r1, #0xf4]
    mov r1, r0
    bl func_0204cf08
    bl func_0204d3c4
    add sp, sp, #0x4
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_36c:
    mov r0, #0x6
    bl func_02049868
    mov r0, r6
    mov r1, #0x0
    bl func_02068c54
    mov r2, r0
    mov r0, #0x0
    mov r1, r0
    bl func_0204ecdc
    bl func_0204a93c
    add sp, sp, #0x4
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_3a0:
    bl func_0204987c
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0xec]
    str r1, [r4, #0xf0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff8a0
