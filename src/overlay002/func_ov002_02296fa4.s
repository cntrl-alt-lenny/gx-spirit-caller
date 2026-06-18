; func_ov002_02296fa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021bae7c
        .extern func_ov002_0220eb00
        .global func_ov002_02296fa4
        .arm
func_ov002_02296fa4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    add r1, sp, #0x0
    mov r4, r0
    bl func_ov002_0220eb00
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb lr, r0, #0x1
    and r3, lr, #0x1
    mul ip, r3, r1
    add r1, sp, #0x0
    ldr r2, [r2, ip]
    ldr r1, [r1, lr, lsl #0x2]
    add r1, r2, r1
    cmp r1, #0x0
    addle sp, sp, #0x8
    movle r0, #0x1
    ldmleia sp!, {r4, pc}
    ldr r1, _LIT2
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT3
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00001964
_LIT3: .word 0x00001982
