; func_02019cac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .global func_02019cac
        .arm
func_02019cac:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl GetSystemWork
    cmp r5, #0x35
    mov r0, #0x0
    bgt .L_260
    cmp r5, #0x35
    bge .L_360
    cmp r5, #0x1c
    bgt .L_244
    cmp r5, #0x19
    blt .L_238
    beq .L_300
    cmp r5, #0x1b
    beq .L_2c0
    cmp r5, #0x1c
    beq .L_2e0
    ldmia sp!, {r3, r4, r5, pc}
.L_238:
    cmp r5, #0x5
    beq .L_398
    ldmia sp!, {r3, r4, r5, pc}
.L_244:
    cmp r5, #0x29
    bgt .L_254
    beq .L_330
    ldmia sp!, {r3, r4, r5, pc}
.L_254:
    cmp r5, #0x31
    beq .L_380
    ldmia sp!, {r3, r4, r5, pc}
.L_260:
    cmp r5, #0x48
    bgt .L_2a4
    bge .L_370
    sub r1, r5, #0x36
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    b .L_340
    ldmia sp!, {r3, r4, r5, pc}
    b .L_350
    b .L_320
    b .L_370
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_310
    b .L_2d0
.L_2a4:
    cmp r5, #0x4b
    bgt .L_2b4
    beq .L_398
    ldmia sp!, {r3, r4, r5, pc}
.L_2b4:
    cmp r5, #0x5e
    beq .L_2f0
    ldmia sp!, {r3, r4, r5, pc}
.L_2c0:
    mov r1, #0x1
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_2d0:
    mov r1, #0x2
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_2e0:
    mov r1, #0x3
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_2f0:
    mov r1, #0x4
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_300:
    mov r1, #0x5
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_310:
    mov r1, #0x9
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_320:
    mov r1, #0xa
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_330:
    mov r1, #0x11
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_340:
    mov r1, #0x13
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_350:
    mov r1, #0x14
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_360:
    mov r1, #0x15
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_370:
    mov r1, #0x16
    strb r1, [r4]
    add r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_380:
    mov r1, #0x6
    strb r1, [r4]
    mov r1, #0x12
    strb r1, [r4, #0x1]
    add r0, r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_398:
    mov r1, #0x8
    strb r1, [r4]
    mov r1, #0x7
    strb r1, [r4, #0x1]
    add r0, r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
