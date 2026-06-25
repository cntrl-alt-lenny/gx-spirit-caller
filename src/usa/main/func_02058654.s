; func_02058654 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100270
        .extern data_02100284
        .extern data_0210028c
        .extern func_02045364
        .extern func_02054de0
        .extern func_02054dfc
        .extern func_0205790c
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_02058818
        .extern func_0205bce4
        .extern func_0205ca40
        .extern func_0205d4ec
        .global func_02058654
        .arm
func_02058654:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r4, [r5]
    ldr r2, [r4, #0x1d8]
    cmp r2, #0x4
    addeq sp, sp, #0x10
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r2, #0x0
    beq .L_ec
    cmp r1, #0x0
    beq .L_64
    cmp r2, #0x3
    bne .L_64
    ldr r2, _LIT0
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x198]
    mov r0, r5
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT1
    mov r0, r5
    add r1, r4, #0x1f4
    bl func_02057ffc
.L_64:
    mov r1, #0x1
    ldr r0, _LIT2
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x1d4]
    add r3, sp, #0x8
    mov r0, r5
    add r2, r4, #0x1f4
    bl func_0205790c
    ldr r0, [r4, #0x1d4]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_b0
    mov r1, #0x2
    bl func_02054de0
    ldr r0, [r4, #0x1d4]
    bl func_02054dfc
    mvn r0, #0x0
    str r0, [r4, #0x1d4]
.L_b0:
    ldr r0, [r4, #0x204]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_d8
    mov r1, #0x2
    bl func_02054de0
    ldr r0, [r4, #0x204]
    bl func_02054dfc
    mvn r0, #0x0
    str r0, [r4, #0x204]
.L_d8:
    mov r0, #0x4
    str r0, [r4, #0x1d8]
    mov r0, #0x0
    str r0, [r4, #0x19c]
    str r0, [r4, #0x1a0]
.L_ec:
    ldr r0, [r4, #0x1dc]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x1dc]
    ldr r0, [r4, #0x1ec]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x1ec]
    ldr r0, [r4, #0x1f4]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x1f4]
    ldr r0, [r4, #0x440]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x440]
    ldr r0, [r4, #0x450]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x450]
    ldr r1, [r4, #0x424]
    cmp r1, #0x0
    beq .L_15c
.L_148:
    mov r0, r5
    bl func_0205bce4
    ldr r1, [r4, #0x424]
    cmp r1, #0x0
    bne .L_148
.L_15c:
    mov r0, #0x0
    str r0, [r4, #0x424]
    ldr r6, [r4, #0x434]
    cmp r6, #0x0
    beq .L_188
.L_170:
    mov r1, r6
    ldr r6, [r6, #0x3c]
    mov r0, r5
    bl func_0205ca40
    cmp r6, #0x0
    bne .L_170
.L_188:
    mov r6, #0x0
    str r6, [r4, #0x434]
    ldr r4, _LIT3
.L_194:
    mov r0, r5
    mov r1, r4
    mov r2, r6
    bl func_0205d4ec
    cmp r0, #0x0
    beq .L_194
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100270
_LIT1: .word data_02100284
_LIT2: .word data_0210028c
_LIT3: .word func_02058818
