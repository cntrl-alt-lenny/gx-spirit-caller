; func_0201ef3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern func_0201ece8
        .extern func_0201ed20
        .extern func_0201ed58
        .extern func_0201ed90
        .extern func_0201edc8
        .extern func_0201f03c
        .extern func_0207f528
        .extern func_0207f774
        .extern func_0207f79c
        .global func_0201ef3c
        .arm
func_0201ef3c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x44
    mov r9, r0
    add r0, sp, #0x20
    ldr r5, [sp, #0x68]
    mov r8, r1
    mov r7, r2
    mov r6, r3
    ldr r4, [sp, #0x74]
    bl func_0207f79c
    add r0, sp, #0xc
    bl func_0207f774
    ldr r1, [r5]
    cmp r1, #0x0
    ldrne r0, [r5, #0x4]
    cmpne r0, #0x0
    beq .L_70
    mov r0, r8
    bl func_0201ece8
    str r0, [r4]
    ldr r1, [r5, #0x4]
    mov r0, r9
    bl func_0201ed20
    str r0, [r4, #0x4]
    ldr r0, [r9]
    ldr r1, [r8]
    mov r2, r7
    bl func_0201f03c
.L_70:
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    beq .L_a4
    add r0, sp, #0x8
    bl func_0201ed58
    mov r4, r0
    ldr r0, [sp, #0x8]
    ldr r2, [sp, #0x64]
    add r3, sp, #0x20
    mov r1, r6
    bl func_0207f528
    mov r0, r4
    bl Task_InvokeLocked
.L_a4:
    ldr r1, [r5, #0xc]
    cmp r1, #0x0
    addeq sp, sp, #0x44
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r0, sp, #0x4
    bl func_0201ed90
    ldr r1, [sp, #0x70]
    ldr r3, [sp, #0x6c]
    ldr r2, [sp, #0x4]
    mov r4, r0
    str r3, [r2, #0x4]
    cmp r1, #0x0
    ble .L_f0
    str r1, [sp]
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x60]
    ldr r2, [sp, #0x64]
    add r3, sp, #0xc
    bl func_0201edc8
.L_f0:
    mov r0, r4
    bl Task_InvokeLocked
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
