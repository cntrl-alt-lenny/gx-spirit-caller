; func_ov002_02293d70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0228090c
        .global func_ov002_02293d70
        .arm
func_ov002_02293d70:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldrh r0, [r4, #0x2]
    add r1, sp, #0xc
    add r2, sp, #0x8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r3, #0x1
    bl func_ov002_0228090c
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_0228090c
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    ldr r0, [sp, #0x4]
    cmp r3, r1
    movgt r2, r3
    movle r2, r1
    cmp r0, r2
    addgt sp, sp, #0x10
    movgt r0, #0x0
    ldmgtia sp!, {r4, pc}
    ldr r0, [sp]
    cmp r3, r1
    movle r3, r1
    cmp r0, r3
    movgt r0, #0x1
    movle r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
