; func_ov022_021aa600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207eb40
        .extern func_0207f84c
        .global func_ov022_021aa600
        .arm
func_ov022_021aa600:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x14
    mov r5, r1
    mov r4, r2
    mov r6, r3
    bl func_0207eb40
    ldr r2, [sp, #0x28]
    ldr r1, [sp, #0x2c]
    mov ip, r6, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, r0, lsl #0x10
    str r2, [sp, #0x10]
    mov r1, r1, lsl #0x10
    add r0, sp, #0xc
    str ip, [sp, #0xc]
    str r0, [sp]
    mov r0, r1, lsr #0x10
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r1, r3, lsr #0x10
    ldr r0, [r5]
    mov r2, r4
    mov r3, #0x0
    bl func_0207f84c
    ldr r1, [r5]
    add r1, r1, r0, lsl #0x3
    str r1, [r5]
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, pc}
