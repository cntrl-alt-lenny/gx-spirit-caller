; func_02009610 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern .L_02020fb4
        .extern data_02104e5c
        .extern func_02007214
        .extern func_02090780
        .extern func_020907d8
        .extern func_0209bee0
        .extern func_0209bef0
        .extern func_0209bfd8
        .extern func_0209c6e8
        .global func_02009610
        .arm
func_02009610:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    bl func_0209bfd8
    cmp r0, #0x0
    beq .L_43c
    bl func_02090780
    mov r4, r0
    mvn r0, #0x2
    cmp r4, r0
    beq .L_43c
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bef0
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    mov r1, #0x6
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    add r1, sp, #0x14
    mov r3, r0
    mov r2, #0x4
    str r0, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT0
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    bne .L_424
    mov r3, #0x0
    str r3, [sp, #0x14]
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov r1, #0xa
    str r1, [sp, #0xc]
    mov ip, #0x2
    add r0, sp, #0x14
    mov r1, #0x8000
    mov r2, #0x4
    str ip, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT0
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orr r1, r1, r2
    str r1, [r0, #0x4]
.L_424:
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bee0
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020907d8
.L_43c:
    bl func_02007214
    cmp r0, #0x0
    beq .L_44c
    bl .L_02020fb4
.L_44c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104e5c
