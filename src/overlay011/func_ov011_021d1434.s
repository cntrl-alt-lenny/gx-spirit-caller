; func_ov011_021d1434 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3fcc
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02091554
        .global func_ov011_021d1434
        .arm
func_ov011_021d1434:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    mov r5, r0
    add r0, sp, #0x20
    mov r4, r1
    bl func_0201d47c
    ldrh r0, [sp, #0x34]
    cmp r4, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x4
    strh r0, [sp, #0x34]
    ldr r1, [r5, #0x10]
    ldrh r0, [sp, #0x34]
    str r1, [sp, #0x2c]
    ldr r1, [r5, #0x14]
    orr r0, r0, #0x10
    strh r1, [sp, #0x30]
    strh r0, [sp, #0x34]
    beq .L_1cc
    cmp r4, #0x1
    beq .L_208
    b .L_238
.L_1cc:
    ldrh r2, [sp, #0x34]
    ldr r1, _LIT0
    add r0, sp, #0x0
    orr r2, r2, #0x10
    strh r2, [sp, #0x34]
    ldr r2, [r5, #0x8]
    mov r2, r2, lsl #0xd
    mov r2, r2, lsr #0x18
    bl func_02091554
    add r0, sp, #0x0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x20]
    b .L_238
.L_208:
    ldr r1, _LIT0
    mvn r3, #0x0
    add r0, sp, #0x0
    mov r2, #0x1
    str r3, [sp, #0x2c]
    str r3, [sp, #0x28]
    bl func_02091554
    add r0, sp, #0x0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x20]
.L_238:
    add r0, sp, #0x20
    bl func_0201e5b8
    ldr r0, [sp, #0x20]
    bl Task_Invoke
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d3fcc
