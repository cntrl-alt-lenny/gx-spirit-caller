; func_ov010_021b411c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .global func_ov010_021b411c
        .arm
func_ov010_021b411c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    movs r7, r0
    moveq r4, r2, lsl #0x4
    movne r0, r2, lsl #0x4
    addne r4, r0, #0x8
    add r0, sp, #0x20
    mov r6, r1
    bl func_02098294
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x20
    bl func_02094500
    add r0, sp, #0x0
    mov r1, #0x0
    bl func_ov010_021b4044
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl func_02097f44
    mov r1, r4
    add r0, sp, #0x20
    mov r2, #0x0
    bl func_02097db0
    mov r0, r6
    mov r1, #0x200
    bl func_0209281c
    add r0, sp, #0x20
    mov r1, r6
    mov r2, #0x8
    bl func_02038a84
    add r0, sp, #0x20
    bl func_02097efc
    ldmia r6, {r4, r5}
    cmp r5, #0x0
    addeq sp, sp, #0x68
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, sp, #0x20
    bl func_02098294
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x20
    bl func_02094500
    add r0, sp, #0x0
    add r1, r7, #0x1
    bl func_ov010_021b4044
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl func_02097f44
    mov r1, r4
    add r0, sp, #0x20
    mov r2, #0x0
    bl func_02097db0
    mov r0, r6
    mov r1, #0x200
    bl func_0209281c
    mov r1, r6
    add r0, sp, #0x20
    mov r2, r5
    bl func_02038a84
    add r0, sp, #0x20
    bl func_02097efc
    mov r0, r5
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
