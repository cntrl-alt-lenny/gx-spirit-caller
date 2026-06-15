; func_02075928 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eee0
        .extern data_0219ef0c
        .extern func_02070980
        .extern func_02070ac0
        .extern func_02075ae8
        .extern func_02075d44
        .extern func_02075d74
        .extern func_02076b74
        .global func_02075928
        .arm
func_02075928:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, [r5, #0xc]
    add r6, sp, #0x0
.L_ae4:
    mov r0, r6
    mov r1, r5
    bl func_02070ac0
    ldr r1, [sp]
    cmp r1, #0x0
    moveq r0, #0x9
    addeq sp, sp, #0x8
    streqb r0, [r4, #0x455]
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    cmp r1, #0x5
    bcc .L_ae4
    ldrb r1, [r0]
    cmp r1, #0x80
    bne .L_bdc
    ldrb r1, [r4, #0x454]
    cmp r1, #0x0
    beq .L_bd0
    ldrb r1, [r4, #0x455]
    cmp r1, #0x0
    bne .L_bd0
    ldrb r2, [r0, #0x1]
    mov r1, r5
    mov r0, #0x2
    str r2, [sp]
    bl func_02070980
    ldr r1, _LIT0
    ldr r0, [sp]
    ldr r1, [r1]
    blx r1
    movs r6, r0
    moveq r0, #0x9
    addeq sp, sp, #0x8
    streqb r0, [r4, #0x455]
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r1, [sp]
    mov r2, r5
    bl func_02075d74
    cmp r0, #0x0
    bne .L_ba4
    ldrb r0, [r6]
    cmp r0, #0x1
    bne .L_ba4
    mov r0, r4
    add r1, r6, #0x1
    bl func_02076b74
    b .L_bac
.L_ba4:
    mov r0, #0x9
    strb r0, [r4, #0x455]
.L_bac:
    ldr r2, [sp]
    mov r0, r4
    mov r1, r6
    bl func_02075d44
    ldr r1, _LIT1
    mov r0, r6
    ldr r1, [r1]
    blx r1
    b .L_c74
.L_bd0:
    mov r0, #0x9
    strb r0, [r4, #0x455]
    b .L_c74
.L_bdc:
    ldrb r2, [r0, #0x3]
    ldrb r0, [r0, #0x4]
    ldr r1, _LIT2
    add r0, r0, r2, lsl #0x8
    add r0, r0, #0x5
    str r0, [sp]
    cmp r0, r1
    movhi r0, #0x9
    addhi sp, sp, #0x8
    strhib r0, [r4, #0x455]
    ldmhiia sp!, {r4, r5, r6, lr}
    bxhi lr
    ldr r1, _LIT0
    ldr r1, [r1]
    blx r1
    movs r6, r0
    moveq r0, #0x9
    addeq sp, sp, #0x8
    streqb r0, [r4, #0x455]
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r1, [sp]
    mov r2, r5
    bl func_02075d74
    cmp r0, #0x0
    beq .L_c68
    ldr r1, _LIT1
    mov r0, r6
    ldr r1, [r1]
    blx r1
    mov r0, #0x9
    add sp, sp, #0x8
    strb r0, [r4, #0x455]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_c68:
    mov r0, r4
    mov r1, r6
    bl func_02075ae8
.L_c74:
    ldrb r0, [r4, #0x455]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_0219eee0
_LIT1: .word data_0219ef0c
_LIT2: .word 0x00004805
