; func_ov002_02280870 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0227afc8
        .extern func_ov002_0228090c
        .global func_ov002_02280870
        .arm
func_ov002_02280870:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    rsb r4, r5, #0x1
    add r1, sp, #0xc
    add r2, sp, #0x8
    mov r0, r4
    mov r3, #0x0
    bl func_ov002_0228090c
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r5
    mov r3, #0x0
    bl func_ov002_0228090c
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x4]
    cmp r1, r0
    movgt r0, r1
    cmp r2, r0
    addgt sp, sp, #0x10
    movgt r0, #0x2
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r0, [sp]
    cmp r2, r0
    movle r2, r0
    cmp r1, r2
    addgt sp, sp, #0x10
    mvngt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mvn r1, #0x0
    mov r2, #0x0
    bl func_ov002_0227afc8
    cmp r0, #0x7d0
    mvnge r0, #0x3
    movlt r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
