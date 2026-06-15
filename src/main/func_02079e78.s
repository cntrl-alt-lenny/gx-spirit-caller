; func_02079e78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a088c
        .extern func_0207a544
        .extern func_0207ab68
        .extern func_0207b038
        .extern func_0207b13c
        .extern func_0209ea24
        .extern func_0209f0d8
        .global func_02079e78
        .arm
func_02079e78:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    bne .L_308
    ldr r2, _LIT0
    mov r0, #0x0
    ldr r1, [r2]
    add r1, r1, #0x2000
    strb r0, [r1, #0x26b]
    ldr r1, [r2]
    add r1, r1, #0x2200
    strh r0, [r1, #0x82]
    ldr r3, [r2]
    add r1, r3, #0x2000
    ldr r1, [r1, #0x260]
    cmp r1, #0xd
    addls pc, pc, r1, lsl #0x2
    b .L_2d4
    b .L_2d4
    b .L_2d4
    b .L_2d4
    b .L_2d4
    b .L_2d4
    b .L_84
    b .L_84
    b .L_ac
    b .L_d4
    b .L_1fc
    b .L_22c
    b .L_2d4
    b .L_1fc
    b .L_25c
.L_84:
    mov r0, #0x3
    bl func_0207b038
    mov r1, #0x0
    ldr r3, _LIT1
    mov r2, r1
    mov r0, #0x1
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_ac:
    mov r0, #0x3
    bl func_0207b038
    mov r0, #0x0
    ldr r3, _LIT2
    mov r1, r0
    mov r2, r0
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_d4:
    add r1, r3, #0x2200
    ldrh r4, [r1, #0xf8]
    strh r0, [r1, #0xf8]
    cmp r4, #0x12
    bne .L_1cc
    ldr r1, [r2]
    add r1, r1, #0x2100
    ldrh r3, [r1, #0x70]
    and ip, r3, #0x24
    cmp ip, #0x24
    beq .L_1cc
    orr r3, r3, #0x24
    strh r3, [r1, #0x70]
    ldr r2, [r2]
    add r1, r2, #0x2000
    ldr r3, [r1, #0x264]
    and r1, r3, #0xc0000
    cmp r1, #0xc0000
    moveq r0, #0x1
    mov r0, r0, lsl #0x10
    mov ip, r0, lsr #0x10
    and r1, r3, #0x30000
    cmp r1, #0x30000
    movne r3, #0x1
    add r1, r2, #0x2140
    ldr r0, _LIT3
    moveq r3, #0x0
    mov r2, #0x0
    str ip, [sp]
    bl func_0209ea24
    cmp r0, #0x2
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, lr}
    bxeq lr
    cmp r0, #0x3
    beq .L_19c
    cmp r0, #0x8
    bne .L_19c
    mov r0, #0xc
    bl func_0207b038
    ldr r0, _LIT0
    ldr r3, _LIT4
    ldr r0, [r0]
    mov r2, r4
    add r1, r0, #0x2140
    mov r0, #0x1
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_19c:
    mov r0, #0xb
    bl func_0207b038
    ldr r0, _LIT0
    ldr r3, _LIT5
    ldr r0, [r0]
    mov r2, r4
    add r1, r0, #0x2140
    mov r0, #0x7
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_1cc:
    mov r0, #0x3
    bl func_0207b038
    ldr r0, _LIT0
    ldr r3, _LIT6
    ldr r0, [r0]
    mov r2, r4
    add r1, r0, #0x2140
    mov r0, #0x1
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_1fc:
    mov r0, #0x3
    bl func_0207b038
    ldr r0, _LIT0
    ldr r3, _LIT7
    ldr r1, [r0]
    mov r0, #0x0
    add r1, r1, #0x2140
    mov r2, #0x1
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_22c:
    mov r0, #0x3
    bl func_0207b038
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    ldr r3, _LIT8
    mov r2, r0
    add r1, r1, #0x2140
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_25c:
    ldr r0, _LIT9
    bl func_0209f0d8
    cmp r0, #0x2
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, lr}
    bxeq lr
    cmp r0, #0x3
    beq .L_2ac
    cmp r0, #0x8
    bne .L_2ac
    mov r0, #0xc
    bl func_0207b038
    mov r1, #0x0
    ldr r3, _LIT10
    mov r2, r1
    mov r0, #0x1
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_2ac:
    mov r0, #0xb
    bl func_0207b038
    mov r1, #0x0
    ldr r3, _LIT11
    mov r2, r1
    mov r0, #0x7
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_2d4:
    mov r0, #0xb
    bl func_0207b038
    ldr r0, _LIT0
    ldr r3, _LIT12
    ldr r1, [r0]
    mov r0, #0x7
    add r1, r1, #0x2000
    ldr r2, [r1, #0x260]
    mov r1, #0x0
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_308:
    mov r0, #0xb
    bl func_0207b038
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x7
    mov r3, #0x960
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x000008f5
_LIT2: .word 0x000008fb
_LIT3: .word func_0207a544
_LIT4: .word 0x0000091c
_LIT5: .word 0x00000925
_LIT6: .word 0x0000092d
_LIT7: .word 0x00000935
_LIT8: .word 0x0000093c
_LIT9: .word func_0207ab68
_LIT10: .word 0x0000094a
_LIT11: .word 0x00000953
_LIT12: .word 0x00000959
