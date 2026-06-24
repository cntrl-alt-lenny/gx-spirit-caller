; func_0203bd9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Mod
        .extern func_0203a7fc
        .extern func_0203b9d4
        .extern func_0203ba50
        .extern func_0203ba80
        .extern func_0203c5d0
        .extern func_02088144
        .extern func_02088214
        .extern func_02088268
        .extern func_02089024
        .extern func_02089114
        .extern func_02094410
        .global func_0203bd9c
        .arm
func_0203bd9c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldrh r0, [r6, #0xac]
    mov r5, #0x0
    bl func_02089114
    movs r4, r0
    beq .L_338
    ldr r0, [r4]
    bl func_0203a7fc
    cmp r0, #0x0
    beq .L_338
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
.L_74:
    str lr, [r7]
    strh r2, [r7, #0x4]
    mov r8, r2
    mov ip, r7
    strh r2, [r7, #0x6]
.L_88:
    str lr, [ip, #0xc]
    strh r0, [ip, #0x10]
    add r8, r8, #0x1
    strh r1, [ip, #0x12]
    cmp r8, #0x2
    add ip, ip, #0xc
    blt .L_88
    add r3, r3, #0x1
    cmp r3, #0x2
    add r7, r7, #0x20
    blt .L_74
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
.L_f4:
    ldr r1, [r6, #0x78]
    add r1, r1, r0, lsl #0x3
    str r3, [r1, #0x40]
    ldr r1, [r6, #0x78]
    add r1, r1, r0, lsl #0x3
    add r0, r0, #0x1
    strb r2, [r1, #0x47]
    cmp r0, #0x10
    blt .L_f4
    strb r3, [r6, #0xc0]
    strh r3, [r6, #0xb4]
    ldr r0, [r4]
    bl func_02089024
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
    bgt .L_190
    cmp r0, #0x0
    blt .L_338
    beq .L_19c
    cmp r0, #0x1
    beq .L_1cc
    cmp r0, #0x2
    beq .L_1f0
    b .L_338
.L_190:
    cmp r0, #0x10
    beq .L_230
    b .L_338
.L_19c:
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
    b .L_264
.L_1cc:
    strh r2, [r6, #0xb2]
    ldr r0, [r6, #0x74]
    mov r4, #0x1
    ldr r0, [r0, #0x38]
    str r0, [r6, #0x6c]
    ldr r0, [r6, #0x74]
    ldr r0, [r0, #0x24]
    str r0, [r6, #0x70]
    b .L_264
.L_1f0:
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
    b .L_264
.L_230:
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
.L_264:
    mov r0, r6
    bl func_0203ba80
    cmp r0, #0x0
    beq .L_338
    ldrh r2, [r6, #0xb8]
    ldr r1, [r6, #0x7c]
    mov r0, #0x0
    mov r2, r2, lsl #0xb
    bl func_02094410
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
    bl func_02088268
    movs r5, r0
    bne .L_2d4
    mov r0, r6
    bl func_0203ba50
    b .L_338
.L_2d4:
    add r0, r6, #0x4
    mov r1, #0x0
    mov r2, #0x40
    bl func_02088144
    ldr r0, [r6, #0x74]
    ldrb r0, [r0, #0x1a]
    cmp r0, #0x2
    bne .L_314
    mov r1, #0x0
    mov r2, r1
    add r0, r6, #0x4
    bl func_02088144
    add r0, r6, #0x4
    mov r1, #0x1
    mov r2, #0x7f
    bl func_02088144
.L_314:
    ldrh r1, [r6, #0xb0]
    add r0, r6, #0x4
    bic r1, r1, #0x2000
    strh r1, [r6, #0xb0]
    bl func_02088214
    mov r0, r6
    mov r1, #0x7f
    mov r2, #0x0
    bl func_0203c5d0
.L_338:
    mov r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x10624dd3
_LIT1: .word 0x0000ffff
_LIT2: .word func_0203b9d4
