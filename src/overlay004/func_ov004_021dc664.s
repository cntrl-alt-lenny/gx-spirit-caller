; func_ov004_021dc664 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).
; Thumb gap-object mode (brief 406 stretch).

        .text
        .extern data_ov004_0220a2f8
        .extern data_ov004_02291618
        .extern data_ov004_0229161c
        .extern func_ov004_021dbd6c
        .extern func_ov004_021dbe5c
        .extern func_ov004_021dbe68
        .extern func_ov004_021dc020
        .extern func_ov004_021dc350
        .extern func_ov004_021dc3b8
        .extern func_ov004_021dc418
        .extern func_ov004_021dc474
        .extern func_ov004_021dd590
        .extern func_ov004_021de23c
        .extern func_ov004_021de250
        .global func_ov004_021dc664
        .thumb
func_ov004_021dc664:
    push {r4, r5, r6, r7, lr}
    sub sp, #0x24
    add r7, r1, #0x0
    str r2, [sp, #0xc]
    mov r1, #0x0
    add r0, sp, #0x10
    strb r1, [r0, #0x0]
    strh r1, [r0, #0x2]
    strh r1, [r0, #0x4]
    ldr r0, _LIT0
    ldr r5, [r0, #0x0]
    add r0, r5, #0x0
    ldr r2, _LIT1
    bl func_ov004_021dbe5c
    ldr r0, _LIT2
    bl func_ov004_021de250
    add r4, r0, #0x0
    cmp r4, #0x0
    bne .L_130
    mov r0, #0x2
    bl func_ov004_021dd590
    mov r0, #0x0
    mvn r0, r0
    add sp, #0x24
    pop {r4, r5, r6, r7}
    pop {r3}
    bx r3
.L_130:
    mov r1, #0x0
    ldr r2, _LIT2
    bl func_ov004_021dbe5c
    add r6, r5, #0x0
    add r6, #0x18
    ldr r0, _LIT3
    add r1, r7, #0x0
    mov r2, #0x8
    bl func_ov004_021dbe68
    add r0, sp, #0x14
    add r0, #0x2
    ldr r1, _LIT3
    mov r2, #0x8
    bl func_ov004_021dbe68
    add r0, r4, #0x4
    bl func_ov004_021dc474
    add r1, sp, #0x10
    strh r0, [r1, #0x2]
    mov r0, #0x2
    ldrsh r0, [r1, r0]
    cmp r0, #0x0
    bge .L_180
    mov r0, #0x3
    bl func_ov004_021dd590
    cmp r4, #0x0
    beq .L_174
    add r0, r4, #0x0
    bl func_ov004_021de23c
.L_174:
    mov r0, #0x0
    mvn r0, r0
    add sp, #0x24
    pop {r4, r5, r6, r7}
    pop {r3}
    bx r3
.L_180:
    mov r0, #0x0
    strb r0, [r4, #0x0]
    ldrh r0, [r1, #0x2]
    bl func_ov004_021dbd6c
    strh r0, [r4, #0x2]
    add r1, sp, #0x10
    mov r0, #0x2
    ldrsh r0, [r1, r0]
    add r0, r0, #0x4
    strh r0, [r1, #0x2]
    add r0, sp, #0x14
    str r0, [sp, #0x0]
    add r0, sp, #0x10
    str r0, [sp, #0x4]
    mov r0, #0x0
    add r1, r6, #0x0
    add r2, r4, #0x0
    add r3, sp, #0x10
    add r3, #0x2
    bl func_ov004_021dc418
    add r1, sp, #0x10
    mov r0, #0x4
    ldrsh r2, [r1, r0]
    mov r0, #0x10
    orr r2, r0
    strh r2, [r1, #0x4]
    add r0, sp, #0x14
    add r0, #0x2
    mov r1, #0x8
    ldr r2, _LIT4
    mov r3, #0x6
    bl func_ov004_021dc020
    cmp r0, #0x0
    beq .L_1e6
    mov r0, #0x2
    bl func_ov004_021dd590
    cmp r4, #0x0
    beq .L_1da
    add r0, r4, #0x0
    bl func_ov004_021de23c
.L_1da:
    mov r0, #0x0
    mvn r0, r0
    add sp, #0x24
    pop {r4, r5, r6, r7}
    pop {r3}
    bx r3
.L_1e6:
    add r3, sp, #0x10
    mov r0, #0x0
    ldrsb r0, [r3, r0]
    str r0, [sp, #0x0]
    mov r0, #0x11
    str r0, [sp, #0x4]
    add r0, sp, #0x14
    add r0, #0x2
    str r0, [sp, #0x8]
    add r0, r5, #0x0
    ldr r1, _LIT5
    mov r2, #0x2
    ldrsh r2, [r3, r2]
    mov r6, #0x4
    ldrsh r3, [r3, r6]
    bl func_ov004_021dc3b8
    add r2, sp, #0x10
    mov r1, #0x2
    ldrsh r0, [r2, r1]
    add r0, #0x18
    strh r0, [r2, #0x2]
    add r0, r5, #0x0
    ldrsh r1, [r2, r1]
    mov r2, #0xff
    ldr r3, [sp, #0xc]
    bl func_ov004_021dc350
    cmp r4, #0x0
    beq .L_228
    add r0, r4, #0x0
    bl func_ov004_021de23c
.L_228:
    mov r0, #0x0
    add sp, #0x24
    pop {r4, r5, r6, r7}
    pop {r3}
    bx r3
    nop
    .align 2
_LIT0: .word data_ov004_02291618
_LIT1: .word 0x000005dc
_LIT2: .word 0x00000210
_LIT3: .word data_ov004_0229161c
_LIT4: .word data_ov004_0220a2f8
_LIT5: .word 0x00001000
