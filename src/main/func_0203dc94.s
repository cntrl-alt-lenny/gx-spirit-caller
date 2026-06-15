; func_0203dc94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203dc94
        .arm
func_0203dc94:
    ldrb r1, [r0, #0x16]
    cmp r1, #0xa
    bcs .L_5fc
    ldrb r1, [r0, #0x14]
    cmp r1, #0x3
    ldreqb r1, [r0, #0x15]
    ldreq r0, _LIT0
    subeq r2, r0, r1
    beq .L_6b4
    cmp r1, #0x4
    ldreqb r1, [r0, #0x15]
    moveq r0, #0xc800
    rsbeq r0, r0, #0x0
    subeq r2, r0, r1
    ldrneb r1, [r0, #0x15]
    ldrne r0, _LIT1
    subne r2, r0, r1
    b .L_6b4
.L_5fc:
    cmp r1, #0xd
    ldrccb r1, [r0, #0x15]
    ldrcc r0, _LIT2
    subcc r2, r0, r1
    bcc .L_6b4
    ldr r2, [r0, #0x10]
    cmp r2, #0x0
    ldreqb r1, [r0, #0x15]
    ldreq r0, _LIT3
    subeq r2, r0, r1
    beq .L_6b4
    mvn r1, #0x0
    cmp r2, r1
    ldreqb r1, [r0, #0x15]
    ldreq r0, _LIT4
    subeq r2, r0, r1
    beq .L_6b4
    mvn r1, #0x1
    cmp r2, r1
    ldreqb r1, [r0, #0x15]
    ldreq r0, _LIT5
    subeq r2, r0, r1
    beq .L_6b4
    mvn r1, #0x2
    cmp r2, r1
    ldreqb r1, [r0, #0x15]
    ldreq r0, _LIT6
    subeq r2, r0, r1
    beq .L_6b4
    mvn r1, #0x3
    cmp r2, r1
    ldreqb r1, [r0, #0x15]
    ldreq r0, _LIT7
    subeq r2, r0, r1
    beq .L_6b4
    mvn r1, #0x4
    cmp r2, r1
    ldreqb r1, [r0, #0x15]
    ldreq r0, _LIT8
    subeq r2, r0, r1
    beq .L_6b4
    mvn r1, #0x5
    cmp r2, r1
    ldreqb r1, [r0, #0x15]
    ldreq r0, _LIT9
    subeq r2, r0, r1
.L_6b4:
    mov r0, r2
    bx lr
_LIT0: .word 0xffff3864
_LIT1: .word 0xffff379c
_LIT2: .word 0xffff34e0
_LIT3: .word 0xffff3cb0
_LIT4: .word 0xffff347c
_LIT5: .word 0xffff3418
_LIT6: .word 0xffff33b4
_LIT7: .word 0xffff30f8
_LIT8: .word 0xffff3094
_LIT9: .word 0xffff3030
