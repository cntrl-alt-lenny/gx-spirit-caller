; func_ov005_021aaf2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern func_020b377c
        .extern func_ov005_021aaecc
        .global func_ov005_021aaf2c
        .arm
func_ov005_021aaf2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r1
    add r2, r5, #0x1
    mov r1, #0x1c
    mul r1, r2, r1
    add r6, r1, #0xc
    mov r7, r0
    mov r0, r6
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    movs r4, r0
    beq .L_e8
    mov r1, r4
    mov r2, r6
    mov r0, #0x0
    bl Fill32
    mov r0, #0x49
    strb r0, [r4]
    mov r0, #0x54
    strb r0, [r4, #0x1]
    strb r0, [r4, #0x2]
    mov r0, #0x4d
    strb r0, [r4, #0x3]
    mov r0, r7
    mov r1, r4
    stmib r4, {r5, r6}
    bl func_ov005_021aaecc
    mov r1, #0x0
    str r1, [r4, #0xc]
    str r1, [r4, #0x10]
    str r1, [r4, #0x14]
    str r5, [r4, #0x18]
    sub r0, r1, #0x1
    str r0, [r4, #0x1c]
    str r1, [r4, #0x20]
    str r1, [r4, #0x24]
    cmp r5, #0x1
    add r8, r4, #0x28
    mov r9, #0x1
    blt .L_e8
    mov r7, r1
    mov r6, r1
.L_ac:
    str r9, [r8]
    mov r0, r9
    mov r1, r5
    str r7, [r8, #0x4]
    bl func_020b377c
    add r0, r1, #0x1
    str r0, [r8, #0x8]
    str r6, [r8, #0xc]
    str r6, [r8, #0x10]
    str r6, [r8, #0x14]
    add r9, r9, #0x1
    str r6, [r8, #0x18]
    cmp r9, r5
    add r8, r8, #0x1c
    ble .L_ac
.L_e8:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
