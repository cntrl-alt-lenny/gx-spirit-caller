; func_ov002_022b3784 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccb8c
        .extern data_ov002_022ccba8
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02037208
        .global func_ov002_022b3784
        .arm
func_ov002_022b3784:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    cmp r2, #0x0
    mov r5, r0
    addeq sp, sp, #0x28
    ldmeqia sp!, {r3, r4, r5, pc}
    add r1, r5, r1, lsl #0x2
    str r2, [r1, #0x4c]
    str r3, [r5, #0x58]
    mov r0, #0x100
    str r0, [r5, #0x54]
    cmp r3, #0x4
    strne r2, [r1, #0x44]
    cmp r3, #0x5
    beq .L_94
    cmp r3, #0x0
    ldreq r0, _LIT0
    mov r1, #0x4
    ldrne r0, _LIT1
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r0, [sp, #0x14]
    ldr r2, _LIT2
    mov r1, #0x0
    bic r0, r0, #0xf
    orr r3, r0, #0x4
    add r0, sp, #0x0
    str r4, [sp]
    strh r3, [sp, #0x14]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
.L_94:
    ldr r0, [r5, #0x58]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_100
    b .L_ec
    b .L_b4
    b .L_b4
    b .L_d0
.L_b4:
    mov r0, #0x39
    sub r1, r0, #0x3a
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
.L_d0:
    mov r0, #0x4b
    sub r1, r0, #0x4c
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
.L_ec:
    mov r0, #0x40
    sub r1, r0, #0x41
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_100:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ccb8c
_LIT1: .word data_ov002_022ccba8
_LIT2: .word 0x00004780
