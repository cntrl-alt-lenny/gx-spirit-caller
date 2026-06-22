; func_ov002_0222904c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022be154
        .extern data_ov002_022ce288
        .extern func_ov002_021ca3f0
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_02257b48
        .extern func_ov002_0227ac64
        .global func_ov002_0222904c
        .arm
func_ov002_0222904c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r4, r0
    ldr r3, [r2, #0x5a8]
    cmp r3, #0x7e
    beq .L_10c
    cmp r3, #0x7f
    beq .L_80
    cmp r3, #0x80
    bne .L_110
    bl func_ov002_02257b48
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_021e2b3c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_80:
    ldr r0, [r2, #0x5ac]
    cmp r0, #0x3
    addcs sp, sp, #0x8
    movcs r0, #0x7e
    ldmcsia sp!, {r4, pc}
    add r1, sp, #0x4
    mov ip, #0x0
    str ip, [r1]
    ldr r3, [r2, #0x5ac]
    ldr r0, _LIT2
    ldr r2, _LIT3
    ldr r3, [r0, r3, lsl #0x2]
    sub r0, ip, #0x2000
    and ip, r0, #0x0
    and r0, r3, r2
    orr r0, ip, r0
    str r0, [sp, #0x4]
    ldrh r0, [r4]
    mov r2, #0x1
    mov r3, r2
    mov r0, r0, lsl #0x10
    orr r0, r0, #0x11
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0227ac64
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5ac]
    mov r0, #0x7f
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, pc}
.L_10c:
    bl func_ov002_021e2c5c
.L_110:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00001670
_LIT2: .word data_ov002_022be154
_LIT3: .word 0x00001fff
