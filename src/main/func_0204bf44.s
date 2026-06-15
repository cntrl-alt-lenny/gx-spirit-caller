; func_0204bf44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02049120
        .extern func_020498f0
        .extern func_0204aaf4
        .extern func_0204c120
        .extern func_0204cf7c
        .extern func_0204f0a8
        .extern func_0204f3c0
        .global func_0204bf44
        .arm
func_0204bf44:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    movs r4, r0
    bne .L_e90
    bl func_0204c120
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_e90:
    bl func_0204f3c0
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    beq .L_eb4
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_f10
.L_eb4:
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    cmp r0, #0x0
    moveq r6, #0x1
    movne r6, #0x0
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    bl func_02049120
    mov r4, r0
    bl func_020498f0
    str r4, [sp]
    ldr r1, [r0, #0x468]
    mov r0, #0x0
    str r1, [sp, #0x4]
    ldr ip, [r5, #0x464]
    mov r2, r6
    mov r1, #0x1
    mov r3, r0
    blx ip
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_f10:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_f44
    cmp r4, #0x1
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x0
    bl func_0204f0a8
    bl func_0204aaf4
    add sp, sp, #0x8
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_f44:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x1
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    bl func_0204cf7c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
