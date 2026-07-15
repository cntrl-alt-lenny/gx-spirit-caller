; func_ov010_021b4094 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02038a84
        .extern func_0209281c
        .extern func_02094500
        .extern func_02097db0
        .extern func_02097efc
        .extern func_02097f44
        .extern func_02098294
        .extern func_ov010_021b4044
        .global func_ov010_021b4094
        .arm
func_ov010_021b4094:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x6c
    cmp r0, #0x0
    mov r0, r1, lsl #0x4
    addeq r4, r0, #0x4
    addne r4, r0, #0xc
    add r0, sp, #0x24
    bl func_02098294
    add r0, sp, #0x4
    mov r1, #0x0
    mov r2, #0x20
    bl func_02094500
    add r0, sp, #0x4
    mov r1, #0x0
    bl func_ov010_021b4044
    add r0, sp, #0x24
    add r1, sp, #0x4
    bl func_02097f44
    add r0, sp, #0x24
    mov r1, r4
    mov r2, #0x0
    bl func_02097db0
    add r0, sp, #0x0
    mov r1, #0x4
    bl func_0209281c
    add r0, sp, #0x24
    add r1, sp, #0x0
    mov r2, #0x4
    bl func_02038a84
    add r0, sp, #0x24
    bl func_02097efc
    ldr r0, [sp]
    add sp, sp, #0x6c
    ldmia sp!, {r3, r4, pc}
