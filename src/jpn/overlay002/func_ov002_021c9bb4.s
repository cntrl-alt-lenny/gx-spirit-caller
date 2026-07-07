; func_ov002_021c9bb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b3fb8
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021c9d34
        .global func_ov002_021c9bb4
        .arm
func_ov002_021c9bb4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_2c
    mov r0, r4
    bl func_ov002_021c9d34
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_2c:
    ldr r2, _LIT1
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3fb8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT2
    mov r0, r4
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b3ef8
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
    ldr r2, _LIT6
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT7
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000135d
_LIT1: .word 0x000015ad
_LIT2: .word 0x00001679
_LIT3: .word 0x00001578
_LIT4: .word 0x00001a92
_LIT5: .word 0x00001a1b
_LIT6: .word 0x00001436
_LIT7: .word 0x00001972
