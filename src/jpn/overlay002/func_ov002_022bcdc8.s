; func_ov002_022bcdc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_ov002_022bda78
        .global func_ov002_022bcdc8
        .arm
func_ov002_022bcdc8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_13ac
    b .L_1250
    b .L_126c
    b .L_12a4
    b .L_136c
    b .L_138c
.L_1250:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_13ac
.L_126c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x2d
    blt .L_13ac
    mov r3, #0x0
    str r3, [sp]
    ldr r2, [r4, #0xc58]
    ldr r0, _LIT1
    mov r1, #0x1a
    bl func_ov002_022bda78
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_13ac
.L_12a4:
    ldr r0, [r4, #0xc64]
    ldr r1, _LIT2
    sub r5, r0, #0x1e
    mov r3, r5, lsr #0x1f
    smull r0, ip, r1, r5
    smull r0, lr, r1, r5
    add ip, r3, ip, asr #0x1
    mov r2, #0x9
    smull r0, r1, r2, ip
    add lr, r3, lr, asr #0x1
    subs ip, r5, r0
    ldr r5, _LIT1
    bne .L_12fc
    cmp lr, #0x0
    blt .L_12fc
    cmp lr, #0x14
    bge .L_12fc
    mov r0, #0x5a
    sub r1, r0, #0x5b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_12fc:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xe4
    bne .L_131c
    mov r0, #0x5b
    sub r1, r0, #0x5c
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_131c:
    mov r1, #0x0
.L_1320:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_133c
    ldr r0, [r5, #0x4]
    cmp r0, #0x1a
    moveq r0, #0x1
    beq .L_1350
.L_133c:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r5, r5, #0x8
    blt .L_1320
    mov r0, #0x0
.L_1350:
    cmp r0, #0x0
    bne .L_13ac
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_13ac
.L_136c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_13ac
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_13ac
.L_138c:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_13ac:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1a18
_LIT1: .word data_ov002_022d281c
_LIT2: .word 0x38e38e39
