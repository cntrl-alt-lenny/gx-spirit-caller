; func_02045b1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020aaddc
        .extern func_020aaec0
        .extern func_020ab054
        .extern Strchr
        .global func_02045b1c
        .arm
func_02045b1c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r4, r1
    mov r7, r0
    mov r6, r3
    addeq sp, sp, #0x4
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r0, r2
    mov r1, r6
    bl Strchr
    movs r5, r0
    addeq sp, sp, #0x4
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_194:
    mov r0, r7
    bl func_020aaddc
    mov r2, r0
    mov r1, r7
    add r0, r5, #0x1
    bl func_020ab054
    cmp r0, #0x0
    bne .L_1cc
    mov r0, r7
    bl func_020aaddc
    add r0, r0, r5
    ldrsb r0, [r0, #0x1]
    cmp r6, r0
    beq .L_208
.L_1cc:
    mov r1, r6
    add r0, r5, #0x1
    bl Strchr
    cmp r0, #0x0
    addeq sp, sp, #0x4
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r1, r6
    add r0, r0, #0x1
    bl Strchr
    movs r5, r0
    bne .L_194
    add sp, sp, #0x4
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_208:
    mov r1, r6
    add r0, r5, #0x1
    bl Strchr
    movs r5, r0
    addeq sp, sp, #0x4
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r1, r6
    add r0, r5, #0x1
    bl Strchr
    cmp r0, #0x0
    addne r1, r5, #0x1
    subne r6, r0, r1
    bne .L_24c
    add r0, r5, #0x1
    bl func_020aaddc
    mov r6, r0
.L_24c:
    mov r0, r4
    mov r2, r6
    add r1, r5, #0x1
    bl func_020aaec0
    mov r1, #0x0
    mov r0, r6
    strb r1, [r4, r6]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
