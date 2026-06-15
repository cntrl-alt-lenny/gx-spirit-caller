; func_020298f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern func_02006e1c
        .extern func_02022580
        .global func_020298f8
        .arm
func_020298f8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r7, #0x0
    add r4, r5, #0x98
    mov r6, r7
.L_240:
    add r0, r4, r7, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_25c
    bl Task_InvokeLocked
    add r0, r4, r7, lsl #0x2
    str r6, [r0, #0x8]
.L_25c:
    add r7, r7, #0x1
    cmp r7, #0x18
    blt .L_240
    mov r7, #0x0
    mov r6, r7
.L_270:
    add r0, r4, r7, lsl #0x2
    ldr r0, [r0, #0x68]
    cmp r0, #0x0
    beq .L_28c
    bl func_02006e1c
    add r0, r4, r7, lsl #0x2
    str r6, [r0, #0x68]
.L_28c:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_270
    add r0, r5, #0x100
    ldrsh r0, [r0, #0x84]
    add r4, r5, #0x87
    cmp r0, #0x0
    blt .L_2c8
    bl func_02022580
    add r0, r5, #0x100
    mvn r1, #0x0
    strh r1, [r0, #0x84]
    ldrb r0, [r4, #0x100]
    bic r0, r0, #0x1
    strb r0, [r4, #0x100]
.L_2c8:
    ldr r0, [r5, #0x188]
    cmp r0, #0x0
    beq .L_2e0
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r5, #0x188]
.L_2e0:
    add r1, r5, #0x100
    ldrh r2, [r1, #0x9a]
    mov r0, #0x1
    bic r2, r2, #0x1
    strh r2, [r1, #0x9a]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
