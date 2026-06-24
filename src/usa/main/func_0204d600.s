; func_0204d600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dbac
        .extern func_0204987c
        .extern func_0204b20c
        .extern func_0204cdc8
        .extern func_0204d3c4
        .extern func_02055654
        .extern func_02067368
        .global func_0204d600
        .arm
func_0204d600:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r8, r3
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_68
    cmp r0, #0x1
    beq .L_38
    cmp r0, #0x2
    beq .L_248
    b .L_2fc
.L_38:
    bl func_0204987c
    ldr r0, [r0]
    mov r1, r7
    bl func_02055654
    cmp r0, #0x0
    moveq r4, #0xff
    beq .L_2fc
    mov r0, r7
    bl func_0204b20c
    cmp r0, #0x0
    moveq r4, #0x3
    beq .L_2fc
.L_68:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r8, r0
    bne .L_d0
    bl func_0204987c
    ldrb r0, [r0, #0x1a1]
    cmp r0, #0x0
    bne .L_d0
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r1, [r4, #0x14]
    ldrb r0, [r0, #0x16]
    cmp r1, r0
    beq .L_d0
    bl func_0204987c
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_134
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldr r1, [r4, #0x20]
    ldr r0, [r0, #0x1f8]
    cmp r1, r0
    bne .L_134
.L_d0:
    mov r4, #0x3
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_2fc
    bl func_0204987c
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0xb4]
    cmp r0, #0x0
    bne .L_2fc
    bl func_0204987c
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_2fc
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldr r1, [r5, #0x20]
    ldr r0, [r0, #0x1f8]
    cmp r1, r0
    bne .L_2fc
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_02067368
    b .L_2fc
.L_134:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x3
    beq .L_154
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x4
    bne .L_184
.L_154:
    bl func_0204987c
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    bne .L_174
    bl func_0204987c
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    beq .L_184
.L_174:
    cmp r6, #0x0
    bne .L_18c
    cmp r5, #0x0
    bne .L_18c
.L_184:
    mov r4, #0x4
    b .L_2fc
.L_18c:
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    cmp r0, #0x0
    beq .L_240
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    cmp r7, r0
    bne .L_1e8
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    bne .L_1d8
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    cmp r0, r7
    bge .L_1e0
    bl func_0204987c
    ldr r0, [r0, #0x200]
    cmp r7, r0
    beq .L_1e0
.L_1d8:
    mov r4, #0x2
    b .L_2fc
.L_1e0:
    mov r4, #0xff
    b .L_2fc
.L_1e8:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    bne .L_214
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    cmp r0, r7
    bge .L_238
    bl func_0204987c
    ldr r0, [r0, #0x200]
    cmp r0, #0x0
    bne .L_238
.L_214:
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    bl func_0204cdc8
    bl func_0204d3c4
    cmp r0, #0x0
    movne r0, #0xff
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r4, #0x2
    b .L_2fc
.L_238:
    mov r4, #0x3
    b .L_2fc
.L_240:
    mov r4, #0x2
    b .L_2fc
.L_248:
    bl func_0204987c
    ldr r0, [r0]
    mov r1, r7
    bl func_02055654
    cmp r0, #0x0
    moveq r4, #0xff
    beq .L_2fc
    cmp r8, #0x3
    bne .L_288
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r1, [r4, #0x14]
    ldrb r0, [r0, #0x16]
    cmp r1, r0
    bne .L_290
.L_288:
    mov r4, #0x3
    b .L_2fc
.L_290:
    ldr r0, _LIT0
    ldrb r1, [r0]
    cmp r1, #0x1
    bne .L_2b0
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    moveq r4, #0x13
    beq .L_2fc
.L_2b0:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xa
    bne .L_2f0
    bl func_0204987c
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    bne .L_2e0
    bl func_0204987c
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    beq .L_2f0
.L_2e0:
    cmp r6, #0x0
    bne .L_2f8
    cmp r5, #0x0
    bne .L_2f8
.L_2f0:
    mov r4, #0x4
    b .L_2fc
.L_2f8:
    mov r4, #0x2
.L_2fc:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219dbac
