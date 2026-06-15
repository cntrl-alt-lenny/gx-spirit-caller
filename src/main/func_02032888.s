; func_02032888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032d58
        .extern func_020334cc
        .extern func_02033864
        .extern func_02046ae0
        .extern func_02051a84
        .extern func_02051ec0
        .global func_02032888
        .arm
func_02032888:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r4, [sp, #0x24]
    mov r8, r0
    mov r0, r4
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_020334cc
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    cmp r7, #0x0
    bne .L_48
    cmp r6, #0x0
    beq .L_48
    mov r0, r4
    bl func_02033864
.L_48:
    bl func_02046ae0
    cmp r0, #0x1
    bne .L_bc
    bl func_02051a84
    cmp r0, #0x2
    bne .L_6c
    ldr r0, [r4, #0xeb4]
    tst r0, #0x10000
    beq .L_8c
.L_6c:
    ldr r0, [r4, #0xeb4]
    bic r2, r0, #0x2000
    bic r0, r2, #0x1000
    bic r1, r0, #0x4000
    bic r0, r1, #0x10000
    orr r0, r0, #0x20000
    str r0, [r4, #0xeb4]
    bl func_02051ec0
.L_8c:
    bl func_02051a84
    cmp r0, #0x2
    bne .L_dc
    ldr r0, [r4, #0xeb4]
    tst r0, #0x40000
    beq .L_dc
    mov r0, r4
    bl func_02033864
    ldr r0, [r4, #0xeb4]
    orr r0, r0, #0x20000
    str r0, [r4, #0xeb4]
    b .L_dc
.L_bc:
    bl func_02051a84
    cmp r0, #0x2
    bne .L_dc
    ldr r0, [r4, #0xeb4]
    tst r0, #0x40000
    beq .L_dc
    mov r0, r4
    bl func_02032d58
.L_dc:
    ldr ip, [r4, #0xecc]
    cmp ip, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r4, [sp, #0x20]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    blx ip
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
