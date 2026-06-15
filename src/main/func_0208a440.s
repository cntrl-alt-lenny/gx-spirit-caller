; func_0208a440 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02089024
        .extern func_02089328
        .extern func_0208a280
        .extern func_0208b000
        .global func_0208a440
        .arm
func_0208a440:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r8, r0
    ldr r0, [sp, #0x28]
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_02089328
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r0]
    bl func_02089024
    movs r4, r0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [sp, #0x2c]
    bl func_0208b000
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r5, #0x0
    ldrltb r5, [r0, #0x8]
    cmp r6, #0x0
    ldrlth r6, [r0, #0x4]
    cmp r7, #0x0
    ldrltb r7, [r0, #0x9]
    ldr ip, [sp, #0x2c]
    mov r2, r6
    str r0, [sp]
    ldr r0, [sp, #0x28]
    str r4, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r0, r8
    mov r1, r7
    mov r3, r5
    str ip, [sp, #0xc]
    bl func_0208a280
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
