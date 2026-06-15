; func_02064208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054140
        .extern func_02061798
        .extern func_02061b60
        .global func_02064208
        .arm
func_02064208:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r0, #0x5
    beq .L_594
    cmp r0, #0x6
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_594:
    ldr r0, [r6, #0x9c]
    bl func_02054140
    cmp r0, #0x0
    beq .L_5d0
    mov r1, #0x0
    mov r0, r6
    mov r2, r5
    mov r3, r4
    str r1, [sp]
    bl func_02061798
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x8
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_5d0:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x0
    bl func_02061b60
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
