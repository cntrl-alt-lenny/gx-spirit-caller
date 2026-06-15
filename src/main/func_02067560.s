; func_02067560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebc4
        .extern func_02054d14
        .extern func_02055000
        .extern func_0206627c
        .global func_02067560
        .arm
func_02067560:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x18
    mov r1, #0x8
    mov r4, r0
    str r1, [sp, #0x10]
    ldr r0, [r4, #0xc4]
    cmp r0, #0x0
    addeq sp, sp, #0x18
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r4]
    bl func_02055000
    cmp r0, #0x0
    addeq sp, sp, #0x18
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r8, _LIT0
    add sl, sp, #0x8
    add r9, sp, #0x10
    mov r6, #0x0
    mov r7, #0xff
    mvn r5, #0x0
.L_25c:
    str sl, [sp]
    str r9, [sp, #0x4]
    ldr r0, [r4]
    mov r1, r8
    mov r2, r7
    mov r3, r6
    bl func_02054d14
    mov r2, r0
    cmp r2, r5
    beq .L_298
    mov r0, r4
    mov r1, r8
    mov r3, sl
    strb r6, [r8, r2]
    bl func_0206627c
.L_298:
    ldr r0, [r4]
    bl func_02055000
    cmp r0, #0x0
    bne .L_25c
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219ebc4
