; func_0204653c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_020480b4
        .extern func_0204931c
        .extern func_02050054
        .global func_0204653c
        .arm
func_0204653c:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x4
    addls pc, pc, r6, lsl #0x2
    b .L_16c
    b .L_16c
    b .L_140
    b .L_14c
    b .L_158
    b .L_164
.L_140:
    mov r4, #0x9
    mvn r5, #0x0
    b .L_16c
.L_14c:
    mov r4, #0x9
    mvn r5, #0x1
    b .L_16c
.L_158:
    mov r4, #0x6
    mvn r5, #0x9
    b .L_16c
.L_164:
    mov r4, #0x6
    mvn r5, #0x13
.L_16c:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1, #0x24]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_1fc
    b .L_1fc
    b .L_19c
    b .L_1b4
    b .L_1fc
    b .L_1f0
    b .L_1d8
.L_19c:
    ldr r1, _LIT1
    mov r0, r4
    add r5, r5, r1
    mov r1, r5
    bl func_020480b4
    b .L_204
.L_1b4:
    ldr r1, [r1, #0x9c]
    ldr r0, _LIT1
    cmp r1, #0x1
    add r5, r5, r0
    bge .L_204
    mov r0, r4
    mov r1, r5
    bl func_020480b4
    b .L_204
.L_1d8:
    ldr r1, _LIT2
    mov r0, r4
    add r5, r5, r1
    mov r1, r5
    bl func_02050054
    b .L_204
.L_1f0:
    ldr r0, _LIT3
    add r5, r5, r0
    b .L_204
.L_1fc:
    ldr r0, _LIT4
    add r5, r5, r0
.L_204:
    mov r0, r4
    mov r1, r5
    bl func_0204931c
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219daec
_LIT1: .word 0xffff11b8
_LIT2: .word 0xfffec398
_LIT3: .word 0xfffeeaa8
_LIT4: .word 0xfffe9c88
