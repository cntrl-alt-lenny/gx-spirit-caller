; func_0203bdec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Mod
        .extern func_0203a84c
        .extern func_0203ba24
        .extern func_0203baa0
        .extern func_0203bad0
        .extern func_0203c620
        .extern func_0208822c
        .extern func_020882fc
        .extern func_02088350
        .extern func_0208910c
        .extern func_020891fc
        .extern func_02094504
        .global func_0203bdec
        .arm
func_0203bdec:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldrh r0, [r6, #0xac]
    mov r5, #0x0
    bl func_020891fc
    movs r4, r0
    beq .L_654
    ldr r0, [r4]
    bl func_0203a84c
    cmp r0, #0x0
    beq .L_654
    add r0, r0, #0x20
    str r0, [r6, #0x74]
    ldrh r2, [r0, #0x1c]
    ldr r1, [r6, #0x68]
    ldr r0, _LIT0
    mul r1, r2, r1
    umull r0, r8, r1, r0
    mov r8, r8, lsr #0x6
    mov r0, r8
    mov r1, #0x3f8
    ldr r7, [r6, #0x78]
    bl Mod
    rsb lr, r0, r8
    ldr r1, _LIT1
    mov r3, r5
    mov r0, r5
    mov r2, r5
.L_390:
    str lr, [r7]
    strh r2, [r7, #0x4]
    mov r8, r2
    mov ip, r7
    strh r2, [r7, #0x6]
.L_3a4:
    str lr, [ip, #0xc]
    strh r0, [ip, #0x10]
    add r8, r8, #0x1
    strh r1, [ip, #0x12]
    cmp r8, #0x2
    add ip, ip, #0xc
    blt .L_3a4
    add r3, r3, #0x1
    cmp r3, #0x2
    add r7, r7, #0x20
    blt .L_390
    ldr r2, [r6, #0x78]
    mov r3, #0x3
    strh r3, [r2, #0x4]
    mov r1, #0x7f00
    str r1, [r6, #0x8c]
    str r1, [r6, #0x88]
    strh r0, [r6, #0x92]
    str r0, [r6, #0x94]
    str r1, [r6, #0x98]
    mov r1, #0x4000
    strh r0, [r6, #0x9e]
    str r1, [r6, #0xa4]
    str r1, [r6, #0xa0]
    strh r0, [r6, #0xaa]
    mov r3, #0x0
    mov r2, #0xff
.L_410:
    ldr r1, [r6, #0x78]
    add r1, r1, r0, lsl #0x3
    str r3, [r1, #0x40]
    ldr r1, [r6, #0x78]
    add r1, r1, r0, lsl #0x3
    add r0, r0, #0x1
    strb r2, [r1, #0x47]
    cmp r0, #0x10
    blt .L_410
    strb r3, [r6, #0xc0]
    strh r3, [r6, #0xb4]
    ldr r0, [r4]
    bl func_0208910c
    str r0, [r6, #0x68]
    ldrb r0, [r4, #0x4]
    mov r4, #0x0
    mov r2, #0x100
    strb r0, [r6, #0xbd]
    ldr r1, [r6, #0x74]
    mov r0, #0x2
    ldrb r1, [r1, #0x1a]
    strh r1, [r6, #0xb8]
    strh r4, [r6, #0xba]
    strb r4, [r6, #0xc2]
    strb r4, [r6, #0xbf]
    strb r0, [r6, #0xbe]
    strh r2, [r6, #0xb6]
    ldr r1, [r6, #0x74]
    ldrb r0, [r1, #0x18]
    cmp r0, #0x2
    bgt .L_4ac
    cmp r0, #0x0
    blt .L_654
    beq .L_4b8
    cmp r0, #0x1
    beq .L_4e8
    cmp r0, #0x2
    beq .L_50c
    b .L_654
.L_4ac:
    cmp r0, #0x10
    beq .L_54c
    b .L_654
.L_4b8:
    mov r1, #0x200
    strh r1, [r6, #0xb6]
    mov r0, #0x1
    strb r0, [r6, #0xbe]
    strh r1, [r6, #0xb2]
    ldr r0, [r6, #0x74]
    ldr r0, [r0, #0x38]
    str r0, [r6, #0x6c]
    ldr r0, [r6, #0x74]
    ldr r0, [r0, #0x24]
    str r0, [r6, #0x70]
    b .L_580
.L_4e8:
    strh r2, [r6, #0xb2]
    ldr r0, [r6, #0x74]
    mov r4, #0x1
    ldr r0, [r0, #0x38]
    str r0, [r6, #0x6c]
    ldr r0, [r6, #0x74]
    ldr r0, [r0, #0x24]
    str r0, [r6, #0x70]
    b .L_580
.L_50c:
    mov r4, #0x1
    strb r4, [r6, #0xbf]
    ldr r0, [r6, #0x74]
    ldr r0, [r0, #0x34]
    strh r0, [r6, #0xb2]
    ldr r0, [r6, #0x74]
    ldr r0, [r0, #0x30]
    str r0, [r6, #0x6c]
    ldr r0, [r6, #0x74]
    ldr r1, [r0, #0x2c]
    ldr r2, [r0, #0x34]
    ldr r0, [r0, #0x3c]
    sub r1, r1, #0x1
    mla r0, r2, r1, r0
    str r0, [r6, #0x70]
    b .L_580
.L_54c:
    ldr r0, [r1, #0x34]
    mov r4, #0x1
    strh r0, [r6, #0xb2]
    ldr r0, [r6, #0x74]
    ldr r0, [r0, #0x30]
    str r0, [r6, #0x6c]
    ldr r0, [r6, #0x74]
    ldr r1, [r0, #0x2c]
    ldr r2, [r0, #0x34]
    ldr r0, [r0, #0x3c]
    sub r1, r1, #0x1
    mla r0, r2, r1, r0
    str r0, [r6, #0x70]
.L_580:
    mov r0, r6
    bl func_0203bad0
    cmp r0, #0x0
    beq .L_654
    ldrh r2, [r6, #0xb8]
    ldr r1, [r6, #0x7c]
    mov r0, #0x0
    mov r2, r2, lsl #0xb
    bl func_02094504
    ldr r0, [r6, #0x74]
    mov r2, #0x4
    ldrh r3, [r0, #0x1e]
    ldr r0, _LIT2
    mov r1, r4
    str r3, [sp]
    str r2, [sp, #0x4]
    str r0, [sp, #0x8]
    str r6, [sp, #0xc]
    ldrh r3, [r6, #0xb8]
    ldr r2, [r6, #0x7c]
    add r0, r6, #0x4
    mov r3, r3, lsl #0xb
    bl func_02088350
    movs r5, r0
    bne .L_5f0
    mov r0, r6
    bl func_0203baa0
    b .L_654
.L_5f0:
    add r0, r6, #0x4
    mov r1, #0x0
    mov r2, #0x40
    bl func_0208822c
    ldr r0, [r6, #0x74]
    ldrb r0, [r0, #0x1a]
    cmp r0, #0x2
    bne .L_630
    mov r1, #0x0
    mov r2, r1
    add r0, r6, #0x4
    bl func_0208822c
    add r0, r6, #0x4
    mov r1, #0x1
    mov r2, #0x7f
    bl func_0208822c
.L_630:
    ldrh r1, [r6, #0xb0]
    add r0, r6, #0x4
    bic r1, r1, #0x2000
    strh r1, [r6, #0xb0]
    bl func_020882fc
    mov r0, r6
    mov r1, #0x7f
    mov r2, #0x0
    bl func_0203c620
.L_654:
    mov r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x10624dd3
_LIT1: .word 0x0000ffff
_LIT2: .word func_0203ba24
