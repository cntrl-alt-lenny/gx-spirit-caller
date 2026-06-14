; func_ov011_021d0cac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d334a
        .extern data_ov011_021d403c
        .extern func_0208bf3c
        .extern func_ov011_021d0ffc
        .extern func_ov011_021d1080
        .extern func_ov011_021d11f0
        .extern func_ov011_021d1210
        .global func_ov011_021d0cac
        .arm
func_ov011_021d0cac:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r8, #0x0
    ldr r9, [sp, #0x34]
    ldr r6, [sp, #0x30]
    str r2, [sp]
    mvn sl, #-2147483648
    mov r7, #0x1
    mov fp, r8
    mov r5, r8
    mov r4, #0x800
.L_30:
    mov r0, r7
    bl func_ov011_021d1210
    cmp r0, #0x0
    beq .L_d0
    mov r0, r7
    bl func_ov011_021d11f0
    cmp r0, #0x0
    beq .L_d0
    mov r0, r7
    bl func_ov011_021d0ffc
    cmp r0, #0x0
    beq .L_70
    mov r0, r7
    bl func_ov011_021d0ffc
    cmp r0, #0x2
    bne .L_d0
.L_70:
    mov r0, r7
    add r1, sp, #0x8
    add r2, sp, #0x4
    bl func_ov011_021d1080
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    sub r3, r9, r1
    sub r0, r6, r0
    smull r2, r1, r3, r3
    smull ip, r3, r0, r0
    mov r0, #0x800
    adds r0, ip, r0
    adc r3, r3, fp
    adds r2, r2, r4
    mov r0, r0, lsr #0xc
    adc r1, r1, r5
    mov r2, r2, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_0208bf3c
    cmp sl, r0
    movgt sl, r0
    movgt r8, r7
.L_d0:
    add r7, r7, #0x1
    cmp r7, #0xa
    blt .L_30
    ldr r0, _LIT0
    mov r7, #0x0
    ldr r1, [r0, #0x268]
    mov r0, #0x72
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x1c
    sub r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT1
    ldrb r0, [r1, r2]
    add r6, r1, r2
    cmp r0, #0x0
    ble .L_17c
    ldr r5, [sp, #0x30]
    mov r4, r7
    mov fp, #0x800
.L_11c:
    add r0, r6, r7, lsl #0x2
    ldrh r1, [r0, #0xc]
    ldrh r0, [r0, #0xa]
    rsb ip, r9, r1, lsl #0xc
    rsb r0, r5, r0, lsl #0xc
    smull r3, r2, r0, r0
    smull r1, r0, ip, ip
    adds r3, r3, #0x800
    adc ip, r2, #0x0
    adds r1, r1, fp
    mov r2, r3, lsr #0xc
    adc r0, r0, r4
    mov r1, r1, lsr #0xc
    orr r2, r2, ip, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    bl func_0208bf3c
    cmp sl, r0
    movgt sl, r0
    addgt r8, r7, #0x11
    ldrb r0, [r6]
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_11c
.L_17c:
    mvn r1, #-2147483648
    ldr r0, [sp]
    cmp sl, r1
    moveq sl, #0x0
    str r8, [r0]
    mov r0, sl
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_ov011_021d403c
_LIT1: .word data_ov011_021d334a
