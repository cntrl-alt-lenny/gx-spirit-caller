; func_0201ef90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern func_0201ed3c
        .extern func_0201ed74
        .extern func_0201edac
        .extern func_0201ede4
        .extern func_0201ee1c
        .extern func_0201f090
        .extern func_0207f610
        .extern func_0207f85c
        .extern func_0207f884
        .global func_0201ef90
        .arm
func_0201ef90:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x44
    mov r9, r0
    add r0, sp, #0x20
    ldr r5, [sp, #0x68]
    mov r8, r1
    mov r7, r2
    mov r6, r3
    ldr r4, [sp, #0x74]
    bl func_0207f884
    add r0, sp, #0xc
    bl func_0207f85c
    ldr r1, [r5]
    cmp r1, #0x0
    ldrne r0, [r5, #0x4]
    cmpne r0, #0x0
    beq .L_70
    mov r0, r8
    bl func_0201ed3c
    str r0, [r4]
    ldr r1, [r5, #0x4]
    mov r0, r9
    bl func_0201ed74
    str r0, [r4, #0x4]
    ldr r0, [r9]
    ldr r1, [r8]
    mov r2, r7
    bl func_0201f090
.L_70:
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    beq .L_a4
    add r0, sp, #0x8
    bl func_0201edac
    mov r4, r0
    ldr r0, [sp, #0x8]
    ldr r2, [sp, #0x64]
    add r3, sp, #0x20
    mov r1, r6
    bl func_0207f610
    mov r0, r4
    bl Task_InvokeLocked
.L_a4:
    ldr r1, [r5, #0xc]
    cmp r1, #0x0
    addeq sp, sp, #0x44
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r0, sp, #0x4
    bl func_0201ede4
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
    bl func_0201ee1c
.L_f0:
    mov r0, r4
    bl Task_InvokeLocked
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
