; func_0202d1d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bea2c
        .extern data_0219ad48
        .extern func_0201d4b4
        .global func_0202d1d8
        .arm
func_0202d1d8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    ldr r5, _LIT0
    add lr, sp, #0x0
    mov r4, r0
    mov ip, #0x5
.L_3cc:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_3cc
    ldr ip, _LIT1
    ldr r2, _LIT2
    ldr r1, [ip, #0x64]
    mov r3, #0x14
    mov r0, r1, asr #0x1
    add r1, r1, r0, lsr #0x1e
    mov lr, r1, asr #0x2
    umull r0, r2, lr, r2
    mov r2, r2, lsr #0x4
    umull r2, r0, r3, r2
    ldr r0, [ip, #0x68]
    add r3, sp, #0x0
    rsb r2, r2, r1, asr #0x2
    ldr r5, [r3, r2, lsl #0x2]
    bl func_0201d4b4
    add r0, r0, #0xf6
    cmp r4, #0x0
    add ip, r0, #0x400
    beq .L_430
    cmp r5, #0x0
    bge .L_468
.L_430:
    mov r2, #0x0
    mov r0, r2
    mov r1, r2
.L_43c:
    mov r3, r1
.L_440:
    add r3, r3, #0x1
    cmp r3, #0x5
    strh r0, [ip], #0x2
    blt .L_440
    add r2, r2, #0x1
    cmp r2, #0x3
    add ip, ip, #0x36
    blt .L_43c
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
.L_468:
    rsb r0, r5, r5, lsl #0x4
    mov r2, #0x0
    add r4, r0, #0x290
    mov r1, r2
.L_478:
    mov r3, r1
.L_47c:
    orr r0, r4, #0x4000
    add r3, r3, #0x1
    cmp r3, #0x5
    add r4, r4, #0x1
    strh r0, [ip], #0x2
    blt .L_47c
    add r2, r2, #0x1
    cmp r2, #0x3
    add ip, ip, #0x36
    blt .L_478
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020bea2c
_LIT1: .word data_0219ad48
_LIT2: .word 0xcccccccd
