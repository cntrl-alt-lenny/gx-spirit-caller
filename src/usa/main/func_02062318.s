; func_02062318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045398
        .extern func_02060fa4
        .extern func_020610dc
        .extern func_02062d14
        .extern func_02064d3c
        .extern func_020a7274
        .global func_02062318
        .arm
func_02062318:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    mov r5, r0
    add r0, sp, #0x34
    add r1, sp, #0x38
    mov r4, r3
    bl func_02064d3c
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ble .L_64
    bl func_02045398
    str r0, [r5, #0x38]
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    addeq sp, sp, #0x24
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, lr}
    addeq sp, sp, #0x10
    bxeq lr
    ldr r1, [sp, #0x34]
    ldr r2, [sp, #0x38]
    bl func_020a7274
    ldr r0, [sp, #0x38]
    str r0, [r5, #0x3c]
.L_64:
    cmp r4, #0x0
    addne ip, r5, #0x28
    ldmneia r4, {r0, r1, r2, r3}
    stmneia ip, {r0, r1, r2, r3}
    add r0, sp, #0x0
    bl func_020610dc
    add r1, sp, #0x0
    add r0, r5, #0x68
    bl func_02060fa4
    add r1, sp, #0x0
    mov r0, r5
    bl func_02062d14
    mov r0, #0x0
    str r0, [r5, #0xc]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, lr}
    add sp, sp, #0x10
    bx lr
