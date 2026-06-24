; func_02022d00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197354
        .extern data_0219a754
        .global func_02022d00
        .arm
func_02022d00:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldrsh r2, [r1, #0x76]
    ldrsh r1, [r1, #0x74]
    cmp r2, r1
    beq .L_360
    add r2, r4, #0x3400
    ldrsh r1, [r2, #0x76]
    ldrsh ip, [r2, #0x74]
    cmp r1, ip
    beq .L_360
    add r2, r4, #0x2b4
    mov r4, #0x0
    ldr r3, [r0]
    add r9, r2, #0x1000
    mov r5, #0x1
    mov r8, r4
    mov lr, #0x3c
.L_22c:
    mla r2, r1, lr, r9
    mov sl, r8
    cmp r3, #0x0
    bne .L_24c
    ldr r7, [r2, #0x34]
    ldr r6, [r0, #0x4]
    cmp r7, r6
    moveq sl, r5
.L_24c:
    cmp sl, #0x0
    beq .L_34c
    ldr r1, [r2]
    cmp r1, #0x0
    beq .L_270
    cmp r1, #0x1
    cmpne r1, #0x2
    beq .L_2d4
    b .L_344
.L_270:
    ldr r0, [r0, #0x8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_344
    b .L_290
    b .L_2ac
    b .L_2b8
    b .L_2c4
.L_290:
    mvn r0, #0x0
    str r0, [r2, #0x24]
    str r0, [r2, #0x28]
    mov r0, #0x0
    str r0, [r2, #0x30]
    str r0, [r2, #0x34]
    b .L_344
.L_2ac:
    mvn r0, #0x0
    str r0, [r2, #0x24]
    b .L_344
.L_2b8:
    mvn r0, #0x0
    str r0, [r2, #0x28]
    b .L_344
.L_2c4:
    mov r0, #0x0
    str r0, [r2, #0x30]
    str r0, [r2, #0x34]
    b .L_344
.L_2d4:
    ldr r0, [r0, #0x8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_344
    b .L_2f4
    b .L_318
    b .L_328
    b .L_338
.L_2f4:
    ldr r0, [r2, #0x2c]
    mvn r3, #0x0
    str r3, [r0, #0xc]
    ldr r1, [r2, #0x2c]
    mov r0, #0x0
    strh r3, [r1, #0x10]
    str r0, [r2, #0x30]
    str r0, [r2, #0x34]
    b .L_344
.L_318:
    ldr r0, [r2, #0x2c]
    mvn r1, #0x0
    str r1, [r0, #0xc]
    b .L_344
.L_328:
    ldr r0, [r2, #0x2c]
    mvn r1, #0x0
    strh r1, [r0, #0x10]
    b .L_344
.L_338:
    mov r0, #0x0
    str r0, [r2, #0x30]
    str r0, [r2, #0x34]
.L_344:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_34c:
    add r1, r1, #0x1
    cmp r1, #0x90
    movge r1, r4
    cmp r1, ip
    bne .L_22c
.L_360:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219a754
_LIT1: .word data_02197354
