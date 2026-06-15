; func_0200127c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern func_02000cc4
        .extern func_02000d4c
        .extern func_02000fc8
        .global func_0200127c
        .arm
func_0200127c:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    bl func_02000fc8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    mov r0, r4
    ldr r1, [r0, #0x3c]
    cmp r1, #0x15
    bgt .L_308
    bge .L_434
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_46c
    b .L_46c
    b .L_314
    b .L_324
    b .L_388
    b .L_474
    b .L_398
    b .L_3d0
.L_308:
    cmp r1, #0x17
    beq .L_450
    b .L_46c
.L_314:
    bl func_02000cc4
    mov r0, #0x3
    str r0, [r4, #0xb64]
    b .L_474
.L_324:
    ldr r0, [r0, #0x40]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_474
    b .L_474
    b .L_348
    b .L_358
    b .L_368
    b .L_378
.L_348:
    bl func_02000cc4
    mov r0, #0x9
    str r0, [r4, #0xb64]
    b .L_474
.L_358:
    bl func_02000cc4
    mov r0, #0xf
    str r0, [r4, #0xb64]
    b .L_474
.L_368:
    bl func_02000cc4
    mov r0, #0x13
    str r0, [r4, #0xb64]
    b .L_474
.L_378:
    bl func_02000cc4
    mov r0, #0x11
    str r0, [r4, #0xb64]
    b .L_474
.L_388:
    bl func_02000cc4
    mov r0, #0x2f
    str r0, [r4, #0xb64]
    b .L_474
.L_398:
    ldr r0, [r0, #0x40]
    cmp r0, #0x1
    beq .L_3b0
    cmp r0, #0x2
    beq .L_3c0
    b .L_474
.L_3b0:
    bl func_02000cc4
    mov r0, #0x31
    str r0, [r4, #0xb64]
    b .L_474
.L_3c0:
    bl func_02000cc4
    mov r0, #0x1d
    str r0, [r4, #0xb64]
    b .L_474
.L_3d0:
    ldr r0, [r0, #0x40]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_474
    b .L_474
    b .L_3f4
    b .L_404
    b .L_414
    b .L_424
.L_3f4:
    bl func_02000cc4
    mov r0, #0x15
    str r0, [r4, #0xb64]
    b .L_474
.L_404:
    bl func_02000cc4
    mov r0, #0x35
    str r0, [r4, #0xb64]
    b .L_474
.L_414:
    bl func_02000cc4
    mov r0, #0x2d
    str r0, [r4, #0xb64]
    b .L_474
.L_424:
    bl func_02000cc4
    mov r0, #0x37
    str r0, [r4, #0xb64]
    b .L_474
.L_434:
    bl func_02000cc4
    mov r1, #0x7
    str r1, [r4, #0xb64]
    mov r0, r4
    mov r1, #0x0
    str r1, [r0, #0x3c]
    b .L_474
.L_450:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x3c]
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_474
.L_46c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_474:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_021040ac
