; func_0201a5c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02105e6c
        .extern func_02018a50
        .extern func_02018b60
        .extern func_0201908c
        .extern func_02019a24
        .extern func_0201a3b8
        .extern func_0201a464
        .extern func_0201a4a8
        .extern func_0201a4fc
        .extern func_0201a560
        .extern func_0201a58c
        .global func_0201a5c0
        .arm
func_0201a5c0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl GetSystemWork
    mov r4, r0
    cmp r7, #0x0
    mov r5, #0x0
    beq .L_28
    cmp r7, #0x1
    beq .L_9c
    b .L_16c
.L_28:
    bl func_0201a4a8
    cmp r0, #0x0
    beq .L_94
    cmp r0, #0x2
    bne .L_54
    ldr r0, [r4, #0x8e8]
    mov r1, r0, lsl #0x16
    movs r1, r1, lsr #0x1f
    orreq r0, r0, #0x200
    streq r0, [r4, #0x8e8]
    orreq r5, r5, #0x2
.L_54:
    bl func_0201908c
    cmp r0, #0x3
    orreq r5, r5, #0x4
    bl func_0201a560
    cmp r0, #0x0
    orrne r5, r5, #0x8
    bl func_0201a3b8
    cmp r0, #0x0
    orrne r5, r5, #0x10
    bne .L_88
    bl func_0201a464
    cmp r0, #0x0
    orrne r5, r5, #0x20
.L_88:
    cmp r5, #0x0
    orreq r5, r5, #0x40
    b .L_16c
.L_94:
    orr r5, r5, #0x1
    b .L_16c
.L_9c:
    bl func_0201a58c
    ldr r1, _LIT0
    ldr r2, [r1, #0x864]
    mvn r2, r2
    ands r2, r0, r2
    beq .L_c8
    str r2, [r4, #0x904]
    ldr r0, [r1, #0x864]
    orr r5, r5, #0x80
    orr r0, r0, r2
    str r0, [r1, #0x864]
.L_c8:
    bl func_0201a4fc
    cmp r0, #0x0
    beq .L_168
    bl func_0201a4a8
    cmp r0, #0x1
    beq .L_108
    cmp r0, #0x2
    cmpne r0, #0x3
    bne .L_120
    ldr r0, _LIT0
    mov r6, #0x1f
    ldr r1, [r0, #0x858]
    sub r1, r1, #0x388
    sub r1, r1, #0x1000
    str r1, [r0, #0x858]
    b .L_120
.L_108:
    ldr r0, _LIT0
    mov r6, #0x1e
    ldr r1, [r0, #0x854]
    sub r1, r1, #0x388
    sub r1, r1, #0x1000
    str r1, [r0, #0x854]
.L_120:
    bl func_02018b60
    mov r4, r0
    mov r0, r6
    bl func_02019a24
    mov r1, #0x10000
    ldr r2, [r4, #0x18]
    rsb r1, r1, #0x0
    and r1, r2, r1
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x18]
    bl func_02018b60
    ldr r0, [r0, #0x18]
    mov r1, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_02018a50
    orr r5, r5, #0x100
.L_168:
    orr r5, r5, #0x200
.L_16c:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02105e6c
