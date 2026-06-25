; func_02066d8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02066e6c
        .extern func_02066fb0
        .extern func_020aace8
        .extern func_020aad04
        .global func_02066d8c
        .arm
func_02066d8c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x48
    mov r5, r3
    cmp r5, #0x1
    mov r6, r0
    mov r4, r1
    addlt sp, sp, #0x48
    ldmltia sp!, {r4, r5, r6, pc}
    cmp r5, #0x41
    addgt sp, sp, #0x48
    ldmgtia sp!, {r4, r5, r6, pc}
    sub r0, r5, #0x1
    ldrsb r0, [r2, r0]
    cmp r0, #0x0
    addne sp, sp, #0x48
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, sp, #0x0
    mov r1, r2
    bl func_020aad04
    add r0, r6, #0x44
    bl func_020aace8
    mov r1, r0
    add r2, sp, #0x0
    add r0, r6, #0x44
    sub r3, r5, #0x1
    bl func_02066e6c
    ldr r2, [r4, #0x800]
    sub r1, r5, #0x1
    add r0, sp, #0x0
    add r2, r4, r2
    bl func_02066fb0
    ldr r0, [r4, #0x800]
    add r0, r4, r0
    bl func_020aace8
    ldr r1, [r4, #0x800]
    add r0, r0, #0x1
    add r0, r1, r0
    str r0, [r4, #0x800]
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, pc}
