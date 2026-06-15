; func_020657c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3f0
        .extern func_02054e8c
        .extern func_0206588c
        .extern func_02065acc
        .extern func_02065e78
        .extern func_02065ee0
        .global func_020657c0
        .arm
func_020657c0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr ip, _LIT0
    mov r8, r0
    ldr r0, [ip]
    mov r7, r1
    cmp r0, #0x1
    mov r6, r2
    mov r5, r3
    movne r0, #0x2
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_0206588c
    cmp r0, #0x0
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_02065ee0
    movs r4, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    str r8, [r4, #0x4]
    str r6, [r4, #0xc]
    str r7, [r4, #0x8]
    ldr r1, [sp, #0x18]
    str r5, [r4, #0x34]
    mov r0, #0x2
    ldr r2, [sp, #0x1c]
    str r1, [r4, #0x38]
    mov r1, r0
    str r2, [r4, #0x3c]
    mov r2, #0x0
    bl func_02054e8c
    str r0, [r4]
    mov r0, #0x0
    str r0, [r4, #0x20]
    strb r0, [r4, #0x32]
    strb r0, [r4, #0x33]
    str r0, [r4, #0x2c]
    strh r0, [r4, #0x30]
    str r0, [r4, #0x24]
    ldr r1, [r4]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_ac8
    mov r0, r4
    bl func_02065e78
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_ac8:
    mov r0, r4
    bl func_02065acc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219e3f0
