; func_ov002_0226dea0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern func_ov002_021b3dec
        .extern func_ov002_021baf88
        .extern func_ov002_021bc7e8
        .global func_ov002_0226dea0
        .arm
func_ov002_0226dea0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r1, _LIT0
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT1
    mov r5, #0x0
    ldr r1, [r1, r3]
    mov r1, r1, lsr #0x11
    tst r1, #0x1
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT2
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    bl func_ov002_021baf88
    cmp r0, #0x0
    movgt r0, r5
    ldmgtia sp!, {r4, r5, r6, pc}
    rsb r6, r4, #0x1
    mov r4, r5
.L_64:
    mov r0, r6
    mov r1, r6
    mov r2, r4
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    add r4, r4, #0x1
    addne r5, r5, #0x1
    cmp r4, #0x4
    ble .L_64
    cmp r5, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word 0x000012f3
_LIT3: .word 0x000013f2
