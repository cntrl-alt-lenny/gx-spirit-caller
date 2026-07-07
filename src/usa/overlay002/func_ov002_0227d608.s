; func_ov002_0227d608 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b89c
        .extern func_ov002_021c4bbc
        .extern func_ov002_0227d508
        .extern func_ov002_0227d594
        .extern func_ov002_0227d760
        .global func_ov002_0227d608
        .arm
func_ov002_0227d608:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x2c
    cmp r2, #0x0
    moveq r5, #0x1
    mov r9, r0
    movne r5, #0x0
    mov r8, r1
    mov r7, r3
    mov r0, r9
    mov r1, r5
    ldr r6, [sp, #0x48]
    bl func_ov002_0227d508
    mov r4, r0
    cmp r7, #0x0
    mov r0, #0x0
    ble .L_70
    mov r3, #0x1
.L_44:
    mov r1, r0, lsl #0x1
    ldrh ip, [r6, r1]
    add r0, r0, #0x1
    cmp r0, r7
    mov r1, ip, asr #0x8
    and r2, r1, #0xff
    and r1, ip, #0xff
    add r1, r2, r1, lsl #0x4
    mvn r1, r3, lsl r1
    and r4, r4, r1
    blt .L_44
.L_70:
    mov r0, r9
    mov r1, r5
    mov r2, r4
    bl func_ov002_0227d594
    mvn r1, #0x0
    cmp r0, r1
    addne sp, sp, #0x2c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r5
    mov r2, r4
    bl func_ov002_0227d760
    mov r4, r0
    mvn r0, #0x0
    cmp r4, r0
    beq .L_124
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    add r2, sp, #0x0
    and r0, r4, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c4bbc
    ldr r1, _LIT0
    cmp r8, r1
    addne r0, r1, #0x2cc
    cmpne r8, r0
    addne r0, r1, #0x300
    cmpne r8, r0
    bne .L_fc
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    addgt sp, sp, #0x2c
    movgt r0, r4
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_fc:
    ldr r0, [sp, #0x10]
    cmp r0, #0x6
    bge .L_124
    mov r0, r8
    bl func_0202b89c
    ldr r1, [sp, #0x14]
    cmp r0, r1
    addgt sp, sp, #0x2c
    movgt r0, r4
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_124:
    mvn r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00001388
