; func_ov010_021b2280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207f934
        .global func_ov010_021b2280
        .arm
func_ov010_021b2280:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r3
    cmp r1, #0x5
    ldr r4, [sp, #0x20]
    bge .L_38
    add ip, r0, r1, lsl #0x3
    ldrsh r3, [ip, #0x34]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0xc]
    ldrsh r3, [ip, #0x36]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x10]
    b .L_58
.L_38:
    ldrsh r3, [r0, #0x34]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0xc]
    ldrsh ip, [r0, #0x36]
    ldr r3, [r0, #0x4]
    add r3, ip, r3
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x10]
.L_58:
    add r1, r0, r1, lsl #0x2
    ldr r1, [r1, #0x8c]
    mov r3, #0x0
    cmp r1, #0x1
    add r1, sp, #0xc
    stmia sp, {r1, r3}
    str r3, [sp, #0x8]
    addeq r2, r2, #0x1
    add r2, r0, r2, lsl #0x2
    ldr r1, [r4]
    ldr r0, [r5]
    mov r1, r1, lsl #0x10
    ldr r2, [r2, #0x74]
    mov r1, r1, lsr #0x10
    bl func_0207f934
    ldr r1, [r5]
    add r1, r1, r0, lsl #0x3
    str r1, [r5]
    ldr r1, [r4]
    sub r1, r1, r0
    str r1, [r4]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
