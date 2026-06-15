; func_0202df78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202df78
        .arm
func_0202df78:
    cmp r0, r1
    moveq r0, #0x1
    bxeq lr
    ldr ip, _LIT0
    cmp r0, ip
    bgt .L_121c
    bge .L_135c
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_11d8
    bge .L_12f8
    sub r2, r3, #0x31c
    cmp r0, r2
    bgt .L_11b4
    bge .L_1314
    ldr r3, _LIT2
    cmp r0, r3
    bgt .L_13c8
    sub r2, r3, #0x1
    cmp r0, r2
    blt .L_13c8
    cmpne r0, r3
    beq .L_12e0
    b .L_13c8
.L_11b4:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_11c8
    beq .L_1330
    b .L_13c8
.L_11c8:
    add r2, r2, #0x110
    cmp r0, r2
    beq .L_135c
    b .L_13c8
.L_11d8:
    add r2, r3, #0x148
    cmp r0, r2
    bgt .L_11f8
    bge .L_1314
    add r2, r3, #0x1e
    cmp r0, r2
    beq .L_12f8
    b .L_13c8
.L_11f8:
    sub r2, ip, #0x94
    cmp r0, r2
    bgt .L_120c
    beq .L_1330
    b .L_13c8
.L_120c:
    add r2, r3, #0x214
    cmp r0, r2
    beq .L_1378
    b .L_13c8
.L_121c:
    ldr r3, _LIT4
    cmp r0, r3
    bgt .L_1288
    bge .L_13b4
    add r2, ip, #0x46
    cmp r0, r2
    bgt .L_1264
    add r2, ip, #0x45
    cmp r0, r2
    blt .L_1254
    addne r2, ip, #0x46
    cmpne r0, r2
    beq .L_1378
    b .L_13c8
.L_1254:
    add r2, ip, #0x44
    cmp r0, r2
    beq .L_1378
    b .L_13c8
.L_1264:
    sub r2, r3, #0x2
    cmp r0, r2
    bgt .L_1278
    beq .L_13b4
    b .L_13c8
.L_1278:
    sub r2, r3, #0x1
    cmp r0, r2
    beq .L_13b4
    b .L_13c8
.L_1288:
    add r2, r3, #0x1b8
    cmp r0, r2
    bgt .L_12bc
    bge .L_1330
    add r2, r3, #0xbe
    cmp r0, r2
    bgt .L_12ac
    beq .L_139c
    b .L_13c8
.L_12ac:
    add r2, r3, #0xbf
    cmp r0, r2
    beq .L_139c
    b .L_13c8
.L_12bc:
    add r2, ip, #0x320
    cmp r0, r2
    bgt .L_12d0
    beq .L_1330
    b .L_13c8
.L_12d0:
    ldr r2, _LIT5
    cmp r0, r2
    beq .L_1330
    b .L_13c8
.L_12e0:
    ldr r0, _LIT6
    add r0, r1, r0
    cmp r0, #0x1
    bhi .L_13c8
    mov r0, #0x1
    bx lr
.L_12f8:
    ldr r0, _LIT1
    cmp r1, r0
    addne r0, r0, #0x1e
    cmpne r1, r0
    bne .L_13c8
    mov r0, #0x1
    bx lr
.L_1314:
    ldr r0, _LIT7
    cmp r1, r0
    ldrne r0, _LIT8
    cmpne r1, r0
    bne .L_13c8
    mov r0, #0x1
    bx lr
.L_1330:
    ldr r0, _LIT3
    cmp r1, r0
    ldrne r0, _LIT9
    cmpne r1, r0
    beq .L_1354
    ldr r0, _LIT10
    add r0, r1, r0
    cmp r0, #0x2
    bhi .L_13c8
.L_1354:
    mov r0, #0x1
    bx lr
.L_135c:
    ldr r0, _LIT11
    cmp r1, r0
    ldrne r0, _LIT0
    cmpne r1, r0
    bne .L_13c8
    mov r0, #0x1
    bx lr
.L_1378:
    ldr r0, _LIT12
    cmp r1, r0
    beq .L_1394
    ldr r0, _LIT13
    add r0, r1, r0
    cmp r0, #0x2
    bhi .L_13c8
.L_1394:
    mov r0, #0x1
    bx lr
.L_139c:
    ldr r0, _LIT14
    add r0, r1, r0
    cmp r0, #0x1
    bhi .L_13c8
    mov r0, #0x1
    bx lr
.L_13b4:
    ldr r0, _LIT15
    add r0, r1, r0
    cmp r0, #0x2
    movls r0, #0x1
    bxls lr
.L_13c8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000150b
_LIT1: .word 0x000012e5
_LIT2: .word 0x00000fa7
_LIT3: .word 0x00000fe4
_LIT4: .word 0x00001672
_LIT5: .word 0x0000182c
_LIT6: .word 0xfffff05a
_LIT7: .word 0x00000fc9
_LIT8: .word 0x0000142d
_LIT9: .word 0x00001477
_LIT10: .word 0xffffe7d6
_LIT11: .word 0x000010f4
_LIT12: .word 0x000014f9
_LIT13: .word 0xffffeab1
_LIT14: .word 0xffffe8d0
_LIT15: .word 0xffffe990
