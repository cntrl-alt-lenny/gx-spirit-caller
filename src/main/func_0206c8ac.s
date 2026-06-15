; func_0206c8ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101e48
        .extern func_0206c84c
        .extern func_0206e4a4
        .global func_0206c8ac
        .arm
func_0206c8ac:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0206e4a4
    cmp r0, #0x0
    bne .L_5e0
    ldrsh r0, [r6, #0x70]
    ands r0, r0, #0x8
    beq .L_5ec
.L_5e0:
    mvn r0, #0x1b
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_5ec:
    cmp r6, #0x0
    mov r1, #0x0
    beq .L_604
    ldrsh r0, [r6, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_604:
    cmp r1, #0x0
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrsb r0, [r6, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_62c
    cmp r0, #0x4
    movne r1, #0x0
.L_62c:
    cmp r1, #0x0
    beq .L_6a4
    ldrsh r0, [r6, #0x70]
    ands r0, r0, #0x4
    beq .L_658
    ldrsb r0, [r6, #0x72]
    cmp r0, #0x1
    mvneq r0, #0x1d
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_658:
    ldrsh r0, [r6, #0x70]
    ands r0, r0, #0x2
    beq .L_680
    ldrsh r0, [r6, #0x70]
    ands r0, r0, #0x40
    ldrne r0, [r6, #0x6c]
    ldreq r0, _LIT0
    ldreq r0, [r0]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_680:
    strh r5, [r6, #0x76]
    mov r0, r6
    str r4, [r6, #0x78]
    bl func_0206c84c
    ldrsb r1, [r6, #0x72]
    cmp r1, #0x1
    mvnne r0, #0x19
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_6a4:
    strh r5, [r6, #0x76]
    str r4, [r6, #0x78]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_02101e48
