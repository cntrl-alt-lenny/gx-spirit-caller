; func_ov000_021ae2cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b56b4
        .extern data_ov000_021c758c
        .extern data_ov000_021c763c
        .extern data_ov000_021c7660
        .extern func_ov000_021add24
        .extern func_ov000_021adf18
        .extern func_ov000_021b33d8_unk
        .extern func_ov000_021b33f8_unk
        .extern func_ov000_021b3474_unk
        .global func_ov000_021ae2cc
        .arm
func_ov000_021ae2cc:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4c
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x2a4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x9
    mov r1, r0, lsr #0x1e
    mov r0, #0x28
    mla r3, r1, r0, r2
    ldr r0, _LIT2
    ldr r4, _LIT3
    add r2, sp, #0xc
    sub r1, r5, #0x1
    add r6, r3, #0x8
    bl func_ov000_021adf18
    add r1, sp, #0xc
    mov r0, r4
    mov r2, #0xc
    bl func_ov000_021b33d8_unk
    add r0, sp, #0xc
    mov r1, #0xc
    mov r2, #0x100
    bl func_ov000_021add24
    sub r1, r5, #0x1
    add r1, r6, r1, lsl #0x3
    sub r0, r0, #0x1
    mov r0, r0, lsl #0xc
    ldrsh r1, [r1, #0x2]
    str r0, [sp]
    mov r0, r1, lsl #0xc
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    add r1, sp, #0x0
    mov r0, r4
    ldmia r1, {r1, r2, r3}
    bl func_ov000_021b33f8_unk
    mov r0, r4
    bl func_ov000_021b3474_unk
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x3000
    orr r0, r0, #0x1000
    str r0, [r4, #0x20]
    add sp, sp, #0x4c
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov000_021c758c
_LIT1: .word data_ov000_021b56b4
_LIT2: .word data_ov000_021c7660
_LIT3: .word data_ov000_021c763c
