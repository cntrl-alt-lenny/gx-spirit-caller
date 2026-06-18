; func_ov002_021deb84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de134
        .global func_ov002_021deb84
        .arm
func_ov002_021deb84:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    add r4, sp, #0x0
    mov lr, #0x0
    str lr, [r4]
    ldrh r2, [sp, #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x1
    and r0, r0, #0x1
    orr ip, r2, r0
    mov r0, r4
    mov r2, #0xe
    mov r3, #0x1000
    str lr, [r4, #0x4]
    str lr, [r4, #0x8]
    str lr, [r4, #0xc]
    str lr, [r4, #0x10]
    str lr, [r4, #0x14]
    strh ip, [sp, #0x2]
    bl func_ov002_021de134
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
