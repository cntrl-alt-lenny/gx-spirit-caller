; func_0204b7dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204d3c4
        .extern func_0204ea5c
        .extern func_02092fc8
        .global func_0204b7dc
        .arm
func_0204b7dc:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r1
    cmp r5, #0xd
    mov r6, r0
    movne r4, #0x0
    bne .L_46c
    bl func_0204987c
    ldr r0, [r0, #0x204]
    mov r4, #0x1
    str r0, [sp, #0x8]
.L_46c:
    add r0, sp, #0x8
    str r0, [sp]
    mov r2, #0x0
    mov r0, r5
    mov r1, r6
    mov r3, r2
    str r4, [sp, #0x4]
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1e0]
    str r1, [r4, #0x1e4]
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
