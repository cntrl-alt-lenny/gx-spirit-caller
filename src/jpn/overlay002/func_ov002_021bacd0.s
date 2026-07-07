; func_ov002_021bacd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e21c
        .extern func_0202f994
        .extern func_ov002_021b3dec
        .extern func_ov002_021baf88
        .extern func_ov002_021bd77c
        .global func_ov002_021bacd0
        .arm
func_ov002_021bacd0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x10]
    bl func_0202e21c
    cmp r0, #0x0
    beq .L_b4
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_64
    ldr r2, _LIT1
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_64:
    ldr r0, [r4, #0x10]
    bl func_0202f994
    cmp r0, #0x1
    bne .L_9c
    ldr r0, _LIT2
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT3
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_9c:
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0xc]
    bl func_ov002_021bd77c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_b4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000166c
_LIT1: .word 0x000012bf
_LIT2: .word 0x0000148e
_LIT3: .word 0x000014da
