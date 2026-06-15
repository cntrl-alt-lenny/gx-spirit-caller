; func_02089938 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207daf4
        .extern func_0207db00
        .extern func_020897b0
        .global func_02089938
        .arm
func_02089938:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    add r2, r0, #0x3
    add r0, r0, r1
    bic r5, r2, #0x3
    cmp r5, r0
    addhi sp, sp, #0x4
    movhi r0, #0x0
    ldmhiia sp!, {r4, r5, pc}
    sub r1, r0, r5
    cmp r1, #0x10
    addcc sp, sp, #0x4
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, pc}
    add r0, r5, #0x10
    sub r1, r1, #0x10
    mov r2, #0x0
    bl func_0207db00
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_020897b0
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, r5
    ldmneia sp!, {r4, r5, pc}
    mov r0, r4
    bl func_0207daf4
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
