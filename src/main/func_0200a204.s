; func_0200a204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b476c
        .extern func_0200a014
        .extern func_02019210
        .global func_0200a204
        .arm
func_0200a204:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0xb0
    ldr ip, _LIT0
    add r3, sp, #0x0
    mov r4, r0
    mov r2, #0x2b
.L_80:
    ldrh r1, [ip]
    ldrh r0, [ip, #0x2]
    add ip, ip, #0x4
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    subs r2, r2, #0x1
    bne .L_80
    ldrh r1, [ip]
    mov r0, r4
    strh r1, [r3]
    bl func_02019210
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1
    ldrh r0, [r1, r0]
    mov r1, r4
    bl func_0200a014
    add sp, sp, #0xb0
    ldmia sp!, {r4, pc}
_LIT0: .word data_020b476c+0xee
