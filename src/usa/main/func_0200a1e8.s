; func_0200a1e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4766
        .extern func_02009ff8
        .extern func_020191dc
        .global func_0200a1e8
        .arm
func_0200a1e8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0xb0
    ldr ip, _LIT0
    add r3, sp, #0x0
    mov r4, r0
    mov r2, #0x2b
.L_76c:
    ldrh r1, [ip]
    ldrh r0, [ip, #0x2]
    add ip, ip, #0x4
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    subs r2, r2, #0x1
    bne .L_76c
    ldrh r1, [ip]
    mov r0, r4
    strh r1, [r3]
    bl func_020191dc
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1
    ldrh r0, [r1, r0]
    mov r1, r4
    bl func_02009ff8
    add sp, sp, #0xb0
    ldmia sp!, {r4, pc}
_LIT0: .word data_020b4766
