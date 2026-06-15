; func_02063188 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02055330
        .extern func_02061670
        .extern func_020643ec
        .extern func_02064d10
        .global func_02063188
        .arm
func_02063188:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_02064d10
    ldr r1, [r7, #0x2c]
    mov r4, r0
    cmp r1, #0x0
    beq .L_8c0
    mov r0, #0x1
    str r0, [sp]
    mov ip, #0x0
    str ip, [sp, #0x4]
    str ip, [sp, #0x8]
    mov r0, r7
    mov r1, r4
    mov r2, r6
    mov r3, r5
    str ip, [sp, #0xc]
    bl func_02061670
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_8c0:
    cmp r4, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bne .L_930
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq .L_900
    bl func_02055330
    ldr r2, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    sub r0, r0, r2
    cmp r0, r1
    bcs .L_90c
.L_900:
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_90c:
    mov r0, r4
    mov r1, #0x6
    mov r2, #0x1
    bl func_020643ec
    cmp r0, #0x0
    bne .L_950
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_930:
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x1
    bl func_020643ec
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_950:
    mov r0, #0x1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
