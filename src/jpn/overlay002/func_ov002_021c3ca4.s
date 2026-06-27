; func_ov002_021c3ca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021afff0
        .extern func_ov002_021b90e4
        .extern func_ov002_021c3be8
        .global func_ov002_021c3ca4
        .arm
func_ov002_021c3ca4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_ov002_021c3be8
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    ldr r0, [r0, r1]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    sub r6, r0, #0x1
    cmp r6, #0x0
    ble .L_a4
    ldr r0, _LIT2
    add r4, sp, #0x0
    add r0, r0, r1
    add r5, r0, #0x120
    add r7, r5, r6, lsl #0x2
.L_64:
    add r0, r6, #0x1
    bl func_ov002_021afff0
    add r8, r5, r0, lsl #0x2
    mov r0, r4
    mov r1, r8
    bl func_ov002_021b90e4
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b90e4
    mov r0, r7
    mov r1, r4
    bl func_ov002_021b90e4
    sub r6, r6, #0x1
    cmp r6, #0x0
    sub r7, r7, #0x4
    bgt .L_64
.L_a4:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
