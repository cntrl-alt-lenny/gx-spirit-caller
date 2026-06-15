; func_0206f4fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eeec
        .extern data_0219ef04
        .extern data_0219ef18
        .extern func_0206f688
        .extern func_0206fa48
        .extern func_02070f24
        .extern func_02070f44
        .extern func_02070f78
        .extern func_02070fe8
        .global func_0206f4fc
        .arm
func_0206f4fc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r0
    bl func_02070f44
    bl func_02070fe8
    cmp r4, #0x1
    bne .L_474
    ldr r1, _LIT0
    mov r0, #0x44
    ldr r2, [r1]
    mov r1, #0x43
    bl func_02070f78
    b .L_484
.L_474:
    mov r0, #0x44
    mov r1, #0x43
    mvn r2, #0x0
    bl func_02070f78
.L_484:
    mov r6, #0x0
.L_488:
    mov r0, r4
    bl func_0206fa48
    mov r1, r6
    bl func_0206f688
    movs r7, r0
    bne .L_4ac
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_488
.L_4ac:
    bl func_02070f24
    cmp r7, #0x2
    bne .L_4f0
    ldr r0, _LIT1
    mov r1, #0x3
    ldr r3, [r0]
    ldr r2, _LIT2
    mov r3, r3, lsr #0x1
    str r3, [r5]
    ldr r3, [r0]
    add sp, sp, #0x4
    mul r1, r3, r1
    mov r1, r1, lsr #0x3
    str r1, [r2]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_4f0:
    ldr r1, _LIT2
    cmp r4, #0x1
    ldr r0, [r1]
    mov r0, r0, lsr #0x1
    str r0, [r1]
    str r0, [r5]
    beq .L_518
    cmp r4, #0x2
    beq .L_53c
    b .L_548
.L_518:
    cmp r0, #0x3c
    bcs .L_548
    mov r2, #0x1
    ldr r0, _LIT1
    str r2, [r5]
    ldr r0, [r0]
    mov r0, r0, lsr #0x3
    str r0, [r1]
    b .L_548
.L_53c:
    cmp r0, #0x3c
    movcc r0, #0x1
    strcc r0, [r5]
.L_548:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219eeec
_LIT1: .word data_0219ef18
_LIT2: .word data_0219ef04
