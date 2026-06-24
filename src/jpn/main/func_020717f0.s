; func_020717f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02071944
        .extern func_0207198c
        .extern func_02071a8c
        .extern func_02071db4
        .extern func_02071ec8
        .extern func_0207214c
        .extern func_02073e40
        .global func_020717f0
        .arm
func_020717f0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    mov r0, r5
    mov r1, r4
    mov r2, r6
    mov r3, #0x6
    bl func_02073e40
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldrb r0, [r5, #0xc]
    ldrb r2, [r5, #0xd]
    and r1, r0, #0xf0
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    and r1, r2, #0x17
    cmp r1, #0x10
    sub r4, r4, r0, asr #0x2
    bgt .L_7a8
    cmp r1, #0x10
    bge .L_814
    cmp r1, #0x2
    bgt .L_844
    cmp r1, #0x1
    blt .L_844
    cmp r1, #0x1
    beq .L_82c
    cmp r1, #0x2
    beq .L_7cc
    b .L_844
.L_7a8:
    cmp r1, #0x12
    bgt .L_844
    cmp r1, #0x11
    blt .L_844
    cmp r1, #0x11
    beq .L_814
    cmp r1, #0x12
    beq .L_7f0
    b .L_844
.L_7cc:
    ands r0, r2, #0x28
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02071ec8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_7f0:
    ands r0, r2, #0x28
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02071db4
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_814:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02071a8c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_82c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0207198c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_844:
    ands r0, r2, #0x4
    beq .L_860
    mov r0, r6
    mov r1, r5
    bl func_02071944
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_860:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x0
    bl func_0207214c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
