; func_0204aa0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204525c
        .extern func_020469b4
        .extern func_020480b4
        .extern func_0204931c
        .extern func_02050054
        .global func_0204aa0c
        .arm
func_0204aa0c:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x5
    addls pc, pc, r6, lsl #0x2
    b .L_588
    b .L_588
    b .L_550
    b .L_55c
    b .L_568
    b .L_574
    b .L_580
.L_550:
    mov r4, #0x6
    mvn r5, #0x31
    b .L_588
.L_55c:
    mov r4, #0x6
    mvn r5, #0x3b
    b .L_588
.L_568:
    mov r4, #0x6
    mvn r5, #0x1d
    b .L_588
.L_574:
    mov r4, #0x6
    mvn r5, #0x4f
    b .L_588
.L_580:
    mov r4, #0x6
    mvn r5, #0x13
.L_588:
    bl func_020469b4
    cmp r0, #0x2
    beq .L_5a8
    cmp r0, #0x4
    beq .L_5b8
    cmp r0, #0x5
    beq .L_5cc
    b .L_5e0
.L_5a8:
    mov r0, r4
    sub r1, r5, #0xfa00
    bl func_020480b4
    b .L_5f0
.L_5b8:
    ldr r1, _LIT0
    mov r0, r4
    add r1, r5, r1
    bl func_0204931c
    b .L_5f0
.L_5cc:
    ldr r1, _LIT1
    mov r0, r4
    add r1, r5, r1
    bl func_02050054
    b .L_5f0
.L_5e0:
    ldr r1, _LIT2
    mov r0, r4
    add r1, r5, r1
    bl func_0204525c
.L_5f0:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0xfffedef0
_LIT1: .word 0xfffeb7e0
_LIT2: .word 0xfffe90d0
