; func_020647f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .extern func_020540d4
        .extern func_02054144
        .extern func_020544f4
        .extern func_020552bc
        .extern func_020614cc
        .extern func_02064a14
        .extern func_02064c9c
        .extern func_020a72e0
        .global func_020647f0
        .arm
func_020647f0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r3
    mov r5, r2
    mov r6, r1
    mov r3, #0x0
    mov r1, r5
    mov r2, r4
    mov r7, r0
    str r3, [sp]
    bl func_02064c9c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x5
    ldmneia sp!, {r4, r5, r6, r7, pc}
    bl func_02064a14
    str r0, [sp]
    cmp r0, #0x0
    beq .L_1a0
    mov r1, #0x0
    mov r2, #0xa0
    bl func_020a72e0
    ldr r0, [sp]
    str r5, [r0]
    ldr r0, [sp]
    strh r4, [r0, #0x4]
    ldr r0, [sp]
    str r7, [r0, #0x8]
    bl func_020552bc
    ldr r2, [sp]
    mov r1, #0x0
    str r0, [r2, #0x1c]
    ldr r2, [sp]
    ldr r0, [r2, #0x1c]
    str r0, [r2, #0x88]
    ldr r0, [sp]
    strh r1, [r0, #0x64]
    ldr r0, [sp]
    strh r1, [r0, #0x66]
    ldr r0, [sp]
    ldr r1, [r7, #0x3c]
    add r0, r0, #0x44
    bl func_020614cc
    cmp r0, #0x0
    beq .L_1a0
    ldr r0, [sp]
    ldr r1, [r7, #0x38]
    add r0, r0, #0x50
    bl func_020614cc
    cmp r0, #0x0
    beq .L_1a0
    mov r0, #0x10
    mov r1, #0x40
    mov r2, #0x0
    bl func_02054144
    ldr r1, [sp]
    str r0, [r1, #0x5c]
    ldr r0, [sp]
    ldr r0, [r0, #0x5c]
    cmp r0, #0x0
    beq .L_1a0
    mov r0, #0x10
    mov r1, #0x40
    mov r2, #0x0
    bl func_02054144
    ldr r1, [sp]
    str r0, [r1, #0x60]
    ldr r0, [sp]
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    beq .L_1a0
    mov r0, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl func_02054144
    ldr r1, [sp]
    str r0, [r1, #0x98]
    ldr r0, [sp]
    ldr r0, [r0, #0x98]
    cmp r0, #0x0
    beq .L_1a0
    mov r0, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl func_02054144
    ldr r1, [sp]
    str r0, [r1, #0x9c]
    ldr r0, [sp]
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_1a0
    ldr r0, [r7, #0xc]
    add r1, sp, #0x0
    bl func_020544f4
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_02064c9c
    str r0, [r6]
    ldr r0, [r6]
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_1a0:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_218
    ldr r0, [r0, #0x44]
    bl func_02045364
    ldr r0, [sp]
    ldr r0, [r0, #0x50]
    bl func_02045364
    ldr r0, [sp]
    ldr r0, [r0, #0x5c]
    cmp r0, #0x0
    beq .L_1d4
    bl func_020540d4
.L_1d4:
    ldr r0, [sp]
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    beq .L_1e8
    bl func_020540d4
.L_1e8:
    ldr r0, [sp]
    ldr r0, [r0, #0x98]
    cmp r0, #0x0
    beq .L_1fc
    bl func_020540d4
.L_1fc:
    ldr r0, [sp]
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_210
    bl func_020540d4
.L_210:
    ldr r0, [sp]
    bl func_02045364
.L_218:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
