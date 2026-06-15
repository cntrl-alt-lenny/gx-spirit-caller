; func_ov010_021b421c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .global func_ov010_021b421c
        .arm
func_ov010_021b421c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    movs r7, r0
    moveq r4, r2, lsl #0x4
    movne r0, r2, lsl #0x4
    addne r4, r0, #0x8
    add r0, sp, #0x20
    mov r6, r1
    bl func_02098388
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x20
    bl func_020945f4
    add r0, sp, #0x0
    mov r1, #0x0
    bl func_ov010_021b4144
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl func_02098038
    mov r1, r4
    add r0, sp, #0x20
    mov r2, #0x0
    bl func_02097ea4
    mov r0, r6
    mov r1, #0x200
    bl func_02092904
    add r0, sp, #0x20
    mov r1, r6
    mov r2, #0x8
    bl func_02038ad4
    add r0, sp, #0x20
    bl func_02097ff0
    ldmia r6, {r4, r5}
    cmp r5, #0x0
    addeq sp, sp, #0x68
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, sp, #0x20
    bl func_02098388
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x20
    bl func_020945f4
    add r0, sp, #0x0
    add r1, r7, #0x1
    bl func_ov010_021b4144
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl func_02098038
    mov r1, r4
    add r0, sp, #0x20
    mov r2, #0x0
    bl func_02097ea4
    mov r0, r6
    mov r1, #0x200
    bl func_02092904
    mov r1, r6
    add r0, sp, #0x20
    mov r2, r5
    bl func_02038ad4
    add r0, sp, #0x20
    bl func_02097ff0
    mov r0, r5
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
