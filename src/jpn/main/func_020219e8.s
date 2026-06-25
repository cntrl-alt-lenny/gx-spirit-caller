; func_020219e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021bdc
        .extern func_020234a4
        .extern func_02023fd0
        .extern func_02024520
        .extern func_0202707c
        .extern func_0202873c
        .extern func_0202a228
        .global func_020219e8
        .arm
func_020219e8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    add r5, r0, #0x18
    add r6, r6, #0x4
    mov r4, #0x0
.L_388:
    ldr r1, [r6]
    mov r0, r1, lsr #0x18
    cmp r0, #0xf0
    beq .L_458
    str r1, [r5, #0x8]
    ldr r0, [r6, #0x4]
    add r6, r6, #0x8
    str r0, [r5]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_440
    b .L_3d0
    b .L_3e0
    b .L_3f0
    b .L_400
    b .L_410
    b .L_420
    b .L_430
.L_3d0:
    ldr r0, [r5, #0x8]
    bl func_02021bdc
    str r0, [r5, #0x4]
    b .L_448
.L_3e0:
    ldr r0, [r5, #0x8]
    bl func_020234a4
    str r0, [r5, #0x4]
    b .L_448
.L_3f0:
    ldr r0, [r5, #0x8]
    bl func_02023fd0
    str r0, [r5, #0x4]
    b .L_448
.L_400:
    ldr r0, [r5, #0x8]
    bl func_02024520
    str r0, [r5, #0x4]
    b .L_448
.L_410:
    ldr r0, [r5, #0x8]
    bl func_0202707c
    str r0, [r5, #0x4]
    b .L_448
.L_420:
    ldr r0, [r5, #0x8]
    bl func_0202873c
    str r0, [r5, #0x4]
    b .L_448
.L_430:
    ldr r0, [r5, #0x8]
    bl func_0202a228
    str r0, [r5, #0x4]
    b .L_448
.L_440:
    sub r4, r4, #0x1
    sub r5, r5, #0xc
.L_448:
    add r4, r4, #0x1
    cmp r4, #0x80
    add r5, r5, #0xc
    blt .L_388
.L_458:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
