; func_020489f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02048bc0
        .extern func_0204918c
        .extern func_02052df4
        .extern func_020535d4
        .extern func_02053644
        .extern func_02053650
        .global func_020489f8
        .arm
func_020489f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r1
    mov fp, r0
    mvn r0, #0x0
    str r2, [sp]
    cmp sl, #0x0
    str r0, [sp, #0x4]
    mov r8, #0x0
    ble .L_7e4
    mov r6, fp
    mov r5, fp
    mov r0, #0x1
    str r0, [sp, #0x8]
.L_71c:
    mov r0, r8
    bl func_0204918c
    movs r9, r0
    beq .L_7d0
    ldr r0, [sp]
    add r7, r8, #0x1
    cmp r9, r0
    streq r8, [sp, #0x4]
    cmp r7, sl
    bge .L_7d0
    mov r0, #0xc
    mla r4, r7, r0, fp
.L_74c:
    mov r0, r7
    bl func_0204918c
    cmp r9, r0
    bne .L_7c0
    mov r0, r6
    bl func_02053644
    cmp r0, #0x2
    bne .L_788
    mov r0, r4
    bl func_02053644
    cmp r0, #0x3
    bne .L_788
    mov r0, r5
    mov r1, r9
    bl func_02052df4
.L_788:
    mov r0, r4
    bl func_02053650
    cmp r0, #0x0
    beq .L_7a0
    mov r0, r5
    bl func_020535d4
.L_7a0:
    mov r0, fp
    mov r1, r7
    mov r2, r8
    bl func_02048bc0
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [sp, #0x8]
    strb r0, [r1, #0x1d]
.L_7c0:
    add r7, r7, #0x1
    cmp r7, sl
    add r4, r4, #0xc
    blt .L_74c
.L_7d0:
    add r8, r8, #0x1
    cmp r8, sl
    add r6, r6, #0xc
    add r5, r5, #0xc
    blt .L_71c
.L_7e4:
    ldr r0, [sp, #0x4]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219dc80
