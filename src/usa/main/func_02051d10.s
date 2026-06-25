; func_02051d10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045230
        .extern func_02046948
        .extern func_0204987c
        .extern func_0204f7ac
        .global func_02051d10
        .arm
func_02051d10:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_02045230
    cmp r0, #0x0
    bne .L_2c0
    bl func_0204987c
    cmp r0, #0x0
    beq .L_2c0
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_2c0
    bl func_02046948
    cmp r0, #0x5
    beq .L_2c8
    bl func_02046948
    cmp r0, #0x6
    beq .L_2c8
.L_2c0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2c8:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xa
    bne .L_304
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x16]
    bl func_0204f7ac
    cmp r6, #0x0
    beq .L_320
    mov r0, r5
    blx r6
    b .L_320
.L_304:
    bl func_0204987c
    str r6, [r0, #0x474]
    bl func_0204987c
    str r5, [r0, #0x478]
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x1a6]
.L_320:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
