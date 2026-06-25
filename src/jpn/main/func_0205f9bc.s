; func_0205f9bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02056034
        .extern func_0205bdec
        .extern func_0205fb14
        .global func_0205f9bc
        .arm
func_0205f9bc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    ldr r4, [r5]
    ldr ip, [sp, #0x20]
    ldr lr, [r4, #0x210]
    add lr, lr, #0x1
    str lr, [r4, #0x210]
    str r2, [sp]
    str r3, [sp, #0x4]
    mov r2, r1
    add r3, sp, #0xc
    mov r1, #0x3
    str ip, [sp, #0x8]
    bl func_0205bdec
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, pc}
    ldr r1, [sp, #0xc]
    mov r0, r5
    bl func_0205fb14
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, pc}
    ldr r1, [sp, #0xc]
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    beq .L_2070
    ldr r1, [r1, #0x18]
    mov r0, r5
    bl func_02056034
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, pc}
.L_2070:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
