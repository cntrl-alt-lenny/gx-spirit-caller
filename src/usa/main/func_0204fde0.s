; func_0204fde0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204b05c
        .extern func_0204bae8
        .extern func_0204c398
        .global func_0204fde0
        .arm
func_0204fde0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, r2
    cmp r1, #0x2
    beq .L_28
    cmp r1, #0x3
    beq .L_d4
    cmp r1, #0x4
    beq .L_19c
    ldmia sp!, {r4, r5, r6, pc}
.L_28:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x1
    bne .L_c4
    ldrb r0, [r4]
    cmp r0, #0x1
    bne .L_50
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x204]
.L_50:
    ldrb r6, [r4, #0x1]
    bl func_0204987c
    ldrb r1, [r4, #0x2]
    add r0, r0, r6
    strb r1, [r0, #0x2c8]
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldr r1, [r0, #0x1f8]
    add r0, r4, r6, lsl #0x2
    str r1, [r0, #0xf4]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_9c
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_b0
.L_9c:
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x16]
.L_b0:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a5]
    mov r0, #0x9
    bl func_02049868
.L_c4:
    mov r0, r5
    mov r1, #0x3
    bl func_0204bae8
    ldmia sp!, {r4, r5, r6, pc}
.L_d4:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x10
    bne .L_18c
    bl func_0204987c
    ldr r2, [r0, #0x1cc]
    mov r1, #0x1
    orr r1, r2, r1, lsl r5
    str r1, [r0, #0x1cc]
    ldrb r1, [r4]
    ldrb r0, [r4, #0x1]
    orr r4, r1, r0, lsl #0x8
    bl func_0204987c
    add r0, r0, #0x100
    ldrh r0, [r0, #0xa8]
    cmp r4, r0
    ble .L_124
    bl func_0204987c
    add r0, r0, #0x100
    strh r4, [r0, #0xa8]
.L_124:
    mov r0, #0x0
    bl func_0204b05c
    mov r4, r0
    bl func_0204987c
    ldr r0, [r0, #0x1cc]
    cmp r4, r0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r5, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_180
    mov r4, #0x4
.L_158:
    bl func_0204987c
    add r0, r0, r5
    ldrb r0, [r0, #0x2c8]
    mov r1, r4
    bl func_0204bae8
    add r5, r5, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r5, r0
    ble .L_158
.L_180:
    mov r0, #0x11
    bl func_02049868
    ldmia sp!, {r4, r5, r6, pc}
.L_18c:
    mov r0, r5
    mov r1, #0x4
    bl func_0204bae8
    ldmia sp!, {r4, r5, r6, pc}
.L_19c:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x9
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x4
    bl func_0204c398
    ldmia sp!, {r4, r5, r6, pc}
