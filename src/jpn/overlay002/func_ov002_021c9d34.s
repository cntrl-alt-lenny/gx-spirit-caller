; func_ov002_021c9d34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b3fb8
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .global func_ov002_021c9d34
        .arm
func_ov002_021c9d34:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, _LIT0
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT1
    ldr r1, [r1, r3]
    mov r1, r1, lsr #0x15
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT2
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT3
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT4
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT5
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT6
    mov r0, r4
    sub r2, r1, #0x1400
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT7
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT8
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3fb8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT9
    mov r0, r4
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT10
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT11
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT12
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT13
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word 0x000012d2
_LIT3: .word 0x000012de
_LIT4: .word 0x00001710
_LIT5: .word 0x00001973
_LIT6: .word 0x000013ff
_LIT7: .word 0x000012b1
_LIT8: .word 0x000015ad
_LIT9: .word 0x00001679
_LIT10: .word 0x00001578
_LIT11: .word 0x00001a92
_LIT12: .word 0x00001436
_LIT13: .word 0x00001972
