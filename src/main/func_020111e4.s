; func_020111e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020111e4
        .arm
func_020111e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x30
    mov lr, r2
    ldr r5, [r0]
    ldr r4, [r1]
    ldr r3, [r0, #0xc]
    smull r7, r6, r5, r4
    mov r5, r7, lsr #0xc
    ldr r2, [r1, #0x4]
    ldr r7, [r0, #0x18]
    smull r4, r2, r3, r2
    mov r3, r4, lsr #0xc
    cmp lr, r0
    cmpne lr, r1
    addeq ip, sp, #0x0
    ldr r4, [r1, #0x8]
    orr r5, r5, r6, lsl #0x14
    smull r6, r4, r7, r4
    mov r6, r6, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r6, r6, r4, lsl #0x14
    add r2, r5, r3
    movne ip, lr
    add r2, r6, r2
    str r2, [ip]
    ldr r5, [r0, #0x4]
    ldr r4, [r1]
    ldr r3, [r0, #0x10]
    smull r7, r6, r5, r4
    mov r5, r7, lsr #0xc
    ldr r2, [r1, #0x4]
    ldr r7, [r0, #0x1c]
    smull r4, r2, r3, r2
    mov r3, r4, lsr #0xc
    ldr r4, [r1, #0x8]
    orr r5, r5, r6, lsl #0x14
    smull r6, r4, r7, r4
    mov r6, r6, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r6, r6, r4, lsl #0x14
    add r2, r5, r3
    add r2, r6, r2
    str r2, [ip, #0x4]
    ldr r5, [r0, #0x8]
    ldr r4, [r1]
    ldr r3, [r0, #0x14]
    smull r7, r6, r5, r4
    ldr r2, [r1, #0x4]
    mov r5, r7, lsr #0xc
    smull r4, r2, r3, r2
    mov r3, r4, lsr #0xc
    orr r5, r5, r6, lsl #0x14
    orr r3, r3, r2, lsl #0x14
    add r2, r5, r3
    ldr r4, [r0, #0x20]
    ldr r3, [r1, #0x8]
    smull r5, r3, r4, r3
    mov r4, r5, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    add r2, r4, r2
    str r2, [ip, #0x8]
    ldr r5, [r0, #0x18]
    ldr r4, [r1, #0x14]
    ldr r3, [r0]
    ldr r2, [r1, #0xc]
    smull r7, r6, r5, r4
    smull r5, r4, r3, r2
    mov r2, r7, lsr #0xc
    orr r2, r2, r6, lsl #0x14
    mov r6, r5, lsr #0xc
    orr r6, r6, r4, lsl #0x14
    ldr r4, [r0, #0xc]
    ldr r3, [r1, #0x10]
    smull r5, r3, r4, r3
    mov r4, r5, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    add r3, r6, r4
    add r2, r2, r3
    str r2, [ip, #0xc]
    ldr r3, [r0, #0x1c]
    ldr r2, [r1, #0x14]
    ldr r5, [r0, #0x4]
    smull r2, r4, r3, r2
    ldr r3, [r1, #0xc]
    mov r2, r2, lsr #0xc
    smull r6, r3, r5, r3
    mov r6, r6, lsr #0xc
    orr r2, r2, r4, lsl #0x14
    orr r6, r6, r3, lsl #0x14
    ldr r4, [r0, #0x10]
    ldr r3, [r1, #0x10]
    smull r5, r3, r4, r3
    mov r4, r5, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    add r3, r6, r4
    add r2, r2, r3
    str r2, [ip, #0x10]
    ldr r5, [r0, #0x8]
    ldr r4, [r1, #0xc]
    ldr r3, [r0, #0x14]
    ldr r2, [r1, #0x10]
    smull r7, r6, r5, r4
    smull r4, r2, r3, r2
    mov r5, r7, lsr #0xc
    mov r3, r4, lsr #0xc
    ldr r7, [r0, #0x20]
    ldr r4, [r1, #0x14]
    orr r5, r5, r6, lsl #0x14
    smull r6, r4, r7, r4
    mov r6, r6, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r6, r6, r4, lsl #0x14
    add r2, r5, r3
    add r2, r6, r2
    str r2, [ip, #0x14]
    ldr r5, [r0]
    ldr r4, [r1, #0x18]
    ldr r3, [r0, #0xc]
    ldr r2, [r1, #0x1c]
    smull r7, r6, r5, r4
    smull r4, r2, r3, r2
    mov r5, r7, lsr #0xc
    mov r3, r4, lsr #0xc
    ldr r7, [r0, #0x18]
    ldr r4, [r1, #0x20]
    orr r5, r5, r6, lsl #0x14
    smull r6, r4, r7, r4
    mov r6, r6, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r6, r6, r4, lsl #0x14
    add r2, r5, r3
    add r2, r6, r2
    str r2, [ip, #0x18]
    ldr r5, [r0, #0x4]
    ldr r4, [r1, #0x18]
    ldr r3, [r0, #0x10]
    ldr r2, [r1, #0x1c]
    smull r7, r6, r5, r4
    smull r4, r2, r3, r2
    mov r5, r7, lsr #0xc
    orr r5, r5, r6, lsl #0x14
    mov r3, r4, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r2, r5, r3
    ldr r4, [r0, #0x1c]
    ldr r3, [r1, #0x20]
    smull r5, r3, r4, r3
    mov r4, r5, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    add r2, r4, r2
    str r2, [ip, #0x1c]
    ldr r3, [r0, #0x8]
    ldr r5, [r0, #0x20]
    ldr r4, [r1, #0x20]
    ldr r2, [r1, #0x18]
    smull r7, r6, r5, r4
    smull r5, r4, r3, r2
    mov r2, r7, lsr #0xc
    orr r2, r2, r6, lsl #0x14
    mov r6, r5, lsr #0xc
    orr r6, r6, r4, lsl #0x14
    ldr r4, [r0, #0x14]
    ldr r3, [r1, #0x1c]
    smull r5, r3, r4, r3
    mov r4, r5, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    add r3, r6, r4
    add r2, r2, r3
    str r2, [ip, #0x20]
    ldr r3, [r0, #0x24]
    ldr r4, [r0, #0x18]
    ldr r2, [r1, #0x2c]
    ldr r6, [r0]
    smull r2, r5, r4, r2
    mov r2, r2, lsr #0xc
    orr r2, r2, r5, lsl #0x14
    ldr r4, [r1, #0x24]
    ldr r5, [r0, #0xc]
    smull r7, r4, r6, r4
    mov r7, r7, lsr #0xc
    orr r7, r7, r4, lsl #0x14
    ldr r4, [r1, #0x28]
    smull r6, r4, r5, r4
    mov r5, r6, lsr #0xc
    orr r5, r5, r4, lsl #0x14
    add r4, r7, r5
    add r2, r2, r4
    add r2, r3, r2
    str r2, [ip, #0x24]
    ldr r5, [r0, #0x4]
    ldr r4, [r1, #0x24]
    ldr r3, [r0, #0x10]
    smull r7, r6, r5, r4
    mov r5, r7, lsr #0xc
    ldr r2, [r1, #0x28]
    ldr r7, [r0, #0x1c]
    smull r4, r2, r3, r2
    mov r3, r4, lsr #0xc
    ldr r4, [r1, #0x2c]
    orr r5, r5, r6, lsl #0x14
    smull r4, r6, r7, r4
    mov r7, r4, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r2, r5, r3
    orr r7, r7, r6, lsl #0x14
    ldr r3, [r0, #0x28]
    add r2, r7, r2
    add r2, r3, r2
    str r2, [ip, #0x28]
    ldr r6, [r0, #0x8]
    ldr r5, [r1, #0x24]
    ldr r2, [r1, #0x28]
    smull r8, r7, r6, r5
    ldr r3, [r0, #0x14]
    mov r6, r8, lsr #0xc
    smull r5, r2, r3, r2
    mov r3, r5, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r4, sp, #0x0
    cmp ip, r4
    ldr r5, [r0, #0x20]
    ldr r1, [r1, #0x2c]
    orr r6, r6, r7, lsl #0x14
    smull r7, r1, r5, r1
    mov r5, r7, lsr #0xc
    orr r5, r5, r1, lsl #0x14
    add r1, r6, r3
    ldr r2, [r0, #0x2c]
    add r0, r5, r1
    add r0, r2, r0
    str r0, [ip, #0x2c]
    addne sp, sp, #0x30
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    ldmia r4, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
