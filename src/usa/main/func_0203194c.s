; func_0203194c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031a1c
        .extern func_02031cb8
        .global func_0203194c
        .arm
func_0203194c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr sl, [r7, #0x24]
    mov r6, r1
    cmp sl, #0x0
    ldrne ip, [sl, #0x4]
    mov r5, r2
    mov r4, r3
    mov r9, #0x0
    cmpne ip, #0x0
    beq .L_8c
    mvn r8, #0x0
.L_34:
    cmp r6, r8, lsl #0x10
    beq .L_48
    ldr r0, [sl]
    cmp r0, r8
    beq .L_54
.L_48:
    ldr r0, [sl]
    cmp r0, r6
    bne .L_7c
.L_54:
    ldr lr, [sl, #0x8]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    str lr, [sp]
    blx ip
    orr r9, r9, r0
    tst r9, #0x2
    bne .L_8c
.L_7c:
    add sl, sl, #0xc
    ldr ip, [sl, #0x4]
    cmp ip, #0x0
    bne .L_34
.L_8c:
    tst r9, #0x4
    addne sp, sp, #0x4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, #0x10000
    rsb r0, r0, #0x0
    cmp r6, r0
    mov r0, r7
    bne .L_b8
    bl func_02031cb8
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_b8:
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_02031a1c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
