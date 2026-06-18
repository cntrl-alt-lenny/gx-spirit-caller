; func_ov002_022628e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bbf50
        .extern func_ov002_021bcf00
        .extern func_ov002_021c3ae4
        .global func_ov002_022628e4
        .arm
func_ov002_022628e4:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r1, #0xb
    mov r4, r0
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_021bbf50
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_021bcf00
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    rsb r4, r4, #0x1
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    bne .L_17c
    ldr r1, _LIT0
    mov r0, r4
    sub r2, r1, #0x1500
    bl func_ov002_021bae7c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_17c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000014ff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
