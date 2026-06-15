; func_0206b4fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205442c
        .extern func_02054568
        .extern func_020552dc
        .extern func_02068c08
        .global func_0206b4fc
        .arm
func_0206b4fc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r5, r0
    str r4, [sp]
    bl func_02068c08
    add r1, sp, #0x0
    bl func_0205442c
    cmp r0, #0x0
    ldrne r1, [r0, #0x4]
    addne sp, sp, #0xc
    addne r1, r1, #0x1
    strne r1, [r0, #0x4]
    ldrne r0, [r0]
    ldmneia sp!, {r4, r5, pc}
    mov r0, r4
    bl func_020552dc
    str r0, [sp]
    mov r1, #0x1
    mov r0, r5
    str r1, [sp, #0x4]
    bl func_02068c08
    add r1, sp, #0x0
    bl func_02054568
    ldr r0, [sp]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
