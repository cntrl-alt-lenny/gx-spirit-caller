; func_ov016_021b6074 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .extern func_020944a4
        .global func_ov016_021b6074
        .arm
func_ov016_021b6074:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    add r1, r1, #0x2
    sub ip, r0, #0xd
    add r0, r3, #0x2dc
    orr r0, r0, r2, lsl #0xa
    orr r2, r0, #0x5000
    and r1, r1, #0xff
    orr r0, r1, #0x40000000
    mov r3, ip, lsl #0x17
    orr r3, r0, r3, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
