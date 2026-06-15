; func_02089f60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208906c
        .extern func_020890e4
        .extern func_020897fc
        .extern func_020928e8
        .global func_02089f60
        .arm
func_02089f60:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r4, r3
    bl func_020890e4
    movs r5, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r2, r7
    mov r3, r6
    add r1, r5, #0x20
    str r4, [sp]
    bl func_020897fc
    movs r4, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    bl func_0208906c
    cmp r5, r0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    mov r1, r5
    bl func_020928e8
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
