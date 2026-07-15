; func_ov017_021b302c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov017_021b7fa0
        .extern data_ov017_021b7faa
        .extern data_ov017_021b7fb4
        .extern data_ov017_021b7fbe
        .extern data_ov017_021b7fc8
        .extern data_ov017_021b8510
        .extern data_ov017_021b8794
        .extern data_ov017_021b899c
        .extern func_ov017_021b2be4
        .extern func_ov017_021b3f90
        .extern func_ov017_021b40fc
        .extern func_ov017_021b4cf8
        .extern func_ov017_021b7cac
        .global func_ov017_021b302c
        .arm
func_ov017_021b302c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_20
    bl func_ov017_021b7cac
.L_20:
    ldr r5, _LIT1
    mov r4, #0x0
    mov r0, r5
    bl func_ov017_021b2be4
    cmp r0, #0x0
    beq .L_50
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, #0x4
    streq r0, [r6, #0xc]
    moveq r4, #0x1
.L_50:
    mvn r1, #0x0
    str r1, [sp]
    mov r0, r6
    mov r2, r4
    mov r3, r5
    str r1, [sp, #0x4]
    mov r1, #0xe
    bl func_ov017_021b3f90
    ldr r0, [r6, #0x4]
    cmp r0, #0x0
    beq .L_88
    cmp r0, #0x1
    beq .L_25c
    b .L_270
.L_88:
    ldr r5, _LIT2
    mov r7, #0x0
    mov r0, r5
    bl func_ov017_021b2be4
    cmp r0, #0x0
    beq .L_b8
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, r7
    streq r0, [r6, #0xc]
    moveq r7, #0x1
.L_b8:
    mvn r4, #0x0
    str r4, [sp]
    mov r0, r6
    mov r2, r7
    mov r3, r5
    mov r1, #0xf
    str r4, [sp, #0x4]
    bl func_ov017_021b3f90
    ldr r0, _LIT3
    mov r5, #0x1
    ldrb r0, [r0, #0x1ce]
    ldr r4, _LIT4
    cmp r0, #0x6
    cmpne r0, #0xb
    moveq r5, #0x0
    beq .L_120
    mov r0, r4
    bl func_ov017_021b2be4
    cmp r0, #0x0
    beq .L_120
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, r5
    streq r0, [r6, #0xc]
    moveq r5, #0x2
.L_120:
    mvn ip, #0x0
    str ip, [sp]
    mov r0, r6
    mov r2, r5
    mov r3, r4
    mov r1, #0x10
    str ip, [sp, #0x4]
    bl func_ov017_021b3f90
    ldr r0, _LIT5
    ldr r4, _LIT6
    ldr r1, [r0, #0xa64]
    and r1, r1, #0x1f00000
    movs r1, r1, lsr #0x14
    ldreq r0, [r0, #0xa74]
    cmpeq r0, #0x0
    beq .L_1b0
    mov r0, r4
    mov r7, #0x0
    bl func_ov017_021b2be4
    cmp r0, #0x0
    beq .L_18c
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, #0x2
    streq r0, [r6, #0xc]
    moveq r7, #0x1
.L_18c:
    mvn r5, #0x0
    str r5, [sp]
    mov r0, r6
    mov r2, r7
    mov r3, r4
    mov r1, #0x11
    str r5, [sp, #0x4]
    bl func_ov017_021b3f90
    b .L_1d0
.L_1b0:
    mvn ip, #0x0
    str ip, [sp]
    mov r0, r6
    mov r2, r5
    mov r3, r4
    mov r1, #0x1b
    str ip, [sp, #0x4]
    bl func_ov017_021b3f90
.L_1d0:
    ldr r5, _LIT7
    mov r7, #0x0
    mov r0, r5
    bl func_ov017_021b2be4
    cmp r0, #0x0
    beq .L_200
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, #0x3
    streq r0, [r6, #0xc]
    moveq r7, #0x1
.L_200:
    mvn r4, #0x0
    str r4, [sp]
    mov r0, r6
    mov r2, r7
    mov r3, r5
    mov r1, #0x12
    str r4, [sp, #0x4]
    bl func_ov017_021b3f90
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_270
    mov r2, r4
    str r2, [sp]
    str r2, [sp, #0x4]
    ldr r1, [r6, #0xc]
    ldr r3, _LIT2
    mov r0, #0xa
    mla r3, r1, r0, r3
    mov r0, r6
    mov r1, #0xb
    bl func_ov017_021b3f90
    b .L_270
.L_25c:
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    bne .L_270
    ldr r0, _LIT8
    bl func_ov017_021b4cf8
.L_270:
    mov r0, r6
    mov r1, #0xf8
    mov r2, #0x94
    bl func_ov017_021b40fc
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov017_021b899c
_LIT1: .word data_ov017_021b7fc8
_LIT2: .word data_ov017_021b7fa0
_LIT3: .word data_ov017_021b8794
_LIT4: .word data_ov017_021b7faa
_LIT5: .word data_02104e6c
_LIT6: .word data_ov017_021b7fb4
_LIT7: .word data_ov017_021b7fbe
_LIT8: .word data_ov017_021b8510
