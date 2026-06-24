; func_02048880 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02047790
        .extern func_02048094
        .extern func_02052e90
        .extern func_020556c4
        .extern func_02055744
        .global func_02048880
        .arm
func_02048880:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r2, [r2]
    mov r5, r0
    mov r4, r1
    str r3, [sp]
    cmp r2, #0x0
    beq .L_34
    bl func_02047790
    cmp r0, #0x0
    bne .L_40
.L_34:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_40:
    bl func_02048094
    mov r1, r5
    bl func_02052e90
    mov r5, r0
    cmp r5, #0x0
    ble .L_80
    ldr r0, _LIT0
    add r2, sp, #0x0
    ldr r0, [r0]
    mov r1, r5
    ldr r0, [r0, #0x4]
    bl func_020556c4
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, pc}
.L_80:
    cmp r5, #0x0
    ble .L_98
    ldr r1, [sp]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_a4
.L_98:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_a4:
    ldr r0, _LIT0
    mov r2, r4
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    bl func_02055744
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dba0
