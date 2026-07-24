; func_02050158 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff888
        .extern func_020466f4
        .extern func_02046778
        .extern func_020467c0
        .extern func_0204987c
        .extern func_0204a848
        .extern func_0204c398
        .extern func_0204cbac
        .extern func_0204ffe0
        .extern func_02062458
        .extern func_0206258c
        .extern func_02064f10
        .extern OS_SNPrintf
        .global func_02050158
        .arm
func_02050158:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    mov r6, r0
    mov r4, r1
    bl func_0204987c
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x7
    beq .L_44
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xc
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_44:
    cmp r4, #0x0
    beq .L_1c0
    cmp r4, #0x5
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r4, #0x6
    bne .L_194
    bl func_0204987c
    ldrb r1, [r0, #0xc]
    add r1, r1, #0x1
    strb r1, [r0, #0xc]
    bl func_0204987c
    ldrb r0, [r0, #0xc]
    cmp r0, #0x5
    bls .L_b0
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0xc]
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cbac
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_b0:
    bl func_0204987c
    ldr r3, [r0, #0x1f8]
    ldr r2, _LIT0
    add r0, sp, #0x10
    mov r1, #0xc
    bl OS_SNPrintf
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldrb r2, [r6, #0x14]
    ldrb r1, [r0, #0x14]
    add r0, r7, r2, lsl #0x2
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0x200
    ldrh r1, [r1, #0x88]
    ldr r0, [r0, #0x208]
    mov r2, #0x0
    bl func_02064f10
    mov r5, r0
    bl func_0204987c
    mvn r1, #0x0
    str r1, [sp]
    ldr r3, _LIT1
    mov r1, #0x0
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x8]
    mov r2, r5
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    ldr r0, [r4, #0x4]
    add r3, sp, #0x10
    ldr r0, [r0]
    bl func_0206258c
    cmp r0, #0x1
    bne .L_160
    bl func_0204a848
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_160:
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cbac
    add sp, sp, #0x1c
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_194:
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cbac
    add sp, sp, #0x1c
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1c0:
    bl func_020467c0
    mov r5, r0
    mvn r1, #0x0
    cmp r5, r1
    bne .L_1e8
    ldr r1, _LIT2
    mov r0, #0x6
    bl func_0204ffe0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1e8:
    bl func_02046778
    mov r4, r0
    mov r0, r5
    bl func_020466f4
    str r6, [r4]
    mov r4, r0
    bl func_0204987c
    ldrb r2, [r0, #0xd]
    mov r1, #0x0
    add r2, r2, #0x1
    strb r2, [r0, #0xd]
    strb r5, [r4]
    strh r1, [r4, #0x2]
    str r1, [r4, #0x4]
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldrb r2, [r0, #0xd]
    mov r0, r6
    mov r1, r4
    add r2, r5, r2
    ldrb r2, [r2, #0x2c8]
    strb r2, [r4, #0x1]
    bl func_02062458
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xc
    bne .L_268
    mov r0, #0x0
    bl func_0204c398
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_268:
    mov r0, #0x1
    bl func_0204c398
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff888
_LIT1: .word 0x00001388
_LIT2: .word 0xfffeabc4
