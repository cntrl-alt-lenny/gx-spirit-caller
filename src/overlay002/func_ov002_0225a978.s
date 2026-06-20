; func_ov002_0225a978 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern func_ov002_021c93cc
        .global func_ov002_0225a978
        .arm
func_ov002_0225a978:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    cmp r1, #0x0
    ldmia r3, {r2, r3}
    rsbne lr, r2, #0x1
    ldr r5, _LIT1
    moveq lr, r2
    mov r4, #0x38
    mla ip, lr, r4, r5
    ldr r5, _LIT2
    cmp r0, r5
    bgt .L_94
    bge .L_2b0
    ldr r3, _LIT3
    cmp r0, r3
    bgt .L_54
    bge .L_fc
    sub r2, r3, #0xbe
    cmp r0, r2
    beq .L_288
    b .L_2cc
.L_54:
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_68
    beq .L_13c
    b .L_2cc
.L_68:
    add r1, r3, #0x384
    cmp r0, r1
    bgt .L_2cc
    add r1, r2, #0x170
    cmp r0, r1
    blt .L_2cc
    beq .L_174
    add r1, r3, #0x384
    cmp r0, r1
    beq .L_19c
    b .L_2cc
.L_94:
    ldr r4, _LIT5
    cmp r0, r4
    bgt .L_d0
    bge .L_188
    add lr, r5, #0x1cc
    cmp r0, lr
    bgt .L_c0
    mov r1, lr
    cmp r0, r1
    beq .L_1b4
    b .L_2cc
.L_c0:
    sub ip, r4, #0x60
    cmp r0, ip
    beq .L_1ec
    b .L_2cc
.L_d0:
    add lr, r4, #0x128
    cmp r0, lr
    bgt .L_ec
    mov r1, lr
    cmp r0, r1
    beq .L_21c
    b .L_2cc
.L_ec:
    ldr lr, _LIT6
    cmp r0, lr
    beq .L_250
    b .L_2cc
.L_fc:
    cmp r1, #0x0
    beq .L_12c
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_12c
    mov r2, #0x6
    ldmia ip, {r0, r1}
    bl func_ov002_021c93cc
    cmp r0, #0x0
    movne r1, #0x1
    bne .L_130
.L_12c:
    mov r1, #0x0
.L_130:
    mov r0, #0x3e8
    mul r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
.L_13c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_164
    mov r2, #0x2
    ldmia ip, {r0, r1}
    bl func_ov002_021c93cc
    cmp r0, #0x0
    movne r1, #0x1
    bne .L_168
.L_164:
    mov r1, #0x0
.L_168:
    mov r0, #0x1f4
    mul r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
.L_174:
    ldr r1, _LIT0
    mov r0, #0x3e8
    ldr r1, [r1, #0x8]
    mul r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
.L_188:
    ldr r1, _LIT0
    mov r0, #0x1f4
    ldr r1, [r1, #0x8]
    mul r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
.L_19c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x3e8
    ldmia sp!, {r3, r4, r5, pc}
.L_1b4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_1dc
    mov r2, #0x1
    ldmia ip, {r0, r1}
    bl func_ov002_021c93cc
    cmp r0, #0x0
    movne r1, #0x1
    bne .L_1e0
.L_1dc:
    mov r1, #0x0
.L_1e0:
    mov r0, #0x3e8
    mul r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
.L_1ec:
    ldr r0, _LIT0
    mov r4, #0x0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_208
    cmp r2, r3
    movne r4, #0x1
.L_208:
    cmp r1, #0x0
    mov r1, #0x1f4
    rsbeq r1, r1, #0x0
    mul r0, r1, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_21c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_238
    cmp r2, r3
    movne r1, #0x1
    bne .L_23c
.L_238:
    mov r1, #0x0
.L_23c:
    mov r0, #0xc8
    mul r0, r1, r0
    ldr r1, [ip, #0x28]
    mul r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
.L_250:
    cmp r1, #0x0
    cmpne r2, r3
    beq .L_278
    ldr r0, _LIT0
    ldr r1, [ip, #0x4]
    ldr r0, [r0, #0x1c]
    rsb r0, r0, #0x4
    cmp r1, r0
    moveq r1, #0x1
    beq .L_27c
.L_278:
    mov r1, #0x0
.L_27c:
    mov r0, #0x1f4
    mul r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
.L_288:
    cmp r1, #0x0
    bne .L_2a8
    mov r2, #0x1
    ldmia ip, {r0, r1}
    bl func_ov002_021c93cc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_2a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_2b0:
    cmp r1, #0x0
    bne .L_2c4
    cmp r2, r3
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_2c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_2cc:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022cd420
_LIT2: .word 0x00001621
_LIT3: .word 0x00001184
_LIT4: .word 0x00001397
_LIT5: .word 0x00001952
_LIT6: .word 0x00001aef
