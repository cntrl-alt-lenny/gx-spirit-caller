; func_0208a48c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020892a4
        .extern func_0208a25c
        .global func_0208a48c
        .arm
func_0208a48c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldr r0, [sp, #0x20]
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_020892a4
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r4, #0x0
    ldrltb r4, [r0, #0x8]
    cmp r5, #0x0
    ldrlth r5, [r0, #0x4]
    cmp r6, #0x0
    ldrltb r6, [r0, #0x9]
    ldr ip, [sp, #0x20]
    mov r2, r5
    str r0, [sp]
    mov r0, r7
    mov r1, r6
    mov r3, r4
    str ip, [sp, #0x4]
    bl func_0208a25c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
