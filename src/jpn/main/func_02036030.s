; func_02036030 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02035fa4
        .extern func_02036010
        .extern func_02036c18
        .extern func_02036c1c
        .extern func_020371fc
        .extern func_020386a4
        .extern func_0203c53c
        .extern func_0208735c
        .extern func_020874a4
        .extern func_020874e0
        .extern func_02087d44
        .extern func_02087dc8
        .extern func_02087e3c
        .global func_02036030
        .arm
func_02036030:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrsb r0, [r4, #0x6a]
    mov r2, r1
    cmp r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r1, [r4, #0x68]
    ldr r0, _LIT0
    tst r1, r0
    ldrh r1, [r4, #0x68]
    ldr r0, _LIT1
    movne r2, #0x0
    and r0, r1, r0
    strh r0, [r4, #0x68]
    ldr r0, [r4, #0x34]
    cmp r2, #0x0
    mov r0, r0, lsr #0x14
    and r1, r0, #0xf
    bne .L_158
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_10c
    b .L_10c
    b .L_70
    b .L_b8
    b .L_94
    b .L_dc
    b .L_f4
.L_70:
    add r0, r4, #0x4
    mov r1, #0x0
    bl func_02087e3c
    add r0, r4, #0x4
    bl func_02087dc8
    bl func_02036010
    mov r0, r4
    bl func_02035fa4
    b .L_10c
.L_94:
    add r0, r4, #0x4
    mov r1, #0x0
    bl func_02087e3c
    add r0, r4, #0x4
    bl func_02087dc8
    bl func_02036010
    mov r0, r4
    bl func_02035fa4
    b .L_10c
.L_b8:
    add r0, r4, #0x4
    mov r1, #0x0
    bl func_02087e3c
    add r0, r4, #0x4
    bl func_02087dc8
    bl func_02036010
    mov r0, r4
    bl func_02035fa4
    b .L_10c
.L_dc:
    add r0, r4, #0x4
    mov r1, #0x0
    bl func_0203c53c
    mov r0, r4
    bl func_02035fa4
    b .L_10c
.L_f4:
    ldr r0, [r4, #0x4]
    bl func_020874a4
    ldr r0, [r4, #0x4]
    bl func_020874e0
    ldr r0, [r4, #0x4]
    bl func_0208735c
.L_10c:
    mov r0, r4
    mov r1, #0x1
    bl func_02036c1c
    mvn r2, #0x0
    mov r1, #0x0
    strb r2, [r4, #0x6a]
    str r1, [r4]
    strb r2, [r4, #0x6e]
    ldrsb r0, [r4, #0x6e]
    strb r0, [r4, #0x6d]
    strb r2, [r4, #0x6f]
    strh r1, [r4, #0x74]
    str r1, [r4, #0x34]
    strh r1, [r4, #0x68]
    str r1, [r4, #0x5c]
    str r1, [r4, #0x8]
    bl func_020371fc
    bl func_02036c18
    ldmia sp!, {r4, pc}
.L_158:
    ldrh r0, [r4, #0x68]
    cmp r1, #0x5
    orr r0, r0, #0x400
    strh r0, [r4, #0x68]
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_188
    b .L_188
    b .L_188
    b .L_1a4
    b .L_1b4
.L_188:
    mov r1, r2
    add r0, r4, #0x4
    bl func_02087e3c
    add r0, r4, #0x4
    mov r1, #0x0
    bl func_02087d44
    ldmia sp!, {r4, pc}
.L_1a4:
    mov r1, r2
    add r0, r4, #0x4
    bl func_0203c53c
    ldmia sp!, {r4, pc}
.L_1b4:
    add r0, r4, #0x40
    mov r1, #0x0
    bl func_020386a4
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00004003
_LIT1: .word 0xffffefe0
