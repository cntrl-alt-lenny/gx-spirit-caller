; func_ov014_021b4ac4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .extern func_02006110
        .extern func_020061ac
        .extern func_020944a4
        .global func_ov014_021b4ac4
        .arm
func_ov014_021b4ac4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    ldr r1, [r0, #0xc]
    ldr r2, [r0]
    rsb r1, r1, #0xc0
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    ldr r3, [r0, #0x10]
    sub r1, r1, #0x8
    cmp r2, #0x1
    add r4, r3, r1
    bne .L_704
    ldr r9, [r0, #0x8]
    add r0, sp, #0xc
    add r1, sp, #0x8
    add r7, r4, #0x5
    bl func_02006110
    sub r0, r4, #0x2
    and r0, r0, #0xff
    orr fp, r0, #0x4000
    mov r5, #0x0
    mov sl, r5
    orr fp, fp, #-1073741824
    add r4, r7, #0x12
.L_63c:
    cmp r9, #0x0
    mov r8, #0x0
    beq .L_684
    ldr r1, [sp, #0xc]
    cmp r1, #0xa0
    ldrge r0, [sp, #0x8]
    cmpge r0, r7
    blt .L_668
    cmp r1, #0xd0
    cmplt r0, r4
    movlt r8, #0x1
.L_668:
    rsb r6, sl, #0x68
    bl func_020061ac
    cmp r0, #0x0
    cmpne r8, #0x0
    movne r6, #0x70
    mov r0, #0x9c
    b .L_6bc
.L_684:
    ldr r1, [sp, #0xc]
    cmp r1, #0x30
    ldrge r0, [sp, #0x8]
    cmpge r0, r7
    blt .L_6a4
    cmp r1, #0x60
    cmplt r0, r4
    movlt r8, #0x1
.L_6a4:
    rsb r6, sl, #0x68
    bl func_020061ac
    cmp r0, #0x0
    cmpne r8, #0x0
    movne r6, #0x70
    mov r0, #0x2c
.L_6bc:
    sub r0, r0, #0x4
    mov r0, r0, lsl #0x17
    orr r0, fp, r0, lsr #0x7
    str r0, [sp]
    orr r0, r6, #0x1400
    strh r0, [sp, #0x4]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
    add r5, r5, #0x1
    rsb r9, r9, #0x1
    add sl, sl, #0x8
    cmp r5, #0x2
    blt .L_63c
.L_704:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
