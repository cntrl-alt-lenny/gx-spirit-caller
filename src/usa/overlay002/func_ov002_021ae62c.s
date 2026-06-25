; func_ov002_021ae62c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229acd0
        .global func_ov002_021ae62c
        .arm
func_ov002_021ae62c:
    stmdb sp!, {r3, lr}
    ldr ip, [sp, #0x8]
    and lr, r2, #0xf
    and r2, ip, #0xf
    orr r2, lr, r2, lsl #0x4
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r0
    orr r3, r3, r1, lsr #0x10
    mov r0, #0x31
    mov r1, #0xa
    bl func_ov002_0229acd0
    ldmia sp!, {r3, pc}
