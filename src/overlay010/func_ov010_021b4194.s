; func_ov010_021b4194 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02038ad4
        .extern func_02092904
        .extern func_020945f4
        .extern func_02097ea4
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .extern func_ov010_021b4144
        .global func_ov010_021b4194
        .arm
func_ov010_021b4194:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x6c
    cmp r0, #0x0
    mov r0, r1, lsl #0x4
    addeq r4, r0, #0x4
    addne r4, r0, #0xc
    add r0, sp, #0x24
    bl func_02098388
    add r0, sp, #0x4
    mov r1, #0x0
    mov r2, #0x20
    bl func_020945f4
    add r0, sp, #0x4
    mov r1, #0x0
    bl func_ov010_021b4144
    add r0, sp, #0x24
    add r1, sp, #0x4
    bl func_02098038
    add r0, sp, #0x24
    mov r1, r4
    mov r2, #0x0
    bl func_02097ea4
    add r0, sp, #0x0
    mov r1, #0x4
    bl func_02092904
    add r0, sp, #0x24
    add r1, sp, #0x0
    mov r2, #0x4
    bl func_02038ad4
    add r0, sp, #0x24
    bl func_02097ff0
    ldr r0, [sp]
    add sp, sp, #0x6c
    ldmia sp!, {r3, r4, pc}
