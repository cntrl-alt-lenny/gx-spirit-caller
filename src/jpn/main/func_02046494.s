; func_02046494 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02048040
        .extern func_020492a8
        .extern func_0204ffe0
        .global func_02046494
        .arm
func_02046494:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x4
    addls pc, pc, r6, lsl #0x2
    b .L_5c
    b .L_5c
    b .L_30
    b .L_3c
    b .L_48
    b .L_54
.L_30:
    mov r4, #0x9
    mvn r5, #0x0
    b .L_5c
.L_3c:
    mov r4, #0x9
    mvn r5, #0x1
    b .L_5c
.L_48:
    mov r4, #0x6
    mvn r5, #0x9
    b .L_5c
.L_54:
    mov r4, #0x6
    mvn r5, #0x13
.L_5c:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1, #0x24]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_ec
    b .L_ec
    b .L_8c
    b .L_a4
    b .L_ec
    b .L_e0
    b .L_c8
.L_8c:
    ldr r1, _LIT1
    mov r0, r4
    add r5, r5, r1
    mov r1, r5
    bl func_02048040
    b .L_f4
.L_a4:
    ldr r1, [r1, #0x9c]
    ldr r0, _LIT1
    cmp r1, #0x1
    add r5, r5, r0
    bge .L_f4
    mov r0, r4
    mov r1, r5
    bl func_02048040
    b .L_f4
.L_c8:
    ldr r1, _LIT2
    mov r0, r4
    add r5, r5, r1
    mov r1, r5
    bl func_0204ffe0
    b .L_f4
.L_e0:
    ldr r0, _LIT3
    add r5, r5, r0
    b .L_f4
.L_ec:
    ldr r0, _LIT4
    add r5, r5, r0
.L_f4:
    mov r0, r4
    mov r1, r5
    bl func_020492a8
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219da0c
_LIT1: .word 0xffff11b8
_LIT2: .word 0xfffec398
_LIT3: .word 0xfffeeaa8
_LIT4: .word 0xfffe9c88
