; func_ov004_021ce1ec - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern func_02005dac
        .extern func_ov004_021ca0a4
        .extern func_ov004_021cde38
        .global func_ov004_021ce1ec
        .arm
func_ov004_021ce1ec:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    ldr r4, _LIT0
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_b8
    ldr r0, [r4, #0x68]
    mov r1, #0x1
    cmp r0, #0x100
    addlt r0, r0, #0x10
    strlt r0, [r4, #0x68]
    ldr r0, [r4, #0x68]
    mov ip, #0x0
    cmp r0, #0x0
    rsblt r0, r0, #0x0
    rsb r0, r0, #0x100
    rsb r5, r0, #0x4
    add r0, r4, #0x2f8
    str r1, [sp]
    mov r2, r5
    add r0, r0, #0x5c00
    mov r3, #0x1f
    str ip, [sp, #0x4]
    bl func_ov004_021ca0a4
    add r1, r5, #0x4
    ldr r0, _LIT1
    mov r1, r1, lsl #0x17
    orr r1, r0, r1, lsr #0x7
    add r2, r0, #0x40000006
    str r1, [sp, #0x10]
    mov r0, #0x1
    mov r1, #0x0
    strh r2, [sp, #0x14]
    bl func_02005dac
    ldr r2, [sp, #0x10]
    ldr r1, [sp, #0x14]
    str r2, [r0]
    str r1, [r0, #0x4]
    add r0, r5, #0x3a
    mov r1, #0x23
    mov r2, #0x0
    bl func_ov004_021cde38
    add r0, r5, #0x3a
    mov r1, #0x33
    mov r2, #0x2
    bl func_ov004_021cde38
.L_b8:
    ldr r0, [r4, #0x6c]
    cmp r0, #0x0
    addeq sp, sp, #0x18
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r0, #0x100
    addlt r0, r0, #0x10
    strlt r0, [r4, #0x6c]
    ldr r1, [r4, #0x6c]
    ldr r0, _LIT2
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    add r3, r4, #0x2f8
    sub r4, r0, r1
    mov r1, #0x1
    str r1, [sp]
    add r0, r3, #0x5c00
    mov r2, r4
    mov r3, #0x4a
    str r1, [sp, #0x4]
    bl func_ov004_021ca0a4
    add r1, r4, #0x92
    ldr r0, _LIT3
    mov r1, r1, lsl #0x17
    orr r1, r0, r1, lsr #0x7
    sub r2, r0, #-1073741819
    str r1, [sp, #0x8]
    mov r0, #0x1
    mov r1, #0x0
    strh r2, [sp, #0xc]
    bl func_02005dac
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0xc]
    str r2, [r0]
    str r1, [r0, #0x4]
    add r0, r4, #0xc
    mov r1, #0x57
    mov r2, #0x1
    bl func_ov004_021cde38
    add r0, r4, #0xc
    mov r1, #0x68
    mov r2, #0x3
    bl func_ov004_021cde38
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0xc0002022
_LIT2: .word 0x00000136
_LIT3: .word 0xc000204d
