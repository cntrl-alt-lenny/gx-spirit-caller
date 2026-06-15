; func_020718d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02071a2c
        .extern func_02071a74
        .extern func_02071b74
        .extern func_02071e9c
        .extern func_02071fb0
        .extern func_02072234
        .extern func_02073f28
        .global func_020718d8
        .arm
func_020718d8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    mov r0, r5
    mov r1, r4
    mov r2, r6
    mov r3, #0x6
    bl func_02073f28
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
    bgt .L_91c
    cmp r1, #0x10
    bge .L_988
    cmp r1, #0x2
    bgt .L_9b8
    cmp r1, #0x1
    blt .L_9b8
    cmp r1, #0x1
    beq .L_9a0
    cmp r1, #0x2
    beq .L_940
    b .L_9b8
.L_91c:
    cmp r1, #0x12
    bgt .L_9b8
    cmp r1, #0x11
    blt .L_9b8
    cmp r1, #0x11
    beq .L_988
    cmp r1, #0x12
    beq .L_964
    b .L_9b8
.L_940:
    ands r0, r2, #0x28
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02071fb0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_964:
    ands r0, r2, #0x28
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02071e9c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_988:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02071b74
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_9a0:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02071a74
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_9b8:
    ands r0, r2, #0x4
    beq .L_9d4
    mov r0, r6
    mov r1, r5
    bl func_02071a2c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_9d4:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x0
    bl func_02072234
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
