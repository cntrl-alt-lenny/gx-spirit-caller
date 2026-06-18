; func_ov002_021deb28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021debe0
        .global func_ov002_021deb28
        .arm
func_ov002_021deb28:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    add r0, sp, #0x0
    mov lr, #0x0
    str lr, [r0]
    ldrh ip, [sp, #0x2]
    mov r2, r4, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r2, r1
    bic ip, ip, #0x1
    and r1, r3, #0x1
    orr r3, ip, r1
    mov r1, r4
    str lr, [r0, #0x4]
    str lr, [r0, #0x8]
    str lr, [r0, #0xc]
    str lr, [r0, #0x10]
    str lr, [r0, #0x14]
    strh r3, [sp, #0x2]
    bl func_ov002_021debe0
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
