; func_02048984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02048b4c
        .extern func_02049118
        .extern func_02052d80
        .extern func_02053560
        .extern func_020535d0
        .extern func_020535dc
        .global func_02048984
        .arm
func_02048984:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r1
    mov fp, r0
    mvn r0, #0x0
    str r2, [sp]
    cmp sl, #0x0
    str r0, [sp, #0x4]
    mov r8, #0x0
    ble .L_134
    mov r6, fp
    mov r5, fp
    mov r0, #0x1
    str r0, [sp, #0x8]
.L_6c:
    mov r0, r8
    bl func_02049118
    movs r9, r0
    beq .L_120
    ldr r0, [sp]
    add r7, r8, #0x1
    cmp r9, r0
    streq r8, [sp, #0x4]
    cmp r7, sl
    bge .L_120
    mov r0, #0xc
    mla r4, r7, r0, fp
.L_9c:
    mov r0, r7
    bl func_02049118
    cmp r9, r0
    bne .L_110
    mov r0, r6
    bl func_020535d0
    cmp r0, #0x2
    bne .L_d8
    mov r0, r4
    bl func_020535d0
    cmp r0, #0x3
    bne .L_d8
    mov r0, r5
    mov r1, r9
    bl func_02052d80
.L_d8:
    mov r0, r4
    bl func_020535dc
    cmp r0, #0x0
    beq .L_f0
    mov r0, r5
    bl func_02053560
.L_f0:
    mov r0, fp
    mov r1, r7
    mov r2, r8
    bl func_02048b4c
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [sp, #0x8]
    strb r0, [r1, #0x1d]
.L_110:
    add r7, r7, #0x1
    cmp r7, sl
    add r4, r4, #0xc
    blt .L_9c
.L_120:
    add r8, r8, #0x1
    cmp r8, sl
    add r6, r6, #0xc
    add r5, r5, #0xc
    blt .L_6c
.L_134:
    ldr r0, [sp, #0x4]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219dba0
