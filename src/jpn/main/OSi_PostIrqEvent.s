; OSi_PostIrqEvent — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023c0
        .extern data_021a6274
        .extern data_021a6278
        .extern data_021a627c
        .extern data_027e0000
        .extern func_020904f4
        .global OSi_PostIrqEvent
        .arm
OSi_PostIrqEvent:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r1, #0xc
    mul r4, r0, r1
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov r0, r0, lsl #0x1
    ldr r1, [r2, r4]
    ldrh r3, [r3, r0]
    mov r5, #0x1
    mov r0, #0x0
    str r0, [r2, r4]
    cmp r1, #0x0
    mov r5, r5, lsl r3
    beq .L_c8
    ldr r0, _LIT2
    ldr r0, [r0, r4]
    blx r1
.L_c8:
    ldr r0, _LIT3
    ldr r1, _LIT4
    add r0, r0, #0x3000
    ldr r2, [r0, #0xff8]
    orr r2, r2, r5
    str r2, [r0, #0xff8]
    ldr r0, [r1, r4]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    mov r0, r5
    bl func_020904f4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a6274
_LIT1: .word data_021023c0
_LIT2: .word data_021a627c
_LIT3: .word data_027e0000
_LIT4: .word data_021a6278
