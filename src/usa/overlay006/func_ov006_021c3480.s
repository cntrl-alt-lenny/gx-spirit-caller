; func_ov006_021c3480 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0225df48
        .extern func_0202160c
        .extern func_0202165c
        .global func_ov006_021c3480
        .arm
func_ov006_021c3480:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    ldr r0, _LIT0
    ldr r4, [sl, #0x64]
    sub r0, r0, #0x8
    add r5, sl, #0x9c
    mov r8, #0x0
    str r0, [sp, #0x8]
.L_24:
    cmp r8, #0x0
    moveq r9, #0x21
    movne r9, #0x8
    ldr r0, [sl, #0x4]
    mov r1, #0x5
    mov r2, r9
    bl func_0202160c
    mov r6, r0
    ldr r0, [sl, #0x68]
    cmp r0, #0x0
    beq .L_98
    ldr r0, [r5, r4, lsl #0x4]
    cmp r0, #0x0
    blt .L_98
    cmp r0, #0x6
    bge .L_98
    cmp r8, #0x0
    bne .L_90
    ldr r0, _LIT1
    ldr r7, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    orreq r7, r7, #0x20
    b .L_9c
.L_90:
    ldr r7, [sp, #0x8]
    b .L_9c
.L_98:
    mov r7, #0x0
.L_9c:
    cmp r8, #0x0
    bne .L_c8
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0xb
    str r0, [sp]
    ldr r1, [r5, r4, lsl #0x4]
    mov r0, #0x13
    mul r0, r1, r0
    add fp, r0, #0x1b
    b .L_e8
.L_c8:
    mov r0, #0x13
    str r0, [sp, #0x4]
    mov r0, #0xf
    str r0, [sp]
    ldr r1, [r5, r4, lsl #0x4]
    mov r0, #0x13
    mul r0, r1, r0
    add fp, r0, #0x1e
.L_e8:
    mov r2, r9
    mov r0, r6
    mov r1, #0x2
    bl func_0202165c
    ldr r2, [sp]
    mov r0, r6
    mov r1, #0x3
    bl func_0202165c
    mov r2, fp
    mov r0, r6
    mov r1, #0x4
    bl func_0202165c
    mov r0, r6
    mov r1, #0x11
    mov r2, #0x3
    bl func_0202165c
    mov r0, r6
    mov r1, #0x12
    mov r2, #0x0
    bl func_0202165c
    mov r0, r6
    mov r1, #0xc
    mov r2, #0x0
    bl func_0202165c
    ldr r2, [sp, #0x4]
    mov r0, r6
    mov r1, #0xd
    bl func_0202165c
    mov r0, r6
    mov r2, r7
    mov r1, #0x0
    bl func_0202165c
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_24
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000001c9
_LIT1: .word data_ov006_0225df48
