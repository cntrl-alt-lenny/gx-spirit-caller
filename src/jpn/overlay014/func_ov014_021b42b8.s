; func_ov014_021b42b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov014_021b4db4
        .extern data_ov014_021b4dd4
        .extern data_ov014_021b4df4
        .extern data_ov014_021b4e14
        .extern data_ov014_02234fe0
        .extern func_0201e78c
        .extern func_0201ed90
        .extern func_0201eee8
        .extern func_0201ef3c
        .extern func_02091554
        .global func_ov014_021b42b8
        .arm
func_ov014_021b42b8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x12c
    mov r4, r0
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT0
    add r0, sp, #0x2c
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    bl func_02091554
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT1
    add r0, sp, #0x6c
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    bl func_02091554
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT2
    add r0, sp, #0xac
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    bl func_02091554
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT3
    add r0, sp, #0xec
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    bl func_02091554
    add r2, sp, #0x2c
    mov r1, #0x0
    add r0, sp, #0x1c
.L_ec8:
    str r2, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x40
    blt .L_ec8
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_f04
    ldr r0, [r4, #0x18]
    add r1, r4, #0x20
    add r2, r4, #0x24
    bl func_0201eee8
    mov r0, #0x0
    str r0, [r4, #0x28]
    str r0, [r4, #0x24]
.L_f04:
    bl func_0201e78c
    mov r0, #0x200
    str r0, [sp]
    mov r1, #0x1
    add r0, sp, #0x1c
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r0, r1, #0x2
    str r0, [sp, #0x10]
    add r0, r4, #0x24
    str r0, [sp, #0x14]
    add r0, r4, #0x18
    add r1, r4, #0x1c
    add r2, r4, #0x20
    mov r3, #0x6000
    bl func_0201ef3c
    ldr r1, [sp, #0x28]
    add r0, sp, #0x18
    bl func_0201ed90
    ldr r1, _LIT4
    str r0, [r1, #0x4]
    add sp, sp, #0x12c
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov014_021b4db4
_LIT1: .word data_ov014_021b4dd4
_LIT2: .word data_ov014_021b4df4
_LIT3: .word data_ov014_021b4e14
_LIT4: .word data_ov014_02234fe0
