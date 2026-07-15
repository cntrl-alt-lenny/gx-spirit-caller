; func_ov019_021b3e34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov019_021b3d38
        .global func_ov019_021b3e34
        .arm
func_ov019_021b3e34:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    ldrh r4, [r3]
    ldr lr, [sp, #0x18]
    ldr ip, [sp, #0x1c]
    add r4, r4, lr
    strh r4, [sp]
    ldrh lr, [r3, #0x2]
    add ip, lr, ip
    strh ip, [sp, #0x2]
    ldrh ip, [r3, #0x6]
    strh ip, [sp, #0x6]
    ldrh ip, [r3, #0x8]
    add r3, sp, #0x0
    strh ip, [sp, #0x8]
    bl func_ov019_021b3d38
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
