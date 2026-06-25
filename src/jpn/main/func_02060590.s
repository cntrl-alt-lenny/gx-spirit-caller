; func_02060590 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e438
        .extern func_02053de4
        .extern func_0205405c
        .extern func_020540cc
        .global func_02060590
        .arm
func_02060590:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    addmi sp, sp, #0x14
    ldmmiia sp!, {r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_020540cc
    cmp r7, r0
    addge sp, sp, #0x14
    ldmgeia sp!, {r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    mov r1, r7
    ldr r0, [r0]
    bl func_0205405c
    mov r3, r0
    ldr ip, [r3, #0x18]
    cmp ip, #0x0
    beq .L_108
    ldr r0, [r3]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_108
    b .L_78
    b .L_98
    b .L_cc
    b .L_f4
.L_78:
    ldr r0, [r3, #0x14]
    mov r2, r6
    str r0, [sp]
    ldr r0, [r3, #0x4]
    ldr r1, [r3, #0x8]
    mov r3, r4
    blx ip
    b .L_108
.L_98:
    str r6, [sp]
    str r5, [sp, #0x4]
    ldr r0, [sp, #0x28]
    str r4, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r0, [r3, #0x14]
    str r0, [sp, #0x10]
    ldr r0, [r3, #0x4]
    ldr r1, [r3, #0x8]
    ldr r2, [r3, #0xc]
    ldr r3, [r3, #0x10]
    blx ip
    b .L_108
.L_cc:
    str r6, [sp]
    str r5, [sp, #0x4]
    ldr r0, [r3, #0x14]
    str r0, [sp, #0x8]
    ldr r0, [r3, #0x4]
    ldr r1, [r3, #0x8]
    ldr r2, [r3, #0xc]
    ldr r3, [r3, #0x10]
    blx ip
    b .L_108
.L_f4:
    ldr r0, [r3, #0x4]
    ldr r1, [r3, #0x8]
    ldr r3, [r3, #0x14]
    mov r2, r6
    blx ip
.L_108:
    ldr r0, _LIT0
    mov r1, r7
    ldr r0, [r0]
    bl func_02053de4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219e438
