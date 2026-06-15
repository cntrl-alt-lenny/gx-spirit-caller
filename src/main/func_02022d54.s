; func_02022d54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197434
        .extern data_0219a834
        .global func_02022d54
        .arm
func_02022d54:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldrsh r2, [r1, #0x76]
    ldrsh r1, [r1, #0x74]
    cmp r2, r1
    beq .L_994
    add r2, r4, #0x3400
    ldrsh r1, [r2, #0x76]
    ldrsh ip, [r2, #0x74]
    cmp r1, ip
    beq .L_994
    add r2, r4, #0x2b4
    mov r4, #0x0
    ldr r3, [r0]
    add r9, r2, #0x1000
    mov r5, #0x1
    mov r8, r4
    mov lr, #0x3c
.L_860:
    mla r2, r1, lr, r9
    mov sl, r8
    cmp r3, #0x0
    bne .L_880
    ldr r7, [r2, #0x34]
    ldr r6, [r0, #0x4]
    cmp r7, r6
    moveq sl, r5
.L_880:
    cmp sl, #0x0
    beq .L_980
    ldr r1, [r2]
    cmp r1, #0x0
    beq .L_8a4
    cmp r1, #0x1
    cmpne r1, #0x2
    beq .L_908
    b .L_978
.L_8a4:
    ldr r0, [r0, #0x8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_978
    b .L_8c4
    b .L_8e0
    b .L_8ec
    b .L_8f8
.L_8c4:
    mvn r0, #0x0
    str r0, [r2, #0x24]
    str r0, [r2, #0x28]
    mov r0, #0x0
    str r0, [r2, #0x30]
    str r0, [r2, #0x34]
    b .L_978
.L_8e0:
    mvn r0, #0x0
    str r0, [r2, #0x24]
    b .L_978
.L_8ec:
    mvn r0, #0x0
    str r0, [r2, #0x28]
    b .L_978
.L_8f8:
    mov r0, #0x0
    str r0, [r2, #0x30]
    str r0, [r2, #0x34]
    b .L_978
.L_908:
    ldr r0, [r0, #0x8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_978
    b .L_928
    b .L_94c
    b .L_95c
    b .L_96c
.L_928:
    ldr r0, [r2, #0x2c]
    mvn r3, #0x0
    str r3, [r0, #0xc]
    ldr r1, [r2, #0x2c]
    mov r0, #0x0
    strh r3, [r1, #0x10]
    str r0, [r2, #0x30]
    str r0, [r2, #0x34]
    b .L_978
.L_94c:
    ldr r0, [r2, #0x2c]
    mvn r1, #0x0
    str r1, [r0, #0xc]
    b .L_978
.L_95c:
    ldr r0, [r2, #0x2c]
    mvn r1, #0x0
    strh r1, [r0, #0x10]
    b .L_978
.L_96c:
    mov r0, #0x0
    str r0, [r2, #0x30]
    str r0, [r2, #0x34]
.L_978:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_980:
    add r1, r1, #0x1
    cmp r1, #0x90
    movge r1, r4
    cmp r1, ip
    bne .L_860
.L_994:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219a834
_LIT1: .word data_02197434
