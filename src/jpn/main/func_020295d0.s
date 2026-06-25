; func_020295d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_02022b20
        .extern func_02029664
        .extern func_020aad04
        .global func_020295d0
        .arm
func_020295d0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x3c
    mov r5, r0
    ldr r0, [r5, #0x68]
    add r4, r5, #0x90
    cmp r0, #0x0
    beq .L_1e8
    add r1, sp, #0x0
    mov r0, #0x0
    mov r2, #0x3c
    bl Fill32
    mov r0, #0x2
    str r0, [sp]
    ldr r1, [r5, #0x68]
    add r0, sp, #0x4
    bl func_020aad04
    str r4, [sp, #0x2c]
    ldr r2, [r4, #0xc]
    ldr r0, _LIT0
    str r2, [sp, #0x24]
    ldrsh r1, [r4, #0x10]
    cmp r2, #0x0
    str r1, [sp, #0x28]
    str r0, [sp, #0x30]
    str r5, [sp, #0x34]
    cmplt r1, #0x0
    blt .L_1e8
    add r0, sp, #0x0
    bl func_02022b20
    add r0, r5, #0x100
    ldrh r1, [r0, #0x9a]
    orr r1, r1, #0x40
    strh r1, [r0, #0x9a]
.L_1e8:
    mov r0, #0x1
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word func_02029664
