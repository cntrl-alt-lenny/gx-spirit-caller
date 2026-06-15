; func_0203dc10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203db24
        .extern func_0203db70
        .extern func_02043250
        .extern func_020432d0
        .global func_0203dc10
        .arm
func_0203dc10:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4]
    cmp r0, #0xa
    bhi .L_578
    bl func_0203db70
    cmp r0, #0x1
    moveq r0, #0x0
    streqb r0, [r4]
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    mvn r1, #0x0
    cmp r0, r1
    bne .L_5ac
    mov r0, #0x12
    strb r0, [r4]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_578:
    cmp r0, #0xe
    bne .L_594
    bl func_02043250
    bl func_020432d0
    mov r0, #0xc
    strb r0, [r4]
    b .L_5ac
.L_594:
    cmp r0, #0x12
    bcs .L_5ac
    bl func_0203db24
    cmp r0, #0x1
    moveq r0, #0xa
    streqb r0, [r4]
.L_5ac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
