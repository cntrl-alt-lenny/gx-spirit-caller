; func_02067910 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020679d8
        .extern func_02067a20
        .global func_02067910
        .arm
func_02067910:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r7, r2
    mov r9, r0
    mov r8, r1
    cmp r7, #0x1
    bcs .L_f4
    bl func_020679d8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_f4:
    mov r0, #0x0
.L_f8:
    strb r0, [r9, r0]
    add r0, r0, #0x1
    cmp r0, #0x100
    blt .L_f8
    mov r0, #0x0
    str r0, [sp, #0xc]
    strb r0, [sp, #0x8]
    mov r6, #0xff
    add r5, sp, #0x8
    add r4, sp, #0xc
.L_120:
    str r5, [sp]
    mov r0, r9
    mov r1, r6
    mov r2, r8
    mov r3, r7
    str r4, [sp, #0x4]
    bl func_02067a20
    ldrb r2, [r9, r6]
    ldrb r1, [r9, r0]
    strb r1, [r9, r6]
    strb r2, [r9, r0]
    subs r6, r6, #0x1
    bpl .L_120
    ldrb r1, [r9, #0x1]
    mov r0, #0x0
    strb r1, [r9, #0x100]
    ldrb r1, [r9, #0x3]
    strb r1, [r9, #0x101]
    ldrb r1, [r9, #0x5]
    strb r1, [r9, #0x102]
    ldrb r1, [r9, #0x7]
    strb r1, [r9, #0x103]
    ldrb r1, [sp, #0x8]
    ldrb r1, [r9, r1]
    strb r1, [r9, #0x104]
    strb r0, [sp, #0x8]
    str r0, [sp, #0xc]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
