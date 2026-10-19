; func_0203e610 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee6c
        .extern func_0203e3d4
        .extern func_0203e540
        .extern func_0203eaa8
        .extern func_020930b0
        .extern func_020b3808
        .global func_0203e610
        .arm
func_0203e610:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020930b0
    ldr r3, [r4, #0xcb0]
    ldr r2, [r4, #0xcb4]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    cmp r1, #0x0
    cmpeq r0, #0x96
    bcs .L_60
    ldrb r1, [r4, #0xd0f]
    mov r0, #0x24
    mla r0, r1, r0, r4
    ldrb r0, [r0, #0x300]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    bne .L_110
.L_60:
    ldrb r1, [r4, #0xd0f]
    mov r0, #0x24
    add r3, r4, #0x300
    mul r2, r1, r0
    ldrb r0, [r3, r2]
    bic r0, r0, #0xf
    strb r0, [r3, r2]
    ldrb r0, [r4, #0xd0f]
    add r0, r0, #0x1
    strb r0, [r4, #0xd0f]
    ldrb r1, [r4, #0xd10]
    ldrb r0, [r4, #0xd0f]
    cmp r1, r0
    bhi .L_b8
    ldrb r1, [r4, #0xd15]
    mov r0, #0x0
    add r1, r1, #0x1
    strb r1, [r4, #0xd15]
    strb r0, [r4, #0xd0f]
    ldrb r0, [r4, #0xd15]
    bl func_0203eaa8
    strb r0, [r4, #0xd11]
.L_b8:
    add r0, r4, #0xd00
    ldrsb r0, [r0, #0x11]
    cmp r0, #0x0
    bge .L_e0
    mov r2, #0x0
    mov r0, r4
    mov r1, #0x5
    strb r2, [r4, #0xd15]
    bl func_0203e540
    ldmia sp!, {r4, pc}
.L_e0:
    bl func_020930b0
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    ldrb r3, [r4, #0xd0f]
    add r1, r4, #0x304
    mov r0, #0x24
    add r2, r4, #0xd00
    mla r1, r3, r0, r1
    ldrsb r2, [r2, #0x11]
    ldr r0, _LIT1
    mov r3, #0x300000
    bl func_0203e3d4
.L_110:
    mov r0, #0x5
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000082ea
_LIT1: .word data_020bee6c+0x10
