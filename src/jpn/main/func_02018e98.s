; func_02018e98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020191dc
        .global func_02018e98
        .arm
func_02018e98:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl GetSystemWork
    mov r4, r0
    cmp r7, #0x0
    bne .L_34
    ldr r0, [r4, #0x908]
    str r0, [r6]
    ldr r0, [r4, #0x90c]
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_34:
    mov r0, r7
    bl func_020191dc
    sub r1, r0, #0x1
    mov r0, #0x18
    mul r2, r1, r0
    ldr r0, [r4, r2]
    add r1, r4, r2
    str r0, [r6]
    ldr r0, [r1, #0x4]
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
