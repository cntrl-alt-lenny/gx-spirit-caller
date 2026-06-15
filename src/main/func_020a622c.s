; func_020a622c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern WaitByLoop
        .extern data_021a9938
        .extern data_021a993c
        .extern data_021a9960
        .extern data_021a9964
        .extern func_0209065c
        .extern func_02092898
        .extern func_020928cc
        .extern func_02093fb8
        .extern func_020a5e04
        .extern func_020a5e68
        .extern func_020a5e90
        .extern func_020a5f10
        .extern func_020a5f44
        .extern func_020a5f8c
        .global func_020a622c
        .arm
func_020a622c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldr r1, _LIT1
    mov r2, #0x1
    str r2, [r0]
    ldrh r0, [r1]
    ands r0, r0, #0x1
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, #0x40000
    bl func_0209065c
    ldr r3, _LIT2
    mov r2, #0x1
    ldrh r4, [r3]
    ldr r1, _LIT3
    mov r6, r0
    strh r2, [r3]
    ldrh r0, [r1, #0x2]
    add r1, sp, #0x0
    bl func_020a5e90
    ldr r1, _LIT4
    add r0, sp, #0x8
    ldrh r1, [r1]
    and r1, r1, #0x8000
    mov r5, r1, asr #0xf
    bl func_020a5f44
    ldr r3, _LIT4
    ldr r0, _LIT5
    ldrh r2, [r3]
    add r0, r0, #0x80
    mov r1, #0x40
    bic r2, r2, #0x8000
    strh r2, [r3]
    bl func_020928cc
    ldr r2, _LIT5
    ldr r1, _LIT6
    mov r0, #0x1
    mov r3, #0x40
    add r2, r2, #0x80
    bl func_02093fb8
    ldr r2, _LIT4
    add r0, sp, #0x8
    ldrh r1, [r2]
    bic r1, r1, #0x8000
    orr r1, r1, r5, lsl #0xf
    strh r1, [r2]
    bl func_020a5f10
    ldr r0, _LIT3
    add r1, sp, #0x0
    ldrh r0, [r0, #0x2]
    bl func_020a5e68
    ldr r0, _LIT7
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .L_1c4
    ldr r0, _LIT8
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .L_230
.L_1c4:
    ldr r2, _LIT5
    ldr r0, _LIT9
    ldrh r1, [r2, #0xbe]
    mov r3, #0x0
    strh r1, [r0]
.L_1d8:
    add r0, r2, r3
    ldrb r1, [r0, #0xb5]
    add r0, r3, #0x2700000
    add r0, r0, #0xff000
    add r3, r3, #0x1
    strb r1, [r0, #0xc32]
    cmp r3, #0x3
    blt .L_1d8
    ldrh r0, [r2, #0xb0]
    ldr r1, _LIT9
    strh r0, [r1, #0x6]
    ldr r0, [r2, #0xac]
    str r0, [r1, #0x8]
    bl func_020a5f8c
    cmp r0, #0x0
    movne r2, #0x1
    ldr r1, _LIT7
    moveq r2, #0x0
    strb r2, [r1]
    ldr r0, _LIT8
    mov r1, #0x1
    strb r1, [r0]
.L_230:
    ldr r0, _LIT10
    ldr r1, _LIT11
    mov r2, #0x9c
    bl Copy32
    bl func_02092898
    ldr r0, _LIT5
    add r0, r0, #-33554432
    mov r0, r0, lsr #0x5
    mov r0, r0, lsl #0x6
    orr r0, r0, #0x1
    bl func_020a5e04
    ldr r5, _LIT3
    ldrh r0, [r5]
    cmp r0, #0x1
    beq .L_284
    mov r7, #0x1
.L_270:
    mov r0, r7
    bl WaitByLoop
    ldrh r0, [r5]
    cmp r0, #0x1
    bne .L_270
.L_284:
    ldr r2, _LIT2
    mov r0, r6
    ldrh r1, [r2]
    strh r4, [r2]
    bl func_0209065c
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a993c
_LIT1: .word 0x04000300
_LIT2: .word 0x04000208
_LIT3: .word data_021a9938
_LIT4: .word 0x04000204
_LIT5: .word data_021a9960
_LIT6: .word 0x08000080
_LIT7: .word 0x027fff9b
_LIT8: .word 0x027fff9a
_LIT9: .word 0x027ffc30
_LIT10: .word 0xffff0020
_LIT11: .word data_021a9964
