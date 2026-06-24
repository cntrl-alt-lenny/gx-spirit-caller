; func_0204a998 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204520c
        .extern func_02046948
        .extern func_02048040
        .extern func_020492a8
        .extern func_0204ffe0
        .global func_0204a998
        .arm
func_0204a998:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x5
    addls pc, pc, r6, lsl #0x2
    b .L_6c
    b .L_6c
    b .L_34
    b .L_40
    b .L_4c
    b .L_58
    b .L_64
.L_34:
    mov r4, #0x6
    mvn r5, #0x31
    b .L_6c
.L_40:
    mov r4, #0x6
    mvn r5, #0x3b
    b .L_6c
.L_4c:
    mov r4, #0x6
    mvn r5, #0x1d
    b .L_6c
.L_58:
    mov r4, #0x6
    mvn r5, #0x4f
    b .L_6c
.L_64:
    mov r4, #0x6
    mvn r5, #0x13
.L_6c:
    bl func_02046948
    cmp r0, #0x2
    beq .L_8c
    cmp r0, #0x4
    beq .L_9c
    cmp r0, #0x5
    beq .L_b0
    b .L_c4
.L_8c:
    mov r0, r4
    sub r1, r5, #0xfa00
    bl func_02048040
    b .L_d4
.L_9c:
    ldr r1, _LIT0
    mov r0, r4
    add r1, r5, r1
    bl func_020492a8
    b .L_d4
.L_b0:
    ldr r1, _LIT1
    mov r0, r4
    add r1, r5, r1
    bl func_0204ffe0
    b .L_d4
.L_c4:
    ldr r1, _LIT2
    mov r0, r4
    add r1, r5, r1
    bl func_0204520c
.L_d4:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0xfffedef0
_LIT1: .word 0xfffeb7e0
_LIT2: .word 0xfffe90d0
