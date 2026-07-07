; func_ov002_022b4f94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0e9c
        .extern func_02034734
        .extern func_020347c0
        .extern func_0207ef74
        .extern func_ov002_022b3b18
        .extern func_ov002_022b3e78
        .extern func_ov002_022b423c
        .extern func_ov002_022b4444
        .extern func_ov002_022b4840
        .extern func_ov002_022b4ce0
        .global func_ov002_022b4f94
        .arm
func_ov002_022b4f94:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r5, #0x0
.L_17ac:
    mov r0, r4
    mov r1, r5
    bl func_ov002_022b3e78
    mov r0, r4
    mov r1, r5
    bl func_ov002_022b423c
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_17ac
    bl func_02034734
    cmp r0, #0x0
    beq .L_1814
    bl func_020347c0
    mov r0, r0, lsl #0x8
    add r0, r0, #0x380
    add r1, r0, #0x4000
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov ip, r0, asr #0x5
    ldr r3, _LIT0
    ldr r0, _LIT1
    add r1, sp, #0x0
    mov r2, #0x1
    str r3, [sp]
    strh ip, [sp, #0x4]
    bl func_0207ef74
.L_1814:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_022b4ce0
    mov r0, r4
    bl func_ov002_022b4444
    mov r5, #0x0
.L_1838:
    mov r0, r4
    mov r1, r5
    bl func_ov002_022b3b18
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_1838
    mov r0, r4
    bl func_ov002_022b4840
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x40ef2001
_LIT1: .word data_ov002_022d0e9c
