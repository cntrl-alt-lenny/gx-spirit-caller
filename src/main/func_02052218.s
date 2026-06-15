; func_02052218 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3ec
        .extern func_0204525c
        .extern func_02046870
        .extern func_02051f48
        .extern func_02051f98
        .extern func_02052098
        .extern func_02052334
        .extern func_0205272c
        .global func_02052218
        .arm
func_02052218:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    bl func_02046870
    mov r4, r0
    bl func_02052334
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_3ac
    b .L_308
    b .L_334
    b .L_348
    b .L_35c
    b .L_370
.L_308:
    mov r0, r6
    bl func_0205272c
    cmp r0, #0x2
    ldmccia sp!, {r4, r5, r6, pc}
    cmp r0, #0x4
    ldmhiia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_02052098
    ldmia sp!, {r4, r5, r6, pc}
.L_334:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_02052098
    ldmia sp!, {r4, r5, r6, pc}
.L_348:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_02051f98
    ldmia sp!, {r4, r5, r6, pc}
.L_35c:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_02051f48
    ldmia sp!, {r4, r5, r6, pc}
.L_370:
    mov r0, #0x30
    mul ip, r4, r0
    ldr r0, _LIT0
    mov r3, #0x1
    ldr r1, [r0]
    mov r2, #0x0
    add r1, r1, ip
    strb r3, [r1, #0x1d]
    ldr r1, [r0]
    add r1, r1, ip
    str r2, [r1, #0x10]
    ldr r0, [r0]
    add r0, r0, ip
    str r2, [r0, #0x18]
    ldmia sp!, {r4, r5, r6, pc}
.L_3ac:
    ldr r1, _LIT1
    mov r0, #0x6
    bl func_0204525c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219e3ec
_LIT1: .word 0xfffe82b6
