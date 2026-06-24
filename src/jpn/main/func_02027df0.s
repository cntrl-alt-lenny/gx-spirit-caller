; func_02027df0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_02022b20
        .extern func_02027e80
        .extern func_020aad04
        .global func_02027df0
        .arm
func_02027df0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x3c
    mov r4, r0
    ldr r0, [r4, #0x68]
    add r5, r4, #0x8c
    cmp r0, #0x0
    beq .L_80
    add r1, sp, #0x0
    mov r0, #0x0
    mov r2, #0x3c
    bl Fill32
    mov r0, #0x1
    str r0, [sp]
    ldr r1, [r4, #0x68]
    add r0, sp, #0x4
    bl func_020aad04
    str r5, [sp, #0x2c]
    ldr r2, [r5, #0xc]
    ldr r0, _LIT0
    str r2, [sp, #0x24]
    ldrsh r1, [r5, #0x10]
    cmp r2, #0x0
    str r1, [sp, #0x28]
    str r0, [sp, #0x30]
    str r4, [sp, #0x34]
    cmplt r1, #0x0
    blt .L_80
    add r0, sp, #0x0
    bl func_02022b20
    ldrh r0, [r4, #0xde]
    orr r0, r0, #0x10
    strh r0, [r4, #0xde]
.L_80:
    mov r0, #0x1
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word func_02027e80
