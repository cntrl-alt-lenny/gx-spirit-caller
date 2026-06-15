; func_020038c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3ce0
        .extern data_02102c7c
        .extern data_02102cc4
        .extern data_02102d08
        .extern data_02102d4c
        .extern data_02103d4c
        .extern func_02038ad4
        .extern func_02092904
        .extern func_02097ea4
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .global func_020038c0
        .arm
func_020038c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x48
    mul r2, r1, r1
    ldr r3, _LIT0
    add r2, r2, r2, lsr #0x1f
    mov r4, r2, asr #0x1
    mov r2, r0, lsl #0x10
    cmp r0, r3
    mov r2, r2, lsr #0x10
    blt .L_54
    mov r2, r2, asr #0x8
    and r2, r2, #0xff
    cmp r2, #0xe0
    movcs r3, #0x40
    and r2, r2, #0xff
    and r6, r0, #0xff
    movcc r3, #0x0
    sub r2, r2, #0x88
    add r5, r6, #0x170
    sub r3, r2, r3
    b .L_68
.L_54:
    mov r2, r2, asr #0x8
    and r6, r0, #0xff
    and r2, r2, #0xff
    sub r5, r6, #0x40
    sub r3, r2, #0x81
.L_68:
    mov r2, #0xbc
    mla r2, r3, r2, r5
    sub r5, r2, r6, asr #0x7
    add r2, r1, r1, lsr #0x1f
    mov r3, r2, asr #0x1
    ldr r2, _LIT1
    sub r7, r3, #0x4
    ldr r2, [r2, r7, lsl #0x3]
    mul r5, r4, r5
    cmp r2, #0x0
    bne .L_164
    ldr r8, _LIT2
    ldr r3, _LIT3
    mov r6, #0x0
.L_a0:
    mov r2, r6, lsl #0x1
    ldrh r2, [r3, r2]
    cmp r0, r2
    ldreqb r2, [r8]
    cmpeq r2, r1
    ldreq r0, _LIT4
    addeq sp, sp, #0x48
    addeq r0, r0, r6, lsl #0x7
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r6, r6, #0x1
    cmp r6, #0x20
    add r8, r8, #0x1
    blt .L_a0
    ldr r3, _LIT5
    ldr lr, _LIT3
    ldr r6, [r3, #0xc]
    ldr ip, _LIT2
    add r9, r6, #0x1
    mov r8, r6, lsl #0x1
    mov r2, r9, lsr #0x1f
    strh r0, [lr, r8]
    rsb r0, r2, r9, lsl #0x1b
    add r2, r2, r0, ror #0x1b
    add r0, sp, #0x0
    str r2, [r3, #0xc]
    strb r1, [ip, r6]
    bl func_02098388
    ldr r1, _LIT6
    add r0, sp, #0x0
    ldr r1, [r1, r7, lsl #0x2]
    bl func_02098038
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x0
    bl func_02097ea4
    ldr r0, _LIT4
    mov r1, #0x80
    add r5, r0, r6, lsl #0x7
    mov r0, r5
    bl func_02092904
    mov r2, r4
    add r0, sp, #0x0
    mov r1, r5
    bl func_02038ad4
    add r0, sp, #0x0
    bl func_02097ff0
    add sp, sp, #0x48
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_164:
    add r0, r5, r2
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000889f
_LIT1: .word data_02102d08
_LIT2: .word data_02103d4c
_LIT3: .word data_02102cc4
_LIT4: .word data_02102d4c
_LIT5: .word data_02102c7c
_LIT6: .word data_020c3ce0
