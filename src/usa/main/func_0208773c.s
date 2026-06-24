; func_0208773c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207cef4
        .extern func_0207cf74
        .global func_0208773c
        .arm
func_0208773c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r1, #0x0
    mov r5, r0
    bl func_0207cef4
    movs r1, r0
    beq .L_9c
.L_7c:
    ldrb r2, [r4, #0x3d]
    ldrb r0, [r1, #0x3d]
    cmp r2, r0
    bcc .L_9c
    mov r0, r5
    bl func_0207cef4
    movs r1, r0
    bne .L_7c
.L_9c:
    mov r0, r5
    mov r2, r4
    bl func_0207cf74
    str r5, [r4, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
