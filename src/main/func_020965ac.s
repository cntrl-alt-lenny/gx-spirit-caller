; func_020965ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_020c35cc
        .extern func_02091a8c
        .extern func_02096728
        .global func_020965ac
        .arm
func_020965ac:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r0, [r8, #0xc]
    mov r7, r1
    mov r1, #0x1
    ldr r5, [r8, #0x8]
    mov r4, r1, lsl r7
    ands r0, r0, #0x4
    moveq r1, #0x0
    cmp r1, #0x0
    ldrne r0, [r5, #0x1c]
    orrne r0, r0, #0x200
    strne r0, [r5, #0x1c]
    ldreq r0, [r5, #0x1c]
    orreq r0, r0, #0x100
    streq r0, [r5, #0x1c]
    ldr r0, [r5, #0x58]
    ands r0, r0, r4
    beq .L_1bc
    ldr r2, [r5, #0x54]
    mov r0, r8
    mov r1, r7
    blx r2
    mov r6, r0
    cmp r6, #0x8
    addls pc, pc, r6, lsl #0x2
    b .L_1c0
    b .L_19c
    b .L_19c
    b .L_1c0
    b .L_1c0
    b .L_19c
    b .L_1c0
    b .L_1c0
    b .L_1c0
    b .L_1a4
.L_19c:
    str r6, [r8, #0x14]
    b .L_1c0
.L_1a4:
    ldr r1, [r5, #0x58]
    mvn r0, r4
    and r0, r1, r0
    str r0, [r5, #0x58]
    mov r6, #0x7
    b .L_1c0
.L_1bc:
    mov r6, #0x7
.L_1c0:
    cmp r6, #0x7
    bne .L_1dc
    ldr r1, _LIT0
    mov r0, r8
    ldr r1, [r1, r7, lsl #0x2]
    blx r1
    mov r6, r0
.L_1dc:
    cmp r6, #0x6
    bne .L_238
    ldr r0, [r8, #0xc]
    ands r0, r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_278
    bl OS_DisableIrq
    ldr r1, [r5, #0x1c]
    mov r4, r0
    ands r0, r1, #0x200
    beq .L_228
    add r6, r5, #0xc
.L_214:
    mov r0, r6
    bl func_02091a8c
    ldr r0, [r5, #0x1c]
    ands r0, r0, #0x200
    bne .L_214
.L_228:
    mov r0, r4
    ldr r6, [r8, #0x14]
    bl OS_RestoreIrq
    b .L_278
.L_238:
    ldr r0, [r8, #0xc]
    ands r0, r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldrne r0, [r5, #0x1c]
    bicne r0, r0, #0x200
    strne r0, [r5, #0x1c]
    strne r6, [r8, #0x14]
    bne .L_278
    ldr r1, [r5, #0x1c]
    mov r0, r8
    bic r2, r1, #0x100
    mov r1, r6
    str r2, [r5, #0x1c]
    bl func_02096728
.L_278:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_020c35cc
