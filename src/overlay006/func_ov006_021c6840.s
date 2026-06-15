; func_ov006_021c6840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001d98
        .extern func_02004f58
        .extern func_02005554
        .extern func_0202c0c0
        .extern func_0202c44c
        .extern func_0208dd9c
        .extern func_02094504
        .global func_ov006_021c6840
        .arm
func_ov006_021c6840:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    bl func_0208dd9c
    mov r5, r0
    ldr r3, [sl, #0x4c]
    add r4, sl, #0x6c
    add r1, r5, #0xc40
    mov r0, #0x0
    mov r2, #0x4800
    add r6, r4, r3, lsl #0x4
    bl func_02094504
    add r0, sl, #0x8
    mov r1, #0x20
    mov r2, #0x12
    bl func_02001d0c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT1
    mov r8, #0xc
    mov r7, #0x0
    rsb r4, r0, #0x1cc
    mov fp, r8
.L_68:
    ldr r0, [r6, #0x4]
    adds r1, r0, r7
    bmi .L_f8
    ldr r0, [r6, #0x8]
    cmp r1, r0
    bge .L_f8
    add r0, sl, r1, lsl #0x4
    ldr r0, [r0, #0x7c]
    cmp r0, #0x0
    bne .L_9c
    ldr r0, _LIT1
    bl func_0202c0c0
    b .L_a0
.L_9c:
    bl func_0202c44c
.L_a0:
    mov r9, r0
    add r0, sl, #0x8
    mov r1, #0x5
    bl func_02001d98
    mov r0, r9
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005554
    cmp r0, #0xa8
    blt .L_d4
    add r0, sl, #0x8
    mov r1, #0x4
    bl func_02001d98
.L_d4:
    mov r1, r9
    add r0, sl, #0x8
    add r2, r5, #0xc40
    mov r3, #0x13
    stmia sp, {r8, fp}
    bl func_02004f58
    add r0, sl, #0x8
    mov r1, r4
    bl func_02001d98
.L_f8:
    add r7, r7, #0x1
    cmp r7, #0x6
    add r8, r8, #0x16
    blt .L_68
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
_LIT1: .word 0x000001cd
