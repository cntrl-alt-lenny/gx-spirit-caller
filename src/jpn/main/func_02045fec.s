; func_02045fec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff828
        .extern data_020ff834
        .extern data_0219da0c
        .extern func_020491fc
        .extern func_020500cc
        .extern func_020a734c
        .extern func_020aace8
        .extern func_020aadcc
        .extern func_020aaf94
        .extern func_020acbac
        .global func_02045fec
        .arm
func_02045fec:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    add r4, sp, #0x0
    mov r3, #0x0
    strb r3, [r4]
    strb r3, [r4, #0x1]
    strb r3, [r4, #0x2]
    strb r3, [r4, #0x3]
    strb r3, [r4, #0x4]
    strb r3, [r4, #0x5]
    strb r3, [r4, #0x6]
    strb r3, [r4, #0x7]
    strb r3, [r4, #0x8]
    strb r3, [r4, #0x9]
    strb r3, [r4, #0xa]
    mov r5, r1
    strb r3, [r4, #0xb]
    ldr r4, [r5, #0x8]
    mov r6, r0
    bl func_020491fc
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    bl func_020aace8
    mov r2, r0
    ldr r1, _LIT0
    mov r0, r4
    bl func_020a734c
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    bl func_020aace8
    add r4, r4, r0
    mov r0, r4
    mov r1, #0x76
    bl func_020aaf94
    sub r7, r0, r4
    add r0, sp, #0x0
    mov r1, r4
    mov r2, r7
    bl func_020aadcc
    cmp r7, #0xa
    addhi sp, sp, #0xc
    ldmhiia sp!, {r4, r5, r6, r7, pc}
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acbac
    cmp r0, #0x3
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, _LIT1
    add r1, r7, #0x1
    add r4, r4, r1
    bl func_020aace8
    mov r2, r0
    ldr r1, _LIT1
    mov r0, r4
    bl func_020a734c
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, _LIT2
    ldr r1, [r0]
    ldr r0, [r1, #0x24]
    cmp r0, #0x5
    beq .L_13c
    cmp r0, #0x6
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    beq .L_13c
    ldrb r0, [r1, #0x369]
    cmp r0, #0x3
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_13c:
    ldr r0, _LIT1
    bl func_020aace8
    add r2, r4, r0
    ldr r1, [r5]
    mov r0, r6
    bl func_020500cc
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff828+0x4
_LIT1: .word data_020ff834
_LIT2: .word data_0219da0c
