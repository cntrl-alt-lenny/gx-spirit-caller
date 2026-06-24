; func_0205fa50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100d40
        .extern func_02045398
        .extern func_0205ff4c
        .extern func_020a72e0
        .global func_0205fa50
        .arm
func_0205fa50:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r0, #0x144
    mov r5, r1
    mov r7, r2
    bl func_02045398
    movs r4, r0
    bne .L_3c
    ldr r1, _LIT0
    mov r0, r6
    bl func_0205ff4c
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_3c:
    mov r1, #0x0
    mov r2, #0x144
    bl func_020a72e0
    str r7, [r4]
    mvn r0, #0x0
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    str r0, [r4, #0x10]
    str r0, [r4, #0x14]
    str r0, [r4, #0xc]
    str r0, [r4, #0x20]
    str r0, [r4, #0x24]
    mov r0, #0x1000
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    bl func_02045398
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x13c]
    strne r0, [r4, #0x140]
    addne sp, sp, #0x4
    strne r4, [r5]
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    mov r0, r6
    bl func_0205ff4c
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02100d40
