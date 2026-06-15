; func_0203ec1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c85c
        .extern func_0203c900
        .extern func_0203d524
        .extern func_0203e254
        .extern func_0207b5f8
        .extern func_0207bfd4
        .global func_0203ec1c
        .arm
func_0203ec1c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    bl func_0207b5f8
    mov r4, r0
    mov r0, #0x10
    bl func_0203c900
    cmp r4, #0x1
    bne .L_888
    ldrb r1, [r0, #0xd0a]
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    bl func_0203e254
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_0207bfd4
    cmp r0, #0x1
    beq .L_874
    cmp r0, #0x4
    blt .L_894
.L_874:
    mov r0, #0x1
    bl func_0203c85c
    add sp, sp, #0x10
    mov r0, #0x11
    ldmia sp!, {r4, pc}
.L_888:
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_894:
    mov r0, #0x2
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word func_0203d524
