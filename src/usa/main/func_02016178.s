; func_02016178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013990
        .extern func_02019000
        .extern func_020190b8
        .extern func_020190c8
        .extern func_02019630
        .extern func_0201aa7c
        .extern func_0201aab4
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_02016178
        .arm
func_02016178:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    beq .L_15b0
    cmp r0, #0x2
    beq .L_15fc
    cmp r0, #0x3
    beq .L_1658
    ldmia sp!, {r3, r4, r5, pc}
.L_15b0:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020190c8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x2
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    bl func_0201b774
    ldr r0, [r4, #0x8f8]
    orr r0, r0, #0x800
    str r0, [r4, #0x8f8]
    ldmia sp!, {r3, r4, r5, pc}
.L_15fc:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aa7c
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_1658:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019630
    cmp r0, #0x78
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aab4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00180100
_LIT1: .word 0x00180200
_LIT2: .word 0x00180300
