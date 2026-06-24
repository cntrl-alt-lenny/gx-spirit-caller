; func_020a2ed8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9770
        .extern data_021a97a0
        .extern data_021a97a8
        .extern data_021a97ae
        .extern func_02094398
        .extern func_020943b0
        .extern func_020a0698
        .extern func_020a2b80
        .global func_020a2ed8
        .arm
func_020a2ed8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    mov r6, r0
    ldr r0, [r3, #0x4]
    ldr r3, [r3, #0x8]
    add r7, r0, #0x358
    add r0, r3, #0x62
    cmp r0, r7
    mov r5, r1
    ldrls r0, _LIT1
    movls r1, #0x62
    mov r4, r2
    strlsb r1, [r0, #0xc]
    bls .L_60
    ldr r0, _LIT1
    sub r1, r7, r3
    strb r1, [r0, #0xc]
    ldrb r2, [r0, #0xc]
    ldr r1, _LIT2
    mov r0, #0x0
    add r1, r1, r2
    rsb r2, r2, #0x62
    bl func_02094398
.L_60:
    ldr r0, _LIT1
    ldr r1, _LIT0
    ldrb r2, [r0, #0xc]
    ldr r0, [r1, #0x8]
    ldr r1, _LIT2
    bl func_020943b0
    ldr r3, _LIT0
    ldr r2, _LIT1
    ldrb r8, [r3, #0xf]
    ldrb r1, [r3, #0x10]
    ldrb r7, [r2, #0x4]
    strb r8, [r2, #0xa]
    ldr r0, [r3, #0x4]
    strb r1, [r2, #0xb]
    ldrb r1, [r0, #0x4b2]
    bic r7, r7, #0x3
    ldrb r8, [r3, #0xe]
    and r1, r1, #0x3
    orr r1, r7, r1
    strb r1, [r2, #0x4]
    ldrb ip, [r0, #0x4b3]
    ldrb r1, [r2, #0x4]
    ldrb r7, [r3, #0x11]
    strb ip, [r2, #0x5]
    strb r8, [r2, #0x6]
    ldr r8, [r0, #0x4b8]
    bic r1, r1, #0xfc
    str r8, [r2]
    ldrb r0, [r0, #0x4b5]
    add lr, r7, #0x1
    mov ip, #0x0
    and r0, r0, #0x3f
    orr r8, r1, r0, lsl #0x2
    ldr r0, _LIT3
    mov r1, #0x68
    strb r8, [r2, #0x4]
    strb lr, [r3, #0x11]
    strb r7, [r2, #0x7]
    strh ip, [r2, #0x8]
    bl func_020a2b80
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldrb ip, [r1, #0xf]
    strh r0, [r2, #0x8]
    ldrb r3, [r1, #0x10]
    add r0, ip, #0x1
    strb r0, [r1, #0xf]
    ldrb r0, [r1, #0xf]
    mov r2, #0x70
    cmp r0, r3
    ldrcc r0, [r1, #0x8]
    mov r3, r6
    addcc r0, r0, #0x62
    strcc r0, [r1, #0x8]
    movcs r0, #0x4
    strcsb r0, [r1, #0xc]
    orr r0, r4, #0x3
    and r4, r0, #0xff
    str r5, [sp]
    ldr r1, _LIT1
    mov r0, #0x0
    str r4, [sp, #0x4]
    bl func_020a0698
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a9770
_LIT1: .word data_021a97a0
_LIT2: .word data_021a97ae
_LIT3: .word data_021a97a8
