; func_ov000_021ac840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201e78c
        .extern func_0201ed90
        .extern func_0201eebc
        .extern func_0201ef3c
        .extern func_ov000_021ac9cc
        .global func_ov000_021ac840
        .arm
func_ov000_021ac840:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    mov r6, r0
    ldr r3, [r6, #0x68]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x0
    beq .L_24
    bl func_ov000_021ac9cc
.L_24:
    mov r2, #0x0
    add r0, sp, #0x18
.L_2c:
    ldr r1, [r5, r2, lsl #0x2]
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_2c
    ldr r0, [r6, #0x98]
    mov r1, r4, lsl #0x10
    mov r0, r0, lsl #0x2
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    strne r0, [sp, #0x24]
    ldr r0, [r6, #0x9c]
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r6, #0x9c]
    bl func_0201e78c
    ldr r0, [r6, #0x98]
    mov r0, r0, lsl #0xf
    mov r0, r0, lsr #0x1b
    bl func_0201eebc
    ldr r2, [r6, #0x7c]
    add r1, sp, #0x18
    str r2, [sp]
    stmib sp, {r0, r1}
    ldr r1, [r6, #0x98]
    add r0, r6, #0x68
    mov r1, r1, lsl #0x7
    mov r1, r1, lsr #0x1f
    str r1, [sp, #0xc]
    str r4, [sp, #0x10]
    str r0, [sp, #0x14]
    ldr r3, [r6, #0x78]
    mov r0, r6
    add r1, r6, #0x4
    add r2, r6, #0x8
    bl func_0201ef3c
    ldr r0, [r6, #0x98]
    mov r0, r0, lsl #0x2
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x28
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r5, #0xc]
    add r0, r6, #0x74
    bl func_0201ed90
    str r0, [r6, #0x70]
    ldr r1, [r6, #0x98]
    ldr r0, [r6, #0x74]
    mov r1, r1, lsl #0x7
    mov r1, r1, lsr #0x1f
    str r1, [r0, #0x4]
    ldr r0, [r6, #0x98]
    orr r0, r0, #0x40000000
    str r0, [r6, #0x98]
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
