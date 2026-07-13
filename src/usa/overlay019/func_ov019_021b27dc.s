; func_ov019_021b27dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005d90
        .extern func_020943b0
        .global func_ov019_021b27dc
        .arm
func_ov019_021b27dc:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    add r1, r1, #0x2
    sub lr, r0, #0xd
    and ip, r1, #0xff
    add r0, r3, #0x3a8
    ldr r1, [sp, #0x10]
    orr r0, r0, r2, lsl #0xa
    orr r2, r0, r1, lsl #0xc
    mov r1, lr, lsl #0x17
    orr r0, ip, #0x40000000
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020943b0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
